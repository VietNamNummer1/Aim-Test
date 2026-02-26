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
	local conn = run.RenderStepped:Connect(function(dt)
		hue = (hue + dt*0.5)%1
		txt.TextColor3 = hsv(hue,1,1)
	end)
	txt.Text = "Introducing"
	for i=1,0,-0.05 do txt.TextTransparency = i task.wait(0.05) end
	task.wait(0.5)
	for i=0,1,0.05 do txt.TextTransparency = i task.wait(0.05) end
	txt.Text = "Angel.LOL"
	for i=1,0,-0.05 do txt.TextTransparency = i task.wait(0.05) end
	task.wait(0.5)
	for i=0,1,0.05 do txt.TextTransparency = i task.wait(0.05) end
	conn:Disconnect()
	scr:Destroy()
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

	local titleBar = Instance.new("Frame",main) titleBar.Size = UDim2.new(1,0,0,62) titleBar.BackgroundColor3 = Color3.fromRGB(22,22,28)
	Instance.new("UICorner",titleBar).CornerRadius = UDim.new(0,16)
	local title = Instance.new("TextLabel",titleBar) title.Size = UDim2.new(1,-70,1,0) title.Position = UDim2.new(0,25,0,0)
	title.BackgroundTransparency = 1 title.Text = "ANGEL.LOL v3.0" title.Font = Enum.Font.GothamBlack title.TextSize = 29 title.TextColor3 = Color3.new(1,1,1)
	run.RenderStepped:Connect(function(dt) local h=(tick()*0.8)%1 title.TextColor3 = hsv(h,0.95,1) end)

	local dragging,dragStart,startPos = false
	titleBar.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true dragStart=i.Position startPos=main.Position end end)
	uis.InputChanged:Connect(function(i) if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then local delta = i.Position-dragStart main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y) end end)
	titleBar.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false if setshared then setshared(savedKey,main.Position) end end end)

	local close = Instance.new("TextButton",titleBar) close.Size = UDim2.new(0,40,0,40) close.Position = UDim2.new(1,-50,0.5,-20) close.BackgroundTransparency=1 close.Text="✕" close.TextColor3=Color3.fromRGB(255,80,80) close.TextSize=32
	close.MouseButton1Click:Connect(function() scr:Destroy() end)

	local content = Instance.new("Frame",main) content.Size = UDim2.new(1,-40,1,-90) content.Position = UDim2.new(0,20,0,75) content.BackgroundTransparency = 1

	local toggle = Instance.new("TextButton",content) toggle.Size = UDim2.new(1,0,0,80) toggle.Position = UDim2.new(0,0,0,0)
	toggle.BackgroundColor3 = Color3.fromRGB(30,30,35) toggle.Text = "LOCK CAMERA" toggle.TextColor3 = Color3.new(1,1,1) toggle.Font = Enum.Font.GothamBlack toggle.TextSize = 26
	Instance.new("UICorner",toggle).CornerRadius = UDim.new(0,14)
	toggle.MouseButton1Click:Connect(function()
		locked = not locked
		if locked then
			tgt = getClosest()
			toggle.BackgroundColor3 = Color3.fromRGB(0,180,80)
			toggle.Text = "LOCKING ACTIVE"
			createHighlight()
			notify("LOCKED: "..(tgt and tgt.Name or "None"), Color3.fromRGB(0,255,100))
		else
			tgt = nil
			toggle.BackgroundColor3 = Color3.fromRGB(30,30,35)
			toggle.Text = "LOCK CAMERA"
			removeHighlight()
			notify("UNLOCKED", Color3.fromRGB(255,100,100))
		end
	end)

	local y = 100
	local function addToggle(txt, val, callback)
		local b = Instance.new("TextButton",content)
		b.Size = UDim2.new(1,0,0,50)
		b.Position = UDim2.new(0,0,0,y)
		b.BackgroundColor3 = val and Color3.fromRGB(0,162,255) or Color3.fromRGB(35,35,40)
		b.Text = txt
		b.TextColor3 = Color3.new(1,1,1)
		b.Font = Enum.Font.GothamBold
		b.TextSize = 18
		Instance.new("UICorner",b).CornerRadius = UDim.new(0,12)
		b.MouseButton1Click:Connect(function()
			val = not val
			b.BackgroundColor3 = val and Color3.fromRGB(0,162,255) or Color3.fromRGB(35,35,40)
			callback(val)
		end)
		y = y + 60
		return b
	end

	addToggle("Team Check", teamCheck, function(v) teamCheck = v end)
	addToggle("Prediction", usePrediction, function(v) usePrediction = v end)
	addToggle("FOV Circle", showFov, function(v) showFov = v end)
	addToggle("Highlight ESP", highlightESP, function(v) highlightESP = v if not v then removeHighlight() end end)

	local fovTitle = Instance.new("TextLabel",content) fovTitle.Size = UDim2.new(1,0,0,25) fovTitle.Position = UDim2.new(0,0,0,y) fovTitle.BackgroundTransparency=1 fovTitle.Text="FOV: "..fov fovTitle.TextColor3=Color3.fromRGB(180,180,180) fovTitle.Font=Enum.Font.GothamMedium fovTitle.TextSize=16 y=y+30
	local fovMinus = Instance.new("TextButton",content) fovMinus.Size=UDim2.new(0.2,0,0,45) fovMinus.Position=UDim2.new(0,0,0,y) fovMinus.Text="-" fovMinus.BackgroundColor3=Color3.fromRGB(35,35,40) fovMinus.TextSize=24 Instance.new("UICorner",fovMinus).CornerRadius=UDim.new(0,12)
	fovMinus.MouseButton1Click:Connect(function() fov=math.max(40,fov-10) fovTitle.Text="FOV: "..fov end)
	local fovPlus = Instance.new("TextButton",content) fovPlus.Size=UDim2.new(0.2,0,0,45) fovPlus.Position=UDim2.new(0.8,0,0,y) fovPlus.Text="+" fovPlus.BackgroundColor3=Color3.fromRGB(35,35,40) fovPlus.TextSize=24 Instance.new("UICorner",fovPlus).CornerRadius=UDim.new(0,12)
	fovPlus.MouseButton1Click:Connect(function() fov=math.min(300,fov+10) fovTitle.Text="FOV: "..fov end)
	y=y+60

	local predTitle = Instance.new("TextLabel",content) predTitle.Size = UDim2.new(1,0,0,25) predTitle.Position = UDim2.new(0,0,0,y) predTitle.BackgroundTransparency=1 predTitle.Text="Prediction: "..prediction predTitle.TextColor3=Color3.fromRGB(180,180,180) predTitle.Font=Enum.Font.GothamMedium predTitle.TextSize=16 y=y+30
	local predMinus = Instance.new("TextButton",content) predMinus.Size=UDim2.new(0.2,0,0,45) predMinus.Position=UDim2.new(0,0,0,y) predMinus.Text="-" predMinus.BackgroundColor3=Color3.fromRGB(35,35,40) predMinus.TextSize=24 Instance.new("UICorner",predMinus).CornerRadius=UDim.new(0,12)
	predMinus.MouseButton1Click:Connect(function() prediction=math.max(0,prediction-0.02) predTitle.Text="Prediction: "..string.format("%.2f",prediction) end)
	local predPlus = Instance.new("TextButton",content) predPlus.Size=UDim2.new(0.2,0,0,45) predPlus.Position=UDim2.new(0.8,0,0,y) predPlus.Text="+" predPlus.BackgroundColor3=Color3.fromRGB(35,35,40) predPlus.TextSize=24 Instance.new("UICorner",predPlus).CornerRadius=UDim.new(0,12)
	predPlus.MouseButton1Click:Connect(function() prediction=math.min(0.3,prediction+0.02) predTitle.Text="Prediction: "..string.format("%.2f",prediction) end)

	run.RenderStepped:Connect(function()
		if fovCircle then
			fovCircle.Visible = showFov
			fovCircle.Position = cam.ViewportSize/2
			fovCircle.Radius = (fov / cam.FieldOfView) * (cam.ViewportSize.Y / 2) * 1.1
		end

		if locked then
			if not tgt or not alive(tgt) then tgt = getClosest() if highlightESP then createHighlight() end end
			if tgt and alive(tgt) then
				local prt = tgt.Character:FindFirstChild(lockPart) or tgt.Character:FindFirstChild("Head")
				if prt then
					local targetPos = prt.Position
					if usePrediction then targetPos = targetPos + (prt.Velocity * prediction) end
					local targetCF = CFrame.new(cam.CFrame.Position, targetPos)
					cam.CFrame = cam.CFrame:Lerp(targetCF, smoothness)
				end
			end
		end
	end)

	uis.InputBegan:Connect(function(i)
		if i.KeyCode == Enum.KeyCode.RightShift then
			locked = not locked
			if locked then
				tgt = getClosest()
				if highlightESP then createHighlight() end
				notify("LOCKED: "..(tgt and tgt.Name or "None"))
			else
				removeHighlight()
				notify("UNLOCKED")
			end
		end
	end)
end

createFOV()
intro()
makeUI()
notify("Angel.LOL v3.0 LOADED", Color3.fromRGB(0,255,255))	elseif i==2 then return Color3.new(p,v,t)
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
	if currentHighlight then currentHighlight:Destroy() currentHighlight = nil end
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
	local conn = run.RenderStepped:Connect(function(dt)
		hue = (hue + dt*0.5)%1
		txt.TextColor3 = hsv(hue,1,1)
	end)
	txt.Text = "Introducing"
	for i=1,0,-0.05 do txt.TextTransparency = i task.wait(0.05) end
	task.wait(0.5)
	for i=0,1,0.05 do txt.TextTransparency = i task.wait(0.05) end
	txt.Text = "Angel.LOL"
	for i=1,0,-0.05 do txt.TextTransparency = i task.wait(0.05) end
	task.wait(0.5)
	for i=0,1,0.05 do txt.TextTransparency = i task.wait(0.05) end
	conn:Disconnect()
	scr:Destroy()
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

	local titleBar = Instance.new("Frame",main) titleBar.Size = UDim2.new(1,0,0,62) titleBar.BackgroundColor3 = Color3.fromRGB(22,22,28)
	Instance.new("UICorner",titleBar).CornerRadius = UDim.new(0,16)
	local title = Instance.new("TextLabel",titleBar) title.Size = UDim2.new(1,-70,1,0) title.Position = UDim2.new(0,25,0,0)
	title.BackgroundTransparency = 1 title.Text = "ANGEL.LOL v3.0" title.Font = Enum.Font.GothamBlack title.TextSize = 29 title.TextColor3 = Color3.new(1,1,1)
	run.RenderStepped:Connect(function(dt) local h=(tick()*0.8)%1 title.TextColor3 = hsv(h,0.95,1) end)

	local dragging,dragStart,startPos = false
	titleBar.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true dragStart=i.Position startPos=main.Position end end)
	uis.InputChanged:Connect(function(i) if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then local delta = i.Position-dragStart main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y) end end)
	titleBar.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false if setshared then setshared(savedKey,main.Position) end end end)

	local close = Instance.new("TextButton",titleBar) close.Size = UDim2.new(0,40,0,40) close.Position = UDim2.new(1,-50,0.5,-20) close.BackgroundTransparency=1 close.Text="✕" close.TextColor3=Color3.fromRGB(255,80,80) close.TextSize=32
	close.MouseButton1Click:Connect(function() scr:Destroy() end)

	local content = Instance.new("Frame",main) content.Size = UDim2.new(1,-40,1,-90) content.Position = UDim2.new(0,20,0,75) content.BackgroundTransparency = 1

	local toggle = Instance.new("TextButton",content) toggle.Size = UDim2.new(1,0,0,80) toggle.Position = UDim2.new(0,0,0,0)
	toggle.BackgroundColor3 = Color3.fromRGB(30,30,35) toggle.Text = "LOCK CAMERA" toggle.TextColor3 = Color3.new(1,1,1) toggle.Font = Enum.Font.GothamBlack toggle.TextSize = 26
	Instance.new("UICorner",toggle).CornerRadius = UDim.new(0,14)
	toggle.MouseButton1Click:Connect(function()
		locked = not locked
		if locked then
			tgt = getClosest()
			toggle.BackgroundColor3 = Color3.fromRGB(0,180,80)
			toggle.Text = "LOCKING ACTIVE"
			createHighlight()
			notify("LOCKED: "..(tgt and tgt.Name or "None"), Color3.fromRGB(0,255,100))
		else
			tgt = nil
			toggle.BackgroundColor3 = Color3.fromRGB(30,30,35)
			toggle.Text = "LOCK CAMERA"
			removeHighlight()
			notify("UNLOCKED", Color3.fromRGB(255,100,100))
		end
	end)

	local y = 100
	local function addToggle(txt, val, callback)
		local b = Instance.new("TextButton",content)
		b.Size = UDim2.new(1,0,0,50)
		b.Position = UDim2.new(0,0,0,y)
		b.BackgroundColor3 = val and Color3.fromRGB(0,162,255) or Color3.fromRGB(35,35,40)
		b.Text = txt
		b.TextColor3 = Color3.new(1,1,1)
		b.Font = Enum.Font.GothamBold
		b.TextSize = 18
		Instance.new("UICorner",b).CornerRadius = UDim.new(0,12)
		b.MouseButton1Click:Connect(function()
			val = not val
			b.BackgroundColor3 = val and Color3.fromRGB(0,162,255) or Color3.fromRGB(35,35,40)
			callback(val)
		end)
		y = y + 60
		return b
	end

	addToggle("Team Check", teamCheck, function(v) teamCheck = v end)
	addToggle("Visible Only", visCheck, function(v) visCheck = v end)
	addToggle("Prediction", usePrediction, function(v) usePrediction = v end)
	addToggle("FOV Circle", showFov, function(v) showFov = v end)
	addToggle("Highlight ESP", highlightESP, function(v) highlightESP = v if not v then removeHighlight() end end)

	local fovTitle = Instance.new("TextLabel",content) fovTitle.Size = UDim2.new(1,0,0,25) fovTitle.Position = UDim2.new(0,0,0,y) fovTitle.BackgroundTransparency=1 fovTitle.Text="FOV: "..fov fovTitle.TextColor3=Color3.fromRGB(180,180,180) fovTitle.Font=Enum.Font.GothamMedium fovTitle.TextSize=16 y=y+30
	local fovMinus = Instance.new("TextButton",content) fovMinus.Size=UDim2.new(0.2,0,0,45) fovMinus.Position=UDim2.new(0,0,0,y) fovMinus.Text="-" fovMinus.BackgroundColor3=Color3.fromRGB(35,35,40) fovMinus.TextSize=24 Instance.new("UICorner",fovMinus).CornerRadius=UDim.new(0,12)
	fovMinus.MouseButton1Click:Connect(function() fov=math.max(40,fov-10) fovTitle.Text="FOV: "..fov end)
	local fovPlus = Instance.new("TextButton",content) fovPlus.Size=UDim2.new(0.2,0,0,45) fovPlus.Position=UDim2.new(0.8,0,0,y) fovPlus.Text="+" fovPlus.BackgroundColor3=Color3.fromRGB(35,35,40) fovPlus.TextSize=24 Instance.new("UICorner",fovPlus).CornerRadius=UDim.new(0,12)
	fovPlus.MouseButton1Click:Connect(function() fov=math.min(300,fov+10) fovTitle.Text="FOV: "..fov end)
	y=y+60

	local predTitle = Instance.new("TextLabel",content) predTitle.Size = UDim2.new(1,0,0,25) predTitle.Position = UDim2.new(0,0,0,y) predTitle.BackgroundTransparency=1 predTitle.Text="Prediction: "..prediction predTitle.TextColor3=Color3.fromRGB(180,180,180) predTitle.Font=Enum.Font.GothamMedium predTitle.TextSize=16 y=y+30
	local predMinus = Instance.new("TextButton",content) predMinus.Size=UDim2.new(0.2,0,0,45) predMinus.Position=UD(cam.CFrame.Position,prt.Position)
			end
		end
	end)
end

intro()
makeUI()
