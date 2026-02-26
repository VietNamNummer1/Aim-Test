--// Angel.LOL v3.0 - Ultimate Rainbow Camlock + GUI
-- Made for VN ❤️

local plrs = game:GetService("Players")
local run = game:GetService("RunService")
local uis = game:GetService("UserInputService")

local lp = plrs.LocalPlayer
local gui = lp:WaitForChild("PlayerGui")
local cam = workspace.CurrentCamera

local locked = false
local tgt = nil
local lockPart = "UpperTorso"
local smoothness = 0.25
local fov = 120
local showFov = true
local teamCheck = true
local visCheck = true
local usePrediction = true
local prediction = 0.12
local highlightESP = true
local savedKey = "ANGEL_UI_POS_V3"

local fovCircle
local currentHighlight = nil

local function hsv(h,s,v)
	local i = math.floor(h*6)
	local f = h*6 - i
	local p = v*(1-s)
	local q = v*(1-f*s)
	local t = v*(1-(1-f)*s)
	i = i%6
	if i==0 then return Color3.new(v,t,p)
	elseif i==1 then return Color3.new(q,v,p)
	elseif i==2 then return Color3.new(p,v,t)
	elseif i==3 then return Color3.new(p,q,v)
	elseif i==4 then return Color3.new(t,p,v)
	else return Color3.new(v,p,q) end
end

local function alive(p)
	if not p or not p.Character then return false end
	local h = p.Character:FindFirstChildOfClass("Humanoid")
	return h and h.Health > 0
end

local function createFOV()
	if fovCircle then fovCircle:Remove() end
	fovCircle = Drawing.new("Circle")
	fovCircle.Thickness = 2.5
	fovCircle.Color = Color3.fromRGB(0, 162, 255)
	fovCircle.Transparency = 0.75
	fovCircle.NumSides = 100
	fovCircle.Filled = false
end

local function createHighlight()
	if currentHighlight then currentHighlight:Destroy() end
	if tgt and tgt.Character then
		currentHighlight = Instance.new("Highlight")
		currentHighlight.Adornee = tgt.Character
		currentHighlight.FillColor = Color3.fromRGB(255, 0, 255)
		currentHighlight.OutlineColor = Color3.fromRGB(0, 255, 255)
		currentHighlight.FillTransparency = 0.6
		currentHighlight.OutlineTransparency = 0
		currentHighlight.Parent = tgt.Character
	end
end

local function removeHighlight()
	if currentHighlight then
		currentHighlight:Destroy()
		currentHighlight = nil
	end
end

local function notify(txt, col)
	local n = Instance.new("TextLabel", gui)
	n.Size = UDim2.new(0,280,0,50)
	n.Position = UDim2.new(0.5,-140,0,60)
	n.BackgroundColor3 = Color3.fromRGB(20,20,25)
	n.Text = txt
	n.TextColor3 = col or Color3.new(1,1,1)
	n.TextSize = 20
	n.Font = Enum.Font.GothamBlack
	Instance.new("UICorner",n).CornerRadius = UDim.new(0,12)
	Instance.new("UIStroke",n).Color = Color3.fromRGB(0,162,255)
	task.spawn(function()
		for i=1,30 do
			n.Position = n.Position + UDim2.new(0,0,-2,0)
			n.TextTransparency = i/30
			task.wait()
		end
		n:Destroy()
	end)
end

local function getClosest()
	local closest, dist
	local vp = cam.ViewportSize
	local mid = Vector2.new(vp.X/2, vp.Y/2)
	for _,p in pairs(plrs:GetPlayers()) do
		if p \~= lp and alive(p) then
			if teamCheck and p.Team == lp.Team then continue end
			local hrp = p.Character:FindFirstChild(lockPart) or p.Character:FindFirstChild("Head")
			if hrp then
				local pos, on = cam:WorldToViewportPoint(hrp.Position)
				if on then
					local m = (Vector2.new(pos.X,pos.Y)-mid).Magnitude
					if showFov and m > (fov/90)*vp.X/2 then continue end
					if not dist or m < dist then
						dist = m
						closest = p
					end
				end
			end
		end
	end
	return closest
end

local function intro() -- giữ nguyên intro v2
	-- (copy nguyên hàm intro từ v2.0 bạn đã có)
	local scr = Instance.new("ScreenGui",gui) scr.Name="ANGEL_INTRO" scr.ResetOnSpawn=false
	-- ... (giữ nguyên code intro để ngắn, bạn có thể paste lại từ v2)
	-- hoặc comment nếu không muốn intro nữa
end

local function makeUI()
	local scr = Instance.new("ScreenGui",gui)
	scr.Name = "ANGEL_UI"
	scr.ResetOnSpawn = false

	local main = Instance.new("Frame",scr)
	main.Size = UDim2.new(0,420,0,580)
	main.BackgroundColor3 = Color3.fromRGB(16,16,20)
	main.Position = UDim2.new(0,80,0,80)
	local corner = Instance.new("UICorner",main) corner.CornerRadius = UDim.new(0,16)
	local stroke = Instance.new("UIStroke",main) stroke.Color = Color3.fromRGB(0,162,255) stroke.Thickness = 3

	-- Title + drag + close (giữ nguyên v2)
	local titleBar = Instance.new("Frame",main) titleBar.Size = UDim2.new(1,0,0,62) titleBar.BackgroundColor3 = Color3.fromRGB(22,22,28)
	Instance.new("UICorner",titleBar).CornerRadius = UDim.new(0,16)
	local title = Instance.new("TextLabel",titleBar) title.Size = UDim2.new(1,-70,1,0) title.Position = UDim2.new(0,25,0,0)
	title.BackgroundTransparency = 1 title.Text = "ANGEL.LOL v3.0" title.Font = Enum.Font.GothamBlack title.TextSize = 29 title.TextColor3 = Color3.new(1,1,1)
	run.RenderStepped:Connect(function(dt) local h=(tick()*0.8)%1 title.TextColor3 = hsv(h,0.95,1) end)

	-- Dragging & save
	local dragging,dragStart,startPos = false
	titleBar.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true dragStart=i.Position startPos=main.Position end end)
	uis.InputChanged:Connect(function(i) if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then local delta = i.Position-dragStart main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y) end end)
	titleBar.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false if setshared then setshared(savedKey,main.Position) end end end)

	local close = Instance.new("TextButton",titleBar) close.Size = UDim2.new(0,40,0,40) close.Position = UDim2.new(1,-50,0.5,-20) close.BackgroundTransparency=1 close.Text="✕" close.TextColor3=Color3.fromRGB(255,80,80) close.TextSize=32
	close.MouseButton1Click:Connect(function() scr:Destroy() end)

	-- Content
	local content = Instance.new("Frame",main) content.Size = UDim2.new(1,-40,1,-90) content.Position = UDim2.new(0,20,0,75) content.BackgroundTransparency = 1

	-- Toggle Lock (giữ v2)
	local toggle = Instance.new("TextButton",content)	local closest,dist
	local vp = cam.ViewportSize
	local mid = Vector2.new(vp.X/2,vp.Y/2)
	for _,p in pairs(plrs:GetPlayers()) do
		if p\~=lp and alive(p) then
			local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local pos,on = cam:WorldToViewportPoint(hrp.Position)
				if on then
					local m = (Vector2.new(pos.X,pos.Y)-mid).Magnitude
					if not dist or m<dist then
						dist = m
						closest = p
					end
				end
			end
		end
	end
	return closest
end

local function respawnTrack(p,lbl)
	p.CharacterAdded:Connect(function()
		if p==tgt and locked then
			lbl.Text = "Target: "..p.Name.." (respawned)"
		end
	end)
end

local function intro()
	local scr = Instance.new("ScreenGui",gui)
	scr.Name = "ANGEL_INTRO"
	scr.ResetOnSpawn = false

	local f = Instance.new("Frame",scr)
	f.Size = UDim2.new(1,0,1,0)
	f.BackgroundColor3 = Color3.fromRGB(0,0,0)

	local txt = Instance.new("TextLabel",f)
	txt.AnchorPoint = Vector2.new(0.5,0.5)
	txt.Position = UDim2.new(0.5,0,0.5,0)
	txt.Size = UDim2.new(0.8,0,0.3,0)
	txt.Font = Enum.Font.GothamBlack
	txt.TextScaled = true
	txt.BackgroundTransparency = 1
	txt.TextTransparency = 1
	txt.Text = ""

	local hue = 0
	local conn
	conn = run.RenderStepped:Connect(function(dt)
		hue = (hue + dt*0.5)%1
		txt.TextColor3 = hsv(hue,1,1)
	end)

	txt.Text = "Introducing"
	for i=1,0,-0.05 do
		txt.TextTransparency = i
		task.wait(0.05)
	end
	task.wait(0.5)
	for i=0,1,0.05 do
		txt.TextTransparency = i
		task.wait(0.05)
	end

	txt.Text = "Angel.LOL"
	for i=1,0,-0.05 do
		txt.TextTransparency = i
		task.wait(0.05)
	end
	task.wait(0.5)
	for i=0,1,0.05 do
		txt.TextTransparency = i
		task.wait(0.05)
	end

	conn:Disconnect()
	scr:Destroy()
end

local function makeUI()
	local scr = Instance.new("ScreenGui",gui)
	scr.Name = "ANGEL_UI"
	scr.ResetOnSpawn = false

	local btn = Instance.new("TextButton",scr)
	btn.Size = UDim2.new(0,180,0,45)
	btn.BackgroundColor3 = Color3.fromRGB(25,25,25)
	btn.BorderColor3 = Color3.fromRGB(0,120,255)
	btn.BorderSizePixel = 3
	btn.Font = Enum.Font.GothamBlack
	btn.TextSize = 18
	btn.Text = "Angel.LOL"
	btn.TextColor3 = Color3.new(1,1,1)

	local save = getshared and getshared(savedKey)
	if save and typeof(save)=="UDim2" then
		btn.Position = save
	else
		btn.Position = UDim2.new(0,15,0,15)
	end

	local lbl = Instance.new("TextLabel",btn)
	lbl.AnchorPoint = Vector2.new(0,1)
	lbl.Position = UDim2.new(0,5,1,-3)
	lbl.Size = UDim2.new(1,-10,0,14)
	lbl.BackgroundTransparency = 1
	lbl.Font = Enum.Font.GothamMedium
	lbl.TextSize = 12
	lbl.TextColor3 = Color3.fromRGB(200,200,200)
	lbl.Text = "No target"

	local dragging=false
	local dragStart,posStart
	local activeTouch=nil

	local function upd(i)
		local d = i.Position - dragStart
		btn.Position = UDim2.new(posStart.X.Scale,posStart.X.Offset+d.X,posStart.Y.Scale,posStart.Y.Offset+d.Y)
	end

	btn.InputBegan:Connect(function(i)
		if (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1) and not activeTouch then
			activeTouch = i
			dragging=true
			dragStart=i.Position
			posStart=btn.Position

			local move,stop
			move = uis.InputChanged:Connect(function(m)
				if dragging and (m==activeTouch) then
					upd(m)
				end
			end)

			stop = i.Changed:Connect(function()
				if i.UserInputState==Enum.UserInputState.End then
					dragging=false
					activeTouch=nil
					move:Disconnect()
					stop:Disconnect()
					if setshared then setshared(savedKey,btn.Position) end
				end
			end)
		end
	end)

	btn.MouseButton1Click:Connect(function()
		locked=not locked
		if locked then
			tgt=getClosest()
			if tgt then
				lbl.Text="Target: "..tgt.Name
				respawnTrack(tgt,lbl)
			else
				lbl.Text="No valid target"
			end
		else
			tgt=nil
			lbl.Text="No target"
		end
	end)

	run.RenderStepped:Connect(function()
		local h=(tick()*0.25)%1
		btn.TextColor3=hsv(h,1,1)
		lbl.TextColor3=hsv((h+0.2)%1,1,1)

		if locked and tgt and alive(tgt) then
			local prt=tgt.Character:FindFirstChild("UpperTorso") or tgt.Character:FindFirstChild("Head")
			if prt then
				cam.CFrame=CFrame.new(cam.CFrame.Position,prt.Position)
			end
		end
	end)
end

intro()
makeUI()
