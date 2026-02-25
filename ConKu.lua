local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local CoreGui = game:GetService("CoreGui")

local MainEvent = ReplicatedStorage:WaitForChild("MainEvent")
local LocalPlayer = Players.LocalPlayer

local CamlockEnabled = false
local CamlockTarget = nil
local CamlockKey = Enum.KeyCode.C

local ForceHitEnabled = false
local ForceHitKey = Enum.KeyCode.V

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Blacklist

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CamlockNotifier"
ScreenGui.ResetOnSpawn = true
ScreenGui.Parent = CoreGui

local Notif = Instance.new("TextLabel")
Notif.AnchorPoint = Vector2.new(0.5, 0)
Notif.Position = UDim2.new(0.5, 0, 0.1, 0)
Notif.Size = UDim2.new(0, 220, 0, 40)
Notif.BackgroundTransparency = 0.3
Notif.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Notif.TextColor3 = Color3.fromRGB(255, 255, 255)
Notif.Font = Enum.Font.GothamBold
Notif.TextScaled = true
Notif.Visible = false
Notif.Parent = ScreenGui

local function Notify(msg)
    Notif.Text = msg
    Notif.Visible = true
    Notif.TextTransparency = 0
    TweenService:Create(Notif, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.delay(2, function()
        TweenService:Create(Notif, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    end)
end

local function isKO(p)
    local c = p.Character
    if not c then return true end
    local h = c:FindFirstChild("Humanoid")
    local b = c:FindFirstChild("BodyEffects")
    return (h and h.Health <= 0)
        or (b and b:FindFirstChild("K.O") and b["K.O"].Value)
end

local function blocked(a, b, ignore)
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = ignore
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist

    local result = workspace:Raycast(a, b - a, rayParams)
    if result and result.Instance then
        local part = result.Instance
        
        if part.CanCollide and not part:IsDescendantOf(Players) then
            local normal = result.Normal
            if math.abs(normal.Y) < 0.5 then 
                return true
            end
        end
    end
    return false
end


local function GetClosest()
    local closest
    local mousePos = UserInputService:GetMouseLocation()
    local minDist = math.huge

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local c = p.Character
            local sp = c and c:FindFirstChild("SpecialParts")
            local head = sp and sp:FindFirstChild("Head")
            if head then
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local d = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
                    if d < minDist then
                        minDist = d
                        closest = p
                    end
                end
            end
        end
    end

    return closest
end

local args = {
    {}, {}, Vector3.zero, Vector3.zero, 0
}
for i = 1, 5 do
    args[1][i] = {Normal = Vector3.zero, Instance = nil, Position = Vector3.zero}
    args[2][i] = {thePart = nil, theOffset = Vector3.zero}
end

local function Shoot(p)
    local c = p.Character
    if not c or isKO(p) or c:FindFirstChildOfClass("ForceField") then return end

    local sp = c:FindFirstChild("SpecialParts")
    local head = sp and sp:FindFirstChild("Head")
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not head or not root then return end

    local rp, hp = root.Position, head.Position
    if (hp - rp).Magnitude > 205 then return end

    if blocked(rp, hp, {LocalPlayer.Character, c}) then return end

    for i = 1, 5 do
        local b = args[1][i]
        b.Normal, b.Instance, b.Position = hp, head, hp
        args[2][i].thePart = head
    end

    args[3], args[4], args[5] = rp, rp, workspace:GetServerTimeNow()
    MainEvent:FireServer("Shoot", args)
end


UserInputService.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == CamlockKey then
        if CamlockEnabled then
            CamlockEnabled = false
            CamlockTarget = nil
            Notify("Camlock OFF")
        else
            local target = GetClosest()
            if target then
                CamlockTarget = target
                CamlockEnabled = true
                Notify("Camlock ON")
            end
        end
    end
    if i.KeyCode == ForceHitKey then
        ForceHitEnabled = not ForceHitEnabled
        Notify("ForceHit "..(ForceHitEnabled and "ON" or "OFF"))
    end
end)

RunService.RenderStepped:Connect(function()
    if not CamlockEnabled or not CamlockTarget then return end

    local c = CamlockTarget.Character
    local sp = c and c:FindFirstChild("SpecialParts")
    local head = sp and sp:FindFirstChild("Head")
    local hum = c and c:FindFirstChild("Humanoid")

    if not head or not hum or hum.Health <= 0 then
        CamlockEnabled = true
        CamlockTarget = nil
        return
    end

    Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)

    if ForceHitEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
        Shoot(CamlockTarget)
    end
end)