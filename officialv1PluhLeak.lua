-- ts file was generated at discord.gg/25ms

if true then
    local v1, v2, v3 = pairs(workspace:GetDescendants())

    while true do
        local v4, v5 = v1(v2, v3)

        if v4 == nil then
            break
        end

        v3 = v4

        if v5.ClassName == 'Part' or (v5.ClassName == 'SpawnLocation' or (v5.ClassName == 'WedgePart' or (v5.ClassName == 'Terrain' or v5.ClassName == 'MeshPart'))) then
            v5.Material = 'Plastic'
            v5.CastShadow = false
        end
    end

    local v6 = game
    local _Workspace = v6.Workspace

    v6:GetService('Lighting')

    local _Terrain = _Workspace:WaitForChild('Terrain')
    local v9 = game
    local _Workspace2 = v9.Workspace
    local _Lighting = v9.Lighting
    local _ = _Workspace2.Terrain

    _Terrain.WaterWaveSize = 0
    _Terrain.WaterWaveSpeed = 0
    _Terrain.WaterReflectance = 0
    _Terrain.WaterTransparency = 1
    game.workspace.StreamingEnabled = true

    local v12, v13, v14 = ipairs(game.Workspace:GetDescendants())

    while true do
        local v15, v16 = v12(v13, v14)

        if v15 == nil then
            break
        end

        v14 = v15

        if v16:IsA('Decal') then
            v16:Destroy()
        end
    end

    settings().Rendering.QualityLevel = 'Level01'

    local v17, v18, v19 = pairs(v9:GetDescendants())

    while true do
        local v20, v21 = v17(v18, v19)

        if v20 == nil then
            break
        end

        v19 = v20

        if v21:IsA('Part') or (v21:IsA('Union') or (v21:IsA('CornerWedgePart') or v21:IsA('TrussPart'))) then
            v21.Reflectance = 0
            v21.CastShadow = false
        elseif v21:IsA('Decal') or v21:IsA('Texture') then
            v21.Transparency = 0
        elseif v21:IsA('ParticleEmitter') or v21:IsA('Trail') then
            v21.Lifetime = NumberRange.new(0)
        elseif v21:IsA('Explosion') then
            v21.BlastPressure = 0
            v21.BlastRadius = 0
        elseif v21:IsA('Fire') or (v21:IsA('Smoke') or v21:IsA('Sparkles')) then
            v21.Enabled = false
        elseif v21:IsA('MeshPart') then
            v21.Reflectance = 0
            v21.CastShadow = false
        end
        if v21:IsA('Fire') or v21:IsA('ParticleEmitter') then
            v21:Destroy()
            wait()
        end
    end

    local v22, v23, v24 = pairs(_Lighting:GetChildren())

    while true do
        local v25, v26 = v22(v23, v24)

        if v25 == nil then
            break
        end

        v24 = v25

        if v26:IsA('BlurEffect') or (v26:IsA('SunRaysEffect') or (v26:IsA('ColorCorrectionEffect') or (v26:IsA('BloomEffect') or v26:IsA('DepthOfFieldEffect')))) then
            v26.Enabled = false
        end
    end

    _Lighting.ShadowSoftness = 0
    _Lighting.GlobalShadows = false

    sethiddenproperty(game.Lighting, 'Technology', 'Compatibility')
    sethiddenproperty(game:GetService('Lighting'), 'Technology', Enum.Technology.Voxel)
    sethiddenproperty(workspace:FindFirstChildOfClass('Terrain'), 'Decoration', false)

    workspace:FindFirstChildOfClass('Terrain').WaterWaveSize = 0
    workspace:FindFirstChildOfClass('Terrain').WaterWaveSpeed = 0
    workspace:FindFirstChildOfClass('Terrain').WaterReflectance = 0
    workspace:FindFirstChildOfClass('Terrain').WaterTransparency = 0
end

local _ScreenGui = Instance.new('ScreenGui', game.CoreGui)
local _ = game.Workspace.CurrentCamera.ViewportSize.X
local _Frame = Instance.new('Frame', _ScreenGui)

_Frame.Size = UDim2.new(0.6, 0, 0, 150)
_Frame.Position = UDim2.new(0.5, 0, 0.6, 0)
_Frame.BackgroundTransparency = 1
_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
_Frame.ClipsDescendants = true
_Frame.ZIndex = 2

local _TextLabel = Instance.new('TextLabel', _Frame)

_TextLabel.Size = UDim2.new(1, 0, 0.4, 0)
_TextLabel.Position = UDim2.new(0.5, 0, 0.1, 0)
_TextLabel.AnchorPoint = Vector2.new(0.5, 0)
_TextLabel.BackgroundTransparency = 1
_TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
_TextLabel.Text = 'P'
_TextLabel.Font = Enum.Font.GothamBlack
_TextLabel.TextScaled = true
_TextLabel.TextWrapped = true
_TextLabel.TextStrokeTransparency = 0
_TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
_TextLabel.TextXAlignment = Enum.TextXAlignment.Center
_TextLabel.TextYAlignment = Enum.TextYAlignment.Center
_TextLabel.ZIndex = 3

local _Frame2 = Instance.new('Frame', _Frame)

_Frame2.Size = UDim2.new(0.9, 0, 0.01, 0)
_Frame2.Position = UDim2.new(0.5, 0, 0.55, 0)
_Frame2.AnchorPoint = Vector2.new(0.5, 0)
_Frame2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
_Frame2.ZIndex = 3

local _TextLabel2 = Instance.new('TextLabel', _Frame)

_TextLabel2.Size = UDim2.new(1, 0, 0.3, 0)
_TextLabel2.Position = UDim2.new(0.5, 0, 0.65, 0)
_TextLabel2.AnchorPoint = Vector2.new(0.5, 0)
_TextLabel2.BackgroundTransparency = 1
_TextLabel2.TextColor3 = Color3.fromRGB(0, 0, 0)
_TextLabel2.Text = 'discord.gg/n6VhAuyFUq'
_TextLabel2.Font = Enum.Font.Gotham
_TextLabel2.TextScaled = true
_TextLabel2.TextWrapped = true
_TextLabel2.TextStrokeTransparency = 0
_TextLabel2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
_TextLabel2.TextXAlignment = Enum.TextXAlignment.Center
_TextLabel2.TextYAlignment = Enum.TextYAlignment.Center
_TextLabel2.ZIndex = 3

local v32 = _Frame

_Frame.TweenSizeAndPosition(v32, UDim2.new(0.6, 0, 0, 150), UDim2.new(0.5, 0, 0.6, -75), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)

local _Sound = Instance.new('Sound', game:GetService('SoundService'))

_Sound.SoundId = 'rbxassetid://9119802009'
_Sound.Volume = 6

_Sound:Play()
_Sound.Ended:Wait()
delay(7, function()
    _Frame:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.6, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true, function()
        _ScreenGui:Destroy()
    end)
end)

local _Sound2 = Instance.new('Sound', game:GetService('SoundService'))

_Sound2.SoundId = 'rbxassetid://9045766377'
_Sound2.Volume = 3
_Sound2.Looped = true

local v35 = _Sound2

_Sound2.Play(v35)
delay(10, function()
    _Sound2:Destroy()
end)

local _ScreenGui2 = Instance.new('ScreenGui')
local _ScreenGui3 = Instance.new('ScreenGui')
local _Frame3 = Instance.new('Frame')
local _ImageLabel = Instance.new('ImageLabel')
local _TextLabel3 = Instance.new('TextLabel')
local _Frame4 = Instance.new('Frame')
local _TextButton = Instance.new('TextButton')
local _TextButton2 = Instance.new('TextButton')
local _TextBox = Instance.new('TextBox')
local _ScrollingFrame = Instance.new('ScrollingFrame')
local _TextButton3 = Instance.new('TextButton')
local _TextButton4 = Instance.new('TextButton')
local _TextButton5 = Instance.new('TextButton')
local _Frame5 = Instance.new('Frame')
local _TextBox2 = Instance.new('TextBox')
local _TextButton6 = Instance.new('TextButton')
local _TextButton7 = Instance.new('TextButton')
local _Frame6 = Instance.new('Frame')

game:GetService('UserInputService')

local _StarterGui = game:GetService('StarterGui')
local _LocalPlayer = game:GetService('Players').LocalPlayer

_ScreenGui2.Name = 'SettingsGui'
_ScreenGui2.Parent = game:GetService('CoreGui')
_Frame3.Name = 'MainFrame'
_Frame3.Parent = _ScreenGui2
_Frame3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_Frame3.Position = UDim2.new(0.5, -150, 0.5, -150)
_Frame3.Size = UDim2.new(0, 300, 0, 300)
_Frame3.BorderSizePixel = 2
_Frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
_Frame3.ClipsDescendants = true
_Frame3.Active = true
_Frame3.Draggable = true
_Frame3.Visible = false
_ImageLabel.Name = 'BackgroundImage'
_ImageLabel.Parent = _Frame3
_ImageLabel.BackgroundTransparency = 1
_ImageLabel.Size = UDim2.new(1, 0, 1, 0)
_ImageLabel.Image = 'rbxassetid://5553946656'
_ImageLabel.ImageColor3 = Color3.fromRGB(20, 20, 20)
_TextLabel3.Name = 'Title'
_TextLabel3.Parent = _Frame3
_TextLabel3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
_TextLabel3.Size = UDim2.new(1, 0, 0, 40)
_TextLabel3.Font = Enum.Font.GothamBold
_TextLabel3.Text = 'Cfgs Menu'
_TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextLabel3.TextSize = 24
_TextLabel3.TextStrokeTransparency = 0
_TextLabel3.BorderSizePixel = 0
_Frame4.Name = 'RedLine'
_Frame4.Parent = _Frame3
_Frame4.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
_Frame4.Position = UDim2.new(0, 0, 0, 40)
_Frame4.Size = UDim2.new(1, 0, 0, 2)
_Frame4.BorderSizePixel = 0
_TextButton3.Name = 'CloseButton'
_TextButton3.Parent = _Frame3
_TextButton3.BackgroundTransparency = 1
_TextButton3.Position = UDim2.new(0, 5, 0, 5)
_TextButton3.Size = UDim2.new(0.1, 0, 0.1, 0)
_TextButton3.Text = 'X'
_TextButton3.Font = Enum.Font.GothamBold
_TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton3.TextSize = 18
_TextButton3.BorderSizePixel = 0
_TextBox.Name = 'FileNameTextBox'
_TextBox.Parent = _Frame3
_TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_TextBox.Position = UDim2.new(0.1, 0, 0.15, 0)
_TextBox.Size = UDim2.new(0.8, 0, 0, 30)
_TextBox.Font = Enum.Font.Gotham
_TextBox.PlaceholderText = 'Enter file name'
_TextBox.Text = ''
_TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextBox.TextSize = 18
_TextBox.BorderSizePixel = 0
_ScrollingFrame.Name = 'DropDown'
_ScrollingFrame.Parent = _Frame3
_ScrollingFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_ScrollingFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
_ScrollingFrame.Size = UDim2.new(0.8, 0, 0.2, 0)
_ScrollingFrame.Visible = true
_ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
_ScrollingFrame.ScrollBarThickness = 8
_ScrollingFrame.BorderSizePixel = 0
_TextButton.Name = 'SaveButton'
_TextButton.Parent = _Frame3
_TextButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
_TextButton.Position = UDim2.new(0.1, 0, 0.55, 0)
_TextButton.Size = UDim2.new(0.35, 0, 0, 40)
_TextButton.Font = Enum.Font.GothamBold
_TextButton.Text = 'Save'
_TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton.TextSize = 18
_TextButton.BorderSizePixel = 2
_TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
_TextButton2.Name = 'LoadButton'
_TextButton2.Parent = _Frame3
_TextButton2.BackgroundColor3 = Color3.fromRGB(0, 0, 170)
_TextButton2.Position = UDim2.new(0.55, 0, 0.55, 0)
_TextButton2.Size = UDim2.new(0.35, 0, 0, 40)
_TextButton2.Font = Enum.Font.GothamBold
_TextButton2.Text = 'Load'
_TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton2.TextSize = 18
_TextButton2.BorderSizePixel = 2
_TextButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
_TextButton4.Name = 'RenameButton'
_TextButton4.Parent = _Frame3
_TextButton4.BackgroundColor3 = Color3.fromRGB(170, 170, 0)
_TextButton4.Position = UDim2.new(0.1, 0, 0.7, 0)
_TextButton4.Size = UDim2.new(0.35, 0, 0, 40)
_TextButton4.Font = Enum.Font.GothamBold
_TextButton4.Text = 'Rename'
_TextButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton4.TextSize = 18
_TextButton4.BorderSizePixel = 2
_TextButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
_TextButton5.Name = 'DeleteButton'
_TextButton5.Parent = _Frame3
_TextButton5.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
_TextButton5.Position = UDim2.new(0.55, 0, 0.7, 0)
_TextButton5.Size = UDim2.new(0.35, 0, 0, 40)
_TextButton5.Font = Enum.Font.GothamBold
_TextButton5.Text = 'Delete'
_TextButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton5.TextSize = 18
_TextButton5.BorderSizePixel = 2
_TextButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
_ScreenGui3.Name = 'FileContentGui'
_ScreenGui3.Parent = game:GetService('CoreGui')
_Frame6.Name = 'FileContentDragFrame'
_Frame6.Parent = _ScreenGui3
_Frame6.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_Frame6.Position = UDim2.new(0.75, -150, 0.5, -150)
_Frame6.Size = UDim2.new(0, 300, 0, 30)
_Frame6.BorderSizePixel = 2
_Frame6.BorderColor3 = Color3.fromRGB(0, 0, 0)
_Frame6.Active = true
_Frame6.Draggable = true
_TextButton7.Name = 'FileContentCloseButton'
_TextButton7.Parent = _Frame6
_TextButton7.BackgroundTransparency = 1
_TextButton7.Position = UDim2.new(1, -25, 0, 5)
_TextButton7.Size = UDim2.new(0, 20, 0, 20)
_TextButton7.Text = 'X'
_TextButton7.Font = Enum.Font.GothamBold
_TextButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton7.TextSize = 18
_TextButton7.BorderSizePixel = 0
_Frame5.Name = 'FileContentFrame'
_Frame5.Parent = _Frame6
_Frame5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_Frame5.Position = UDim2.new(0, 0, 1, 0)
_Frame5.Size = UDim2.new(1, 0, 0, 200)
_Frame5.BorderSizePixel = 2
_Frame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
_TextBox2.Name = 'FileContentTextBox'
_TextBox2.Parent = _Frame5
_TextBox2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_TextBox2.Position = UDim2.new(0, 0, 0, 0)
_TextBox2.Size = UDim2.new(1, 0, 0.8, 0)
_TextBox2.Font = Enum.Font.Gotham
_TextBox2.PlaceholderText = 'File content will appear here'
_TextBox2.Text = ''
_TextBox2.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextBox2.TextSize = 14
_TextBox2.BorderSizePixel = 0
_TextBox2.TextYAlignment = Enum.TextYAlignment.Top
_TextBox2.TextWrapped = true
_TextBox2.MultiLine = true
_TextBox2.ClearTextOnFocus = false
_TextButton6.Name = 'SaveContentButton'
_TextButton6.Parent = _Frame5
_TextButton6.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
_TextButton6.Position = UDim2.new(0, 0, 0.8, 0)
_TextButton6.Size = UDim2.new(1, 0, 0.2, 0)
_TextButton6.Font = Enum.Font.GothamBold
_TextButton6.Text = 'Save Cfg'
_TextButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton6.TextSize = 18
_TextButton6.BorderSizePixel = 2
_TextButton6.BorderColor3 = Color3.fromRGB(0, 0, 0)
_Frame5.Visible = false
_Frame6.Visible = false

function identifyexploit()
    local v56, v57 = pcall(identifyexecutor)

    if v56 then
        return v57
    end

    local v58 = SENTINEL_LOADED and 'Sentinel' or (XPROTECT and 'SirHurt' or PROTOSMASHER_LOADED and 'Protosmasher')

    if not v58 then
        local v59 = FLUXUS_LOADED

        v58 = v59 and 'Fluxus' or v59
    end

    return v58
end

local u60 = identifyexploit()
local u61 = u60 == 'Fluxus' and '' or 'Pluh_V1'
local u62 = false
local u63 = nil
local u64 = false
local u65 = false

local function u70(p66)
    local v67 = {
        PredictionValue = getgenv().PredictionValue,
        SelectedPart = getgenv().SelectedPart,
        OrbitRadius = getgenv().OrbitRadius,
        Orbit = getgenv().Orbit,
        OrbitSpeed = getgenv().OrbitSpeed,
        cam = getgenv().cam,
        AutoPredMath = getgenv().AutoPredMath,
        Spectate = getgenv().Spectate,
        Randomizer = getgenv().Randomizer,
        smoothness = getgenv().smoothness,
        camwallcheck = getgenv().camwallcheck,
        look = getgenv().look,
        AntiGround = getgenv().AntiGroundShots,
        Enabled = getgenv().Enabled,
        esp = getgenv().esp,
        Airshot = getgenv().Airshot,
        Autopred = getgenv().Autopred,
        AutoArmorEnabled = getgenv().AutoArmorEnabled,
        AutoPizzaEnabled = getgenv().AutoPizzaEnabled,
    }
    local v68 = game:GetService('HttpService'):JSONEncode(v67)
    local v69 = (u61 ~= '' and u61 .. '/' or '') .. p66 .. '.pluh_cfg'

    if isfile(v69) then
        _StarterGui:SetCore('SendNotification', {
            Title = 'Error',
            Text = 'File already exists!',
            Duration = 3,
        })
    else
        writefile(v69, v68)
    end
end

local _ScreenGui4 = Instance.new('ScreenGui')

_ScreenGui4.Parent = game.CoreGui

local _TextButton8 = Instance.new('TextButton')

_TextButton8.Parent = _ScreenGui4
_TextButton8.Text = 'P'
_TextButton8.Size = UDim2.new(0, 40, 0, 40)
_TextButton8.Position = UDim2.new(0, 10, 0.5, -20)
_TextButton8.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_TextButton8.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton8.Font = Enum.Font.GothamBold
_TextButton8.TextSize = 18
_TextButton8.BorderSizePixel = 0
_TextButton8.Active = true
_TextButton8.Draggable = true

local _UIStroke = Instance.new('UIStroke')

_UIStroke.Color = Color3.fromRGB(255, 255, 255)
_UIStroke.Thickness = 2
_UIStroke.Parent = _TextButton8
_TextButton8.Visible = false

if u61 ~= '' and not isfolder(u61) then
    makefolder(u61)
end

local function u87()
    local v74 = _ScrollingFrame
    local v75, v76, v77 = ipairs(v74:GetChildren())

    while true do
        local v78

        v77, v78 = v75(v76, v77)

        if v77 == nil then
            break
        end
        if v78:IsA('TextButton') then
            v78:Destroy()
        end
    end

    local v79 = listfiles(u61)

    _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #v79 * 30)

    local v80, v81, v82 = ipairs(v79)

    while true do
        local v83

        v82, v83 = v80(v81, v82)

        if v82 == nil then
            break
        end

        local _pluh_cfg = v83:match('([^/]+)%.pluh_cfg$')

        if _pluh_cfg then
            local _TextButton9 = Instance.new('TextButton')

            _TextButton9.Text = _pluh_cfg
            _TextButton9.Parent = _ScrollingFrame
            _TextButton9.Size = UDim2.new(1, 0, 0, 30)
            _TextButton9.Position = UDim2.new(0, 0, 0, (v82 - 1) * 30)
            _TextButton9.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            _TextButton9.Font = Enum.Font.SourceSans
            _TextButton9.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextButton9.TextSize = 18
            _TextButton9.BorderSizePixel = 0

            _TextButton9.MouseButton1Click:Connect(function()
                if u63 then
                    u63.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                end

                _TextButton9.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                u63 = _TextButton9
                _TextBox.Text = _pluh_cfg

                local v86 = (u61 ~= '' and u61 .. '/' or '') .. _pluh_cfg .. '.pluh_cfg'

                if isfile(v86) then
                    _TextBox2.Text = readfile(v86)
                    _Frame5.Visible = true
                end
            end)
        end
    end
end

function destroyLibraryGui()
    if Window and Window.Frame then
        Window.Frame:Destroy()
    end
end

_TextButton.MouseButton1Click:Connect(function()
    if u65 then
        _StarterGui:SetCore('SendNotification', {
            Title = 'Error',
            Text = 'Cannot save file after closing the GUI!',
            Duration = 3,
        })
    else
        local _Text = _TextBox.Text

        if _Text and _Text ~= '' then
            u70(_Text)
            u87()
            _StarterGui:SetCore('SendNotification', {
                Title = 'Success',
                Text = 'Settings saved successfully!',
                Duration = 3,
            })
        else
            _StarterGui:SetCore('SendNotification', {
                Title = 'Error',
                Text = 'Please enter a valid file name!',
                Duration = 3,
            })
        end
    end
end)
_TextButton4.MouseButton1Click:Connect(function()
    local v89 = u63

    if v89 then
        v89 = u63.Text
    end

    local _Text2 = _TextBox.Text

    if v89 and (_Text2 and _Text2 ~= '') then
        local v91 = (u61 ~= '' and u61 .. '/' or '') .. v89 .. '.pluh_cfg'
        local v92 = (u61 ~= '' and u61 .. '/' or '') .. _Text2 .. '.pluh_cfg'

        if isfile(v92) then
            _StarterGui:SetCore('SendNotification', {
                Title = 'Error',
                Text = 'New file name already exists!',
                Duration = 3,
            })
        elseif isfile(v91) then
            local v93 = readfile(v91)

            writefile(v92, v93)
            delfile(v91)
            _StarterGui:SetCore('SendNotification', {
                Title = 'Success',
                Text = 'File renamed successfully!',
                Duration = 3,
            })
            u87()

            _TextBox.Text = ''
            u63 = nil
            _Frame5.Visible = false
            _Frame6.Visible = false
        else
            _StarterGui:SetCore('SendNotification', {
                Title = 'Error',
                Text = 'File to rename does not exist!',
                Duration = 3,
            })
        end
    else
        _StarterGui:SetCore('SendNotification', {
            Title = 'Error',
            Text = 'Please select a file and enter a valid new file name!',
            Duration = 3,
        })
    end
end)
_TextButton5.MouseButton1Click:Connect(function()
    local v94 = u63

    if v94 then
        v94 = u63.Text
    end
    if v94 then
        local v95 = (u61 ~= '' and u61 .. '/' or '') .. v94 .. '.pluh_cfg'

        if isfile(v95) then
            delfile(v95)
            _StarterGui:SetCore('SendNotification', {
                Title = 'Success',
                Text = 'File deleted successfully!',
                Duration = 3,
            })

            u63 = nil
            _TextBox.Text = ''
            _TextBox2.Text = ''
            _Frame5.Visible = false

            u87()
        else
            _StarterGui:SetCore('SendNotification', {
                Title = 'Error',
                Text = 'File does not exist!',
                Duration = 3,
            })
        end
    else
        _StarterGui:SetCore('SendNotification', {
            Title = 'Error',
            Text = 'Please select a file to delete!',
            Duration = 3,
        })
    end
end)
_TextButton3.MouseButton1Click:Connect(function()
    _ScreenGui2.Enabled = false
    _Frame5.Visible = false
    _Frame6.Visible = false
    _TextButton8.Visible = true
    u64 = true
    u65 = true
end)
_TextButton7.MouseButton1Click:Connect(function()
    _Frame5.Visible = false

    if u63 then
        u63.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end

    u63 = nil
    _TextBox.Text = ''
end)
_TextButton6.MouseButton1Click:Connect(function()
    if u65 then
        _StarterGui:SetCore('SendNotification', {
            Title = 'Error',
            Text = 'Cannot save file after closing the GUI!',
            Duration = 3,
        })
    else
        local _Text3 = _TextBox.Text
        local _Text4 = _TextBox2.Text
        local v98 = (u61 ~= '' and u61 .. '/' or '') .. _Text3 .. '.pluh_cfg'

        if _Text3 and _Text3 ~= '' then
            if isfile(v98) then
                writefile(v98, _Text4)
                _StarterGui:SetCore('SendNotification', {
                    Title = 'Success',
                    Text = 'File content saved successfully!',
                    Duration = 3,
                })

                _Frame5.Visible = false
                _Frame6.Visible = false
            else
                _StarterGui:SetCore('SendNotification', {
                    Title = 'Error',
                    Text = 'File does not exist!',
                    Duration = 3,
                })
            end
        else
            _StarterGui:SetCore('SendNotification', {
                Title = 'Error',
                Text = 'Please enter a valid file name!',
                Duration = 3,
            })
        end
    end
end)
u87()
_LocalPlayer.Chatted:Connect(function(p99)
    if p99 == '/e cfg' then
        _ScreenGui2.Enabled = true

        if _Frame3 then
            _Frame3.Visible = true
        else
            warn('MainFrame is not defined or not found.')
        end

        _Frame5.Visible = true
        _Frame6.Visible = true
        u65 = false
    end
end)

getgenv().PredictionValue = 0.163628
getgenv().SelectedPart = 'LowerTorso'
getgenv().CSelectedPart = 'LowerTorso'
getgenv().cam = getgenv().cam or false
getgenv().Randomizer = false
getgenv().AntiGroundShots = false
getgenv().smoothness = 0.1
getgenv().Spectate = false
getgenv().camwallcheck = true
getgenv().look = false
getgenv().Enabled = true
getgenv().esp = true
getgenv().res = false
getgenv().Airshot = false
getgenv().Autopred = false

local u100 = {
    AutoArmorEnabled = false,
    AutoPizzaEnabled = false,
    ARMOR_NAME = '[Medium Armor]',
    PIZZA_NAME = '[Pizza]',
    ALTERNATE_PIZZA_NAME = '[Taco]',
    NotifyTitle = 'Autobuying',
    NotifyText = 'Use the GUI button to toggle auto-buying',
    NotifyDuration = 8,
    ArmorShopPath = {
        'MAP',
        'Pads',
        '[Medium Armor]',
    },
    PizzaShopPath = {
        'MAP',
        'Pads',
        '[Pizza]',
    },
    AlternatePizzaShopPath = {
        'MAP',
        'Pads',
        '[Taco]',
    },
    CheckInterval = 0,
    NotificationDuration = 5,
    ProximityRadius = 10,
}

getgenv().Orbit = false
getgenv().OrbitSpeed = 50
getgenv().OrbitRadius = 10
getgenv().AutoPredMath = 0.255

function createLibraryGui()
    Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/cat'))()
    Window = Library:CreateWindow('pluh.lua | @_skidyo.mum | V1', Vector2.new(350, 350), Enum.KeyCode.RightControl)
    Window.Frame.Visible = false

    local _Main = Window:CreateTab('Main')
    local _Silent = _Main:CreateSector('Silent', 'left')
    local _Misc = _Main:CreateSector('Misc', 'right')
    local _Orbit = _Main:CreateSector('Orbit', 'right')
    local _AutoBuy = Window:CreateTab('Auto Buy')
    local _OtherScripts = Window:CreateTab('Others'):CreateSector('Other Scripts', 'left')

    _Orbit:AddTextbox('Radius', tostring(getgenv().OrbitRadius), function(p107)
        local v108 = tonumber(p107)

        if v108 then
            getgenv().OrbitRadius = v108
        else
            print('Please enter a valid number for smoothness.')
        end
    end)
    _Orbit:AddTextbox('Speed', tostring(getgenv().OrbitSpeed), function(p109)
        local v110 = tonumber(p109)

        if Radius then
            getgenv().OrbitSpeed = v110
        else
            print('Please enter a valid number for smoothness.')
        end
    end)
    _Orbit:AddToggle('Enable Orbit', getgenv().Orbit, function(p111)
        getgenv().Orbit = p111
    end)
    _Misc:AddTextbox('Smoothness', tostring(getgenv().smoothness), function(p112)
        local v113 = tonumber(p112)

        if v113 then
            getgenv().smoothness = v113
        else
            print('Please enter a valid number for smoothness.')
        end
    end)
    _Misc:AddToggle('Cam', getgenv().cam, function(p114)
        getgenv().cam = p114
    end)
    _Misc:AddToggle('Cam wallcheck', getgenv().camwallcheck, function(p115)
        getgenv().camwallcheck = p115
    end)
    _Misc:AddToggle('Spectate', getgenv().Spectate, function(p116)
        getgenv().Spectate = p116
    end)
    _Misc:AddToggle('Look At', getgenv().look, function(p117)
        getgenv().look = p117
    end)
    _OtherScripts:AddButton('Macro', function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/plah911/whitelister/main/Protected_9901011741398340.txt'))()
    end)
    _OtherScripts:AddButton('Fps Boost', function()
        _G.Ignore = {}

        local v118 = {
            Players = {
                ['Ignore Me'] = true,
                ['Ignore Others'] = true,
                ['Ignore Tools'] = true,
            },
            Meshes = {
                NoMesh = false,
                NoTexture = false,
                Destroy = false,
            },
            Images = {
                Invisible = true,
                Destroy = false,
            },
            Explosions = {
                Smaller = true,
                Invisible = false,
                Destroy = false,
            },
            Particles = {
                Invisible = true,
                Destroy = false,
            },
            TextLabels = {
                LowerQuality = true,
                Invisible = false,
                Destroy = false,
            },
            MeshParts = {
                LowerQuality = true,
                Invisible = false,
                NoTexture = false,
                NoMesh = false,
                Destroy = false,
            },
            Other = {
                ['FPS Cap'] = 240,
                ['No Camera Effects'] = true,
                ['No Clothes'] = true,
                ['Low Water Graphics'] = true,
                ['No Shadows'] = true,
                ['Low Rendering'] = true,
                ['Low Quality Parts'] = true,
                ['Low Quality Models'] = true,
                ['Reset Materials'] = true,
            },
        }

        _G.Settings = v118

        loadstring(game:HttpGet('https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua'))()
    end)
    _Silent:AddTextbox('Prediction', tostring(getgenv().PredictionValue), function(p119)
        local v120 = tonumber(p119)

        if v120 then
            getgenv().PredictionValue = v120
        else
            print('Please enter a valid number for prediction.')
        end
    end)
    _Silent:AddDropdown('Hit Part', {
        'Head',
        'HumanoidRootPart',
        'UpperTorso',
        'LowerTorso',
    }, getgenv().SelectedPart, false, function(p121)
        getgenv().SelectedPart = p121
    end)
    _Silent:AddToggle('Enabled', getgenv().Enabled, function(p122)
        getgenv().Enabled = p122
    end)
    _Silent:AddToggle('Randomizer', getgenv().Randomizer, function(p123)
        getgenv().Randomizer = p123
    end)
    _Silent:AddToggle('Esp', getgenv().esp, function(p124)
        getgenv().esp = p124
    end)
    _Silent:AddToggle('Airshot', getgenv().Airshot, function(p125)
        getgenv().Airshot = p125
    end)
    _Silent:AddTextbox('Auto Pred Math', tostring(getgenv().AutoPredMath), function(p126)
        local v127 = tonumber(p126)

        if v127 then
            getgenv().AutoPredMath = v127
        else
            print('Please enter a valid number for smoothness.')
        end
    end)
    _Silent:AddToggle('Autopred', getgenv().Autopred, function(p128)
        getgenv().Autopred = p128
    end)
    _Silent:AddToggle('AntiGroundShots', getgenv().AntiGroundShots, function(p129)
        getgenv().AntiGroundShots = p129
    end)

    local _Guns = _AutoBuy:CreateSector('Guns', 'left')

    _Guns:AddButton('Armor', function()
        buyItem(u100.ArmorShopPath, nil)
    end)
    _Guns:AddButton('Tactical', function()
        buyItem({
            'MAP',
            'Pads',
            '[Tactical Shotgun]',
        }, nil)
    end)
    _Guns:AddButton('USP', function()
        buyItem({
            'MAP',
            'Pads',
            '[USP]',
        }, nil)
    end)
    _Guns:AddToggle('Auto Armor', false, function(p131)
        getgenv().AutoArmorEnabled = p131
    end)

    local _Food = _AutoBuy:CreateSector('Food', 'left')

    _Food:AddButton('Pizza', function()
        local v133 = {
            'MAP',
            'Pads',
            u100.ALTERNATE_PIZZA_NAME,
        }

        buyItem(u100.PizzaShopPath, v133)
    end)
    _Food:AddToggle('Auto Pizza', false, function(p134)
        getgenv().AutoPizzaEnabled = p134
    end)
end

createLibraryGui()

local function u139(p135)
    if u65 then
        _StarterGui:SetCore('SendNotification', {
            Title = 'Error',
            Text = 'Cannot load file after closing the GUI!',
            Duration = 3,
        })

        return
    elseif u62 then
        _StarterGui:SetCore('SendNotification', {
            Title = 'Error',
            Text = 'A file is already loaded!',
            Duration = 3,
        })
    else
        local v136 = (u61 ~= '' and u61 .. '/' or '') .. p135 .. '.pluh_cfg'

        if isfile(v136) then
            local v137 = readfile(v136)
            local v138 = game:GetService('HttpService'):JSONDecode(v137)

            getgenv().PredictionValue = v138.PredictionValue
            getgenv().SelectedPart = v138.SelectedPart
            getgenv().OrbitRadius = v138.OrbitRadius
            getgenv().Obrit = v138.Orbit
            getgenv().OrbitSpeed = v138.OrbitSpeed
            getgenv().cam = v138.cam
            getgenv().AutoPredMath = v138.AutoPredMath
            getgenv().Spectate = v138.Spectate
            getgenv().Randomizer = v138.Randomizer
            getgenv().smoothness = v138.smoothness
            getgenv().camwallcheck = v138.camwallcheck
            getgenv().look = v138.look
            getgenv().AntiGroundShots = v138.AntiGround
            getgenv().Enabled = v138.Enabled
            getgenv().esp = v138.esp
            getgenv().Airshot = v138.Airshot
            getgenv().Autopred = v138.Autopred
            getgenv().AutoArmorEnabled = v138.AutoArmorEnabled
            getgenv().AutoPizzaEnabled = v138.AutoPizzaEnabled

            destroyLibraryGui()
            createLibraryGui()

            u62 = true

            _StarterGui:SetCore('SendNotification', {
                Title = 'Success',
                Text = 'Settings loaded successfully!',
                Duration = 3,
            })

            u64 = true
            u65 = true
        else
            _StarterGui:SetCore('SendNotification', {
                Title = 'Error',
                Text = 'File does not exist!',
                Duration = 3,
            })
        end
    end
end

_TextButton2.MouseButton1Click:Connect(function()
    local _Text5 = _TextBox.Text

    if _Text5 and _Text5 ~= '' then
        local v141 = (u61 ~= '' and u61 .. '/' or '') .. _Text5 .. '.pluh_cfg'

        if isfile(v141) then
            u139(_Text5)

            _ScreenGui2.Enabled = false
            _Frame5.Visible = false
            _Frame6.Visible = false
            _TextButton8.Visible = true
            u64 = true
            u65 = true
        else
            _StarterGui:SetCore('SendNotification', {
                Title = 'Error',
                Text = 'File does not exist!',
                Duration = 3,
            })
        end
    else
        _StarterGui:SetCore('SendNotification', {
            Title = 'Error',
            Text = 'Please enter a valid file name!',
            Duration = 3,
        })
    end
end)

function announce(p142, p143, p144)
    game.StarterGui:SetCore('SendNotification', {
        Title = p142,
        Text = p143,
        Duration = p144,
    })
end

local _ = game.Players.LocalPlayer

function findShopItem(p145)
    local _Workspace3 = game:GetService('Workspace')
    local v147, v148, v149 = ipairs(p145)

    while true do
        local v150

        v149, v150 = v147(v148, v149)

        if v149 == nil then
            break
        end

        _Workspace3 = _Workspace3:FindFirstChild(v150)

        if not _Workspace3 then
            if v150 == 'Pads' then
                p145[v149] = 'Shops'
                _Workspace3 = _Workspace3.Parent:FindFirstChild('Shops')
            end
            if not _Workspace3 then
                return nil, v150
            end
        end
    end

    return _Workspace3
end
function buyItem(p151, p152)
    local v153, v154 = findShopItem(p151)

    if not v153 and p152 then
        v153, v154 = findShopItem(p152)
    end
    if v153 then
        local _ClickDetector = v153:FindFirstChild('ClickDetector')

        if _ClickDetector then
            fireclickdetector(_ClickDetector)
        else
            announce('ClickDetector Not Found', 'Cannot find ClickDetector in the shop item part', u100.NotificationDuration)
        end
    else
        announce('Shop Item Not Found', 'Cannot find the path segment: ' .. v154, u100.NotificationDuration)

        return
    end
end
function AutoBuy()
    while wait(u100.CheckInterval) do
        if getgenv().AutoArmorEnabled then
            local v156, v157 = pcall(buyItem, u100.ArmorShopPath)

            if not v156 then
                announce('Error', 'Failed to execute AutoBuy for Armor: ' .. v157, u100.NotificationDuration)
            end
        end
        if getgenv().AutoPizzaEnabled then
            local v158, v159 = pcall(buyItem, u100.PizzaShopPath, u100.AlternatePizzaShopPath)

            if not v158 then
                announce('Error', 'Failed to execute AutoBuy for Pizza: ' .. v159, u100.NotificationDuration)
            end
        end
    end
end

coroutine.wrap(AutoBuy)()

local _ScreenGui5 = Instance.new('ScreenGui')
local _Frame7 = Instance.new('Frame')
local _TextBox3 = Instance.new('TextBox')
local _TextButton10 = Instance.new('TextButton')
local _TextButton11 = Instance.new('TextButton')

_ScreenGui5.Name = 'ChoiceGui'
_ScreenGui5.Parent = game:GetService('CoreGui')
_ScreenGui5.Enabled = true
_Frame7.Name = 'ChoiceFrame'
_Frame7.Parent = _ScreenGui5
_Frame7.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_Frame7.Position = UDim2.new(0.5, -150, 0.5, -100)
_Frame7.Size = UDim2.new(0, 300, 0, 200)
_Frame7.BorderSizePixel = 2
_Frame7.BorderColor3 = Color3.fromRGB(0, 0, 0)
_Frame7.Active = true
_Frame7.Draggable = true
_TextBox3.Name = 'ChoiceTextBox'
_TextBox3.Parent = _Frame7
_TextBox3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_TextBox3.Position = UDim2.new(0.1, 0, 0.1, 0)
_TextBox3.Size = UDim2.new(0.8, 0, 0.5, 0)
_TextBox3.Font = Enum.Font.Gotham
_TextBox3.Text = "Click Continue if you don't have sets, click Open Cfg to load cfgs, or just click the X in the cfg gui to continue"
_TextBox3.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextBox3.TextSize = 18
_TextBox3.TextWrapped = true
_TextBox3.TextYAlignment = Enum.TextYAlignment.Top
_TextBox3.ClearTextOnFocus = false
_TextButton10.Name = 'ContinueButton'
_TextButton10.Parent = _Frame7
_TextButton10.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
_TextButton10.Position = UDim2.new(0.1, 0, 0.7, 0)
_TextButton10.Size = UDim2.new(0.35, 0, 0.2, 0)
_TextButton10.Font = Enum.Font.GothamBold
_TextButton10.Text = 'Continue'
_TextButton10.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton10.TextSize = 18
_TextButton10.BorderSizePixel = 2
_TextButton10.BorderColor3 = Color3.fromRGB(0, 0, 0)
_TextButton11.Name = 'OpenCfgsButton'
_TextButton11.Parent = _Frame7
_TextButton11.BackgroundColor3 = Color3.fromRGB(0, 0, 170)
_TextButton11.Position = UDim2.new(0.55, 0, 0.7, 0)
_TextButton11.Size = UDim2.new(0.35, 0, 0.2, 0)
_TextButton11.Font = Enum.Font.GothamBold
_TextButton11.Text = 'Open Cfgs'
_TextButton11.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton11.TextSize = 18
_TextButton11.BorderSizePixel = 2
_TextButton11.BorderColor3 = Color3.fromRGB(0, 0, 0)

_TextButton10.MouseButton1Click:Connect(function()
    _ScreenGui5.Enabled = false
    Window.Frame.Visible = true
    _TextButton8.Visible = true
end)
_TextButton11.MouseButton1Click:Connect(function()
    _ScreenGui5.Enabled = false
    _ScreenGui2.Enabled = true

    if _Frame3 then
        _Frame3.Visible = true
    else
        warn('MainFrame is not defined or not found.')
    end

    _Frame5.Visible = true
    _Frame6.Visible = true
    u65 = false
end)
_TextButton8.MouseButton1Click:Connect(function()
    if Window.Frame.Visible then
        Window.Frame.Visible = false
    else
        Window.Frame.Visible = true
    end
end)

while _ScreenGui5.Enabled do
    task.wait(0.1)
end

local function u167(p165, p166)
    game:GetService('StarterGui'):SetCore('SendNotification', {
        Title = p165,
        Text = p166,
        Icon = 'rbxassetid://6675147486',
        Duration = 2.5,
    })
end

u167('Loading', 'Loading Settings...')
wait(1)

local u168 = true
local _ = game:GetService('Workspace').CurrentCamera
local u169 = nil
local u170 = false

game.Players.LocalPlayer:GetMouse()
u167('Loading', 'Initializing Auto Air Shot GUI...')
wait(1)

local function u173(p171)
    local _Velocity = p171.Character.HumanoidRootPart.Velocity

    if _Velocity then
        return _Velocity.Y < -70 and true or ((_Velocity.X > 450 or _Velocity.X < -35) and true or (_Velocity.Y > 60 and true or (_Velocity.Z > 35 or _Velocity.Z < -35)))
    else
        return false
    end
end

local u174 = false
local u175 = nil
local _ScreenGui6 = Instance.new('ScreenGui')

_ScreenGui6.Parent = game.CoreGui

local _Frame8 = Instance.new('Frame')

_Frame8.Size = UDim2.new(0, 80, 0, 40)
_Frame8.Position = UDim2.new(0.5, -40, 0.5, -20)
_Frame8.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_Frame8.BorderSizePixel = 0
_Frame8.Parent = _ScreenGui6
_Frame8.Active = true
_Frame8.Draggable = true

local _UICorner = Instance.new('UICorner')

_UICorner.CornerRadius = UDim.new(0, 10)
_UICorner.Parent = _Frame8

local _TextButton12 = Instance.new('TextButton')

_TextButton12.Size = UDim2.new(0, 60, 0, 20)
_TextButton12.Position = UDim2.new(0.5, -30, 0.5, -10)
_TextButton12.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
_TextButton12.Text = 'Air // Off'
_TextButton12.Font = Enum.Font.GothamBold
_TextButton12.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton12.TextSize = 12
_TextButton12.Parent = _Frame8

local _UICorner2 = Instance.new('UICorner')

_UICorner2.CornerRadius = UDim.new(0, 6)
_UICorner2.Parent = _TextButton12

local function u187()
    local _GettingUp = Enum.HumanoidStateType.GettingUp
    local u182 = false

    u175 = game:GetService('RunService').Heartbeat:Connect(function()
        if AutoShootState and u169 then
            local _Character = game.Players.LocalPlayer.Character

            if _Character then
                _Character = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Tool')
            end
            if _Character then
                local _Character2 = u169.Character

                if _Character2 then
                    _Character2 = u169.Character:FindFirstChild('HumanoidRootPart')
                end

                local _Character3 = u169.Character

                if _Character3 then
                    _Character3 = u169.Character:FindFirstChild('Humanoid')
                end
                if _Character2 and _Character3 then
                    local v186 = _Character3:GetState()

                    if (v186 == Enum.HumanoidStateType.Freefall or v186 == Enum.HumanoidStateType.Jumping) and v186 ~= _GettingUp then
                        u182 = true

                        task.delay(0.2, function()
                            if u182 then
                                _Character:Activate()
                                task.delay(0.35, function()
                                    u182 = false
                                end)
                            end
                        end)
                    end

                    _GettingUp = v186
                end
            end
        end
    end)
end
local function v188()
    u174 = not u174
    AutoShootState = u174

    if u174 then
        _TextButton12.Text = 'Air // On'

        u187()
    else
        _TextButton12.Text = 'Air // Off'

        if u175 then
            u175:Disconnect()

            u175 = nil
        end
    end
end

_TextButton12.MouseButton1Click:Connect(v188)
u167('Loading', 'Loading GUI Components...')
wait(1)

local _ScreenGui7 = Instance.new('ScreenGui')
local _Frame9 = Instance.new('Frame')
local _UICorner3 = Instance.new('UICorner')
local _TextButton13 = Instance.new('TextButton')
local _UICorner4 = Instance.new('UICorner')
local _UIStroke2 = Instance.new('UIStroke')

_ScreenGui7.Name = 'Pluh'
_ScreenGui7.Parent = game.CoreGui
_ScreenGui7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_Frame9.Parent = _ScreenGui7
_Frame9.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_Frame9.BackgroundTransparency = 0.15
_Frame9.BorderColor3 = Color3.fromRGB(70, 70, 70)
_Frame9.BorderSizePixel = 2
_Frame9.Position = UDim2.new(0.133798108, 0, 0.20107238, 0)
_Frame9.Size = UDim2.new(0, 202, 0, 70)
_Frame9.Active = true
_Frame9.Draggable = true

local function v195()
    _Frame9.Position = UDim2.new(0.5, -_Frame9.AbsoluteSize.X / 2, 0, -_Frame9.AbsoluteSize.Y / 2)
end

v195()

local v196 = _Frame9

_Frame9.GetPropertyChangedSignal(v196, 'AbsoluteSize'):Connect(v195)

_UICorner3.CornerRadius = UDim.new(0, 15)
_UICorner3.Parent = _Frame9
_UIStroke2.Parent = _Frame9
_UIStroke2.Thickness = 3
_UIStroke2.Transparency = 0.5
_UIStroke2.Color = Color3.fromRGB(100, 100, 100)
_TextButton13.Parent = _Frame9
_TextButton13.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
_TextButton13.BorderSizePixel = 0
_TextButton13.BackgroundTransparency = 0.3
_TextButton13.Position = UDim2.new(0.5, 0, 0.5, 0)
_TextButton13.AnchorPoint = Vector2.new(0.5, 0.5)
_TextButton13.Size = UDim2.new(0, 180, 0, 44)
_TextButton13.Font = Enum.Font.Cartoon
_TextButton13.Text = 'Pluh V1'
_TextButton13.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextButton13.TextScaled = true
_TextButton13.TextSize = 18
_TextButton13.TextWrapped = true
_UICorner4.CornerRadius = UDim.new(0, 15)
_UICorner4.Parent = _TextButton13

game:GetService('RunService')
u167('Loading', 'Initializing Main Functionality...')
wait(1)

local _Players = game:GetService('Players')
local _RunService = game:GetService('RunService')
local _Lighting2 = game:GetService('Lighting')
local _LocalPlayer2 = _Players.LocalPlayer
local v201 = _LocalPlayer2

_LocalPlayer2.GetMouse(v201)

local _CurrentCamera = workspace.CurrentCamera

Instance.new('ColorCorrectionEffect', _Lighting2)

local _BlurEffect = Instance.new('BlurEffect', _Lighting2)
local _SunRaysEffect = Instance.new('SunRaysEffect', _Lighting2)

_BlurEffect.Size = 0
_SunRaysEffect.Intensity = 0

local _new = Drawing.new
local _fromRGB = Color3.fromRGB
local _ = Vector3.new
local _ = Vector2.new
local _ = math.floor
local _ = math.ceil
local u217 = {
    players = {},
    enabled = false,
    fontsize = 16,
    font = 0,
    settings = {
        name = {
            enabled = true,
            outline = true,
            color = _fromRGB(255, 255, 255),
            outlineColor = _fromRGB(255, 0, 0),
        },
        box = {
            enabled = true,
            outline = true,
            color = _fromRGB(255, 255, 255),
            outlineColor = _fromRGB(255, 0, 0),
        },
        healthbar = {
            enabled = true,
            outline = true,
            color = _fromRGB(255, 255, 255),
            outlineColor = _fromRGB(0, 0, 0),
        },
        healthtext = {
            enabled = true,
            outline = true,
            color = _fromRGB(255, 255, 255),
            outlineColor = _fromRGB(255, 0, 0),
        },
        distance = {
            enabled = true,
            outline = true,
            color = _fromRGB(255, 255, 255),
            outlineColor = _fromRGB(255, 0, 0),
        },
    },
    NewDrawing = function(p207, p208)
        local v209 = _new(p207)
        local v210 = next
        local v211 = p208 or {}
        local v212 = nil

        while true do
            local v213

            v212, v213 = v210(v211, v212)

            if v212 == nil then
                break
            end

            v209[v212] = v213
        end

        return v209
    end,
    NewPlayer = function(p214)
        local _players = u217.players
        local v216 = {
            name = u217.NewDrawing('Text', {
                Color = _fromRGB(255, 255, 255),
                Outline = true,
                Center = true,
                Size = 13,
                Font = 0,
            }),
            boxOutline = u217.NewDrawing('Square', {
                Color = _fromRGB(255, 0, 0),
                Thickness = 3,
                Filled = false,
            }),
            box = u217.NewDrawing('Square', {
                Color = _fromRGB(255, 255, 255),
                Thickness = 1,
                Transparency = 1,
                Filled = false,
            }),
            healthBarOutline = u217.NewDrawing('Line', {
                Color = _fromRGB(0, 0, 0),
                Thickness = 3,
            }),
            healthBar = u217.NewDrawing('Line', {
                Color = _fromRGB(255, 255, 255),
                Thickness = 1,
            }),
            healthText = u217.NewDrawing('Text', {
                Color = _fromRGB(255, 255, 255),
                Outline = true,
                Center = true,
                Size = 13,
                Font = 0,
            }),
            distance = u217.NewDrawing('Text', {
                Color = _fromRGB(255, 255, 255),
                Outline = true,
                Center = true,
                Size = 13,
                Font = 0,
            }),
        }

        _players[p214] = v216
    end,
}

function identifyexploit()
    local v218, v219 = pcall(identifyexecutor)

    if v218 then
        return v219
    end

    local v220 = SENTINEL_LOADED and 'Sentinel' or (XPROTECT and 'SirHurt' or PROTOSMASHER_LOADED and 'Protosmasher')

    if not v220 then
        local v221 = FLUXUS_LOADED

        v220 = v221 and 'Fluxus' or v221
    end

    return v220
end
function enableHighlightESP(p222)
    if p222 and (getgenv().esp and p222.Character) then
        local _Highlight = Instance.new('Highlight')

        _Highlight.FillColor = Color3.fromRGB(255, 0, 0)
        _Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        _Highlight.FillTransparency = 0.5
        _Highlight.OutlineTransparency = 0
        _Highlight.Parent = p222.Character

        local _BillboardGui = Instance.new('BillboardGui')

        _BillboardGui.Name = 'DisplayNameESP'
        _BillboardGui.Adornee = p222.Character:WaitForChild('HumanoidRootPart')
        _BillboardGui.Size = UDim2.new(0, 200, 0, 50)
        _BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        _BillboardGui.AlwaysOnTop = true
        _BillboardGui.Parent = p222.Character

        local _TextLabel4 = Instance.new('TextLabel')

        _TextLabel4.Size = UDim2.new(1, 0, 1, 0)
        _TextLabel4.BackgroundTransparency = 1
        _TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel4.TextStrokeTransparency = 0.5
        _TextLabel4.Text = p222.DisplayName
        _TextLabel4.Font = Enum.Font.SourceSansBold
        _TextLabel4.TextSize = 20
        _TextLabel4.Parent = _BillboardGui
    end
end
function removeHighlightESP(p226)
    if p226 and p226.Character then
        local _Highlight2 = p226.Character:FindFirstChildOfClass('Highlight')

        if _Highlight2 then
            _Highlight2:Destroy()
        end

        local _DisplayNameESP = p226.Character:FindFirstChild('DisplayNameESP')

        if _DisplayNameESP then
            _DisplayNameESP:Destroy()
        end
    end
end
function onPlayerDied(p229)
    if u60 == 'Fluxus' then
        p229.CharacterAdded:Connect(function(_)
            if getgenv().esp then
                enableHighlightESP(p229)
            end
        end)
    end
end

local u230 = identifyexploit()

_TextButton13.MouseButton1Click:Connect(function()
    Locking = not Locking

    if Locking then
        u170 = true
        u169 = getClosestPlayerToCursor()

        if u169 then
            u167(';Pluh V1:', ' ' .. tostring(u169.Character.Humanoid.DisplayName))

            if u230 ~= 'Fluxus' then
                u217.NewPlayer(u169)

                u217.enabled = true
            else
                enableHighlightESP(u169)
                u169.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
                    onPlayerDied(u169)
                end)
            end
        end
    else
        u170 = false

        if u230 == 'Fluxus' then
            if u169 then
                removeHighlightESP(u169)
            end
        else
            u217.enabled = false

            local v231, v232, v233 = pairs(u217.players)

            while true do
                local v234

                v233, v234 = v231(v232, v233)

                if v233 == nil then
                    break
                end

                v234.name.Visible = false
                v234.boxOutline.Visible = false
                v234.box.Visible = false
                v234.healthBarOutline.Visible = false
                v234.healthBar.Visible = false
                v234.healthText.Visible = false
                v234.distance.Visible = false
            end
        end

        u169 = nil

        if shadeConnection then
            shadeConnection:Disconnect()
        end

        _UIStroke2.Color = Color3.fromRGB(100, 100, 100)
    end
    if u169 then
        if shadeConnection then
            shadeConnection:Disconnect()
        end

        shadeConnection = game:GetService('RunService').RenderStepped:Connect(function()
            local v235 = tick() % 3
            local v236 = math.abs(math.sin(v235 * math.pi / 1.5)) * 100

            _UIStroke2.Color = Color3.fromRGB(v236, v236, v236)

            if not u169 then
                shadeConnection:Disconnect()

                _UIStroke2.Color = Color3.fromRGB(100, 100, 100)
            end
        end)
    else
        _UIStroke2.Color = Color3.fromRGB(100, 100, 100)
    end
end)

local u237 = 5
local u238 = false

local function u240()
    local _LocalPlayer3 = game.Players.LocalPlayer

    if _LocalPlayer3 and _LocalPlayer3.Character and _LocalPlayer3.Character:FindFirstChild('Humanoid') then
        _LocalPlayer3.Character.Humanoid.Health = 0
    end
end
local function u252(p241, p242, p243, p244)
    local v245 = tick() * p243
    local v246 = math.cos(v245) * p242
    local v247 = math.sin(v245) * p242
    local _Position = p241.Position
    local v249 = Vector3.new(_Position.X + v246, _Position.Y + p244, _Position.Z + v247)
    local _Character4 = game.Players.LocalPlayer.Character

    if _Character4 and _Character4.PrimaryPart then
        local v251 = _Character4.PrimaryPart.CFrame - _Character4.PrimaryPart.Position

        _Character4:SetPrimaryPartCFrame(CFrame.new(v249) * v251)
    end
end

local u253 = false

game:GetService('RunService').RenderStepped:Connect(function()
    if u238 then
        if getgenv().Orbit and (u169 and u169.Character) and u169.Character:FindFirstChild('HumanoidRootPart') then
            if not u253 then
                workspace.CurrentCamera.CameraSubject = u169.Character.Humanoid
                u253 = true
            end

            local _Humanoid = u169.Character:FindFirstChild('Humanoid')

            if _Humanoid then
                local v255 = _Humanoid:GetState()

                u237 = (v255 == Enum.HumanoidStateType.Jumping or v255 == Enum.HumanoidStateType.Freefall) and 5 or 5
            end

            u252(u169.Character.HumanoidRootPart, getgenv().OrbitRadius, getgenv().OrbitSpeed, u237)
        elseif u253 then
            local _LocalPlayer4 = game.Players.LocalPlayer

            if _LocalPlayer4.Character and _LocalPlayer4.Character:FindFirstChild('Humanoid') then
                workspace.CurrentCamera.CameraSubject = _LocalPlayer4.Character.Humanoid
            end

            u253 = false
        end
    else
        u240()

        u238 = true
    end
end)
_RunService.Heartbeat:Connect(function()
    local v257 = (getgenv().Orbit == true and u169 and true or false) and _LocalPlayer2.Character:FindFirstChildWhichIsA('Tool')

    if v257 then
        v257:Activate()
    end
end)
spawn(function()
    while not (u169 and u169.Character and u169.Character:FindFirstChild('Humanoid')) do
        wait()
    end

    if getgenv().Spectate == true then
        workspace.CurrentCamera.CameraSubject = u169.Character.Humanoid
    end

    workspace.CurrentCamera.CameraSubject = _LocalPlayer2.Character.Humanoid

    wait()

    if not (u169 and u169.Character and u169.Character:FindFirstChild('Humanoid')) then
        workspace.CurrentCamera.CameraSubject = _LocalPlayer2.Character.Humanoid
    end

    wait()

    if u169 and getgenv().Spectate then
    else
    end
end)

local function u261(p258)
    local _Character5 = p258.Character

    if _Character5 then
        _Character5 = p258.Character:FindFirstChild('HumanoidRootPart')
    end
    if _Character5 then
        local _Position2 = _Character5.Position

        wait(0.145)

        if p258.Character and p258.Character:FindFirstChild('HumanoidRootPart') then
            return (_Character5.Position - _Position2) / 0.145
        else
            return Vector3.new(0, 0, 0)
        end
    else
        return Vector3.new(0, 0, 0)
    end
end

local u262 = nil

game:GetService('RunService').Heartbeat:Connect(function(_)
    if u169 and u169.Character and u169.Character:FindFirstChild('HumanoidRootPart') then
        u169.Character:FindFirstChild('HumanoidRootPart').CanCollide = false
        u262 = u261(u169)
    end
end)

local _RunService2 = game:GetService('RunService')
local _Players2 = game:GetService('Players')

local function u268(p265)
    task.defer(function()
        if p265 and p265.Character and p265.Character:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart = p265.Character.HumanoidRootPart
            local v267 = _HumanoidRootPart.Position + Vector3.new(0, 5, 0)

            _HumanoidRootPart.Position = _HumanoidRootPart.Position:Lerp(v267, 0.1)
        end
    end)
end
local function v272(p269)
    local v270 = p269 and p269.Character and p269.Character:FindFirstChild('Humanoid')

    if v270 then
        v270.StateChanged:Connect(function(_, p271)
            if p271 == Enum.HumanoidStateType.Freefall then
                u268(p269)
            end
        end)
    end
end

local _LocalPlayer5 = _Players2.LocalPlayer

v272(_LocalPlayer5)
v272(u169)

if u169 and getgenv().AntiGroundShots then
    _RunService2.Stepped:Connect(function()
        if u169.Character and (u169.Character:FindFirstChild('Humanoid') and u169.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall) then
            local _Velocity2 = u169.Character.HumanoidRootPart.Velocity

            u169.Character.HumanoidRootPart.Velocity = Vector3.new(_Velocity2.X, _Velocity2.Y / 5, _Velocity2.Z)
        end
    end)
end

_RunService2.RenderStepped:Connect(function()
    if u217.enabled and (u169 and getgenv().esp) then
        local _Character6 = u169.Character

        if _Character6 then
            local _Humanoid2 = _Character6:FindFirstChild('Humanoid')
            local _HumanoidRootPart2 = _Character6:FindFirstChild('HumanoidRootPart')

            if _Humanoid2 and (_HumanoidRootPart2 and _Character6:FindFirstChild('Head')) then
                local v278 = u217.players[u169]

                if not v278 then
                    u217.NewPlayer(u169)

                    v278 = u217.players[u169]
                end

                local v279, v280 = _CurrentCamera:WorldToViewportPoint(_HumanoidRootPart2.Position)
                local v281 = _CurrentCamera
                local v282 = (_CurrentCamera:WorldToViewportPoint(_HumanoidRootPart2.Position - Vector3.new(0, 3, 0)).Y - v281:WorldToViewportPoint(_HumanoidRootPart2.Position + Vector3.new(0, 2.6, 0)).Y) / 2
                local v283 = Vector2.new(math.floor(v282 * 1.5), math.floor(v282 * 1.9))
                local v284 = Vector2.new(math.floor(v279.X - v282 * 1.5 / 2), math.floor(v279.Y - v282 * 1.6 / 2))
                local v285 = v283.Y + v284.Y + 1

                if v280 and u217.enabled then
                    if u217.settings.name.enabled then
                        v278.name.Position = Vector2.new(v283.X / 2 + v284.X, v284.Y - 16)
                        v278.name.Outline = u217.settings.name.outline
                        v278.name.Text = tostring(u169.Name)
                        v278.name.Color = u217.settings.name.color
                        v278.name.OutlineColor = u217.settings.name.outlineColor
                        v278.name.Font = u217.font
                        v278.name.Size = u217.fontsize
                        v278.name.Visible = true
                    else
                        v278.name.Visible = false
                    end
                    if u217.settings.distance.enabled and _LocalPlayer5.Character and _LocalPlayer5.Character:FindFirstChild('HumanoidRootPart') then
                        v278.distance.Position = Vector2.new(v283.X / 2 + v284.X, v285)
                        v278.distance.Outline = u217.settings.distance.outline
                        v278.distance.Text = '[' .. math.floor((_HumanoidRootPart2.Position - _LocalPlayer5.Character.HumanoidRootPart.Position).Magnitude) .. 'm]'
                        v278.distance.Color = u217.settings.distance.color
                        v278.distance.OutlineColor = u217.settings.distance.outlineColor

                        local _ = v285 + 15

                        v278.distance.Font = u217.font
                        v278.distance.Size = u217.fontsize
                        v278.distance.Visible = true
                    else
                        v278.distance.Visible = false
                    end
                    if u217.settings.box.enabled then
                        v278.boxOutline.Size = v283
                        v278.boxOutline.Position = v284
                        v278.boxOutline.Visible = u217.settings.box.outline
                        v278.boxOutline.Color = u217.settings.box.outlineColor
                        v278.box.Size = v283
                        v278.box.Position = v284
                        v278.box.Color = Color3.fromRGB(45, 45, 45)
                        v278.box.Transparency = 1
                        v278.box.Filled = false
                        v278.box.Visible = true
                    else
                        v278.boxOutline.Visible = false
                        v278.box.Visible = false
                    end
                    if u217.settings.healthbar.enabled then
                        v278.healthBar.From = Vector2.new(v284.X - 5, v284.Y + v283.Y)
                        v278.healthBar.To = Vector2.new(v278.healthBar.From.X, v278.healthBar.From.Y - _Humanoid2.Health / _Humanoid2.MaxHealth * v283.Y)
                        v278.healthBar.Color = u217.settings.healthbar.color
                        v278.healthBar.Visible = true
                        v278.healthBarOutline.From = Vector2.new(v278.healthBar.From.X, v284.Y + v283.Y + 1)
                        v278.healthBarOutline.To = Vector2.new(v278.healthBar.From.X, v278.healthBar.From.Y - 1 * v283.Y - 1)
                        v278.healthBarOutline.Color = u217.settings.healthbar.outlineColor
                        v278.healthBarOutline.Visible = u217.settings.healthbar.outline
                    else
                        v278.healthBarOutline.Visible = false
                        v278.healthBar.Visible = false
                    end
                    if u217.settings.healthtext.enabled then
                        v278.healthText.Text = tostring(math.floor(_Humanoid2.Health / _Humanoid2.MaxHealth * 100 + 0.5))
                        v278.healthText.Position = Vector2.new(v284.X - 20, v284.Y + v283.Y - 1 * v283.Y - 1)
                        v278.healthText.Color = u217.settings.healthtext.color
                        v278.healthText.OutlineColor = u217.settings.healthtext.outlineColor
                        v278.healthText.Outline = u217.settings.healthtext.outline
                        v278.healthText.Font = u217.font
                        v278.healthText.Size = u217.fontsize
                        v278.healthText.Visible = true
                    else
                        v278.healthText.Visible = false
                    end
                else
                    v278.name.Visible = false
                    v278.boxOutline.Visible = false
                    v278.box.Visible = false
                    v278.healthBarOutline.Visible = false
                    v278.healthBar.Visible = false
                    v278.healthText.Visible = false
                    v278.distance.Visible = false
                end
            else
                local v286, v287, v288 = pairs(u217.players)

                while true do
                    local v289

                    v288, v289 = v286(v287, v288)

                    if v288 == nil then
                        break
                    end

                    v289.name.Visible = false
                    v289.boxOutline.Visible = false
                    v289.box.Visible = false
                    v289.healthBarOutline.Visible = false
                    v289.healthBar.Visible = false
                    v289.healthText.Visible = false
                    v289.distance.Visible = false
                end
            end
        end
    else
        return
    end
end)

function getClosestPlayerToCursor()
    local _huge = math.huge
    local _X = game:GetService('GuiService'):GetScreenResolution().X
    local v292 = Vector2.new(_X / 2, game:GetService('GuiService'):GetScreenResolution().Y / 2)
    local v293, v294, v295 = ipairs(game:GetService('Players'):GetPlayers())
    local v296 = nil

    while true do
        local v297

        v295, v297 = v293(v294, v295)

        if v295 == nil then
            break
        end
        if v297 ~= game.Players.LocalPlayer then
            local _Character7 = v297.Character

            if _Character7 and (_Character7:FindFirstChild('HumanoidRootPart') and _Character7.Humanoid.Health > 0) then
                local v299, v300 = game:GetService('Workspace').CurrentCamera:WorldToViewportPoint(_Character7.HumanoidRootPart.Position)

                if v300 then
                    local _Magnitude = (v292 - Vector2.new(v299.X, v299.Y)).Magnitude

                    if _Magnitude < _huge then
                        v296 = v297
                        _huge = _Magnitude
                    end
                end
            end
        end
    end

    return v296
end

local _TweenService = game:GetService('TweenService')
local _RunService3 = game:GetService('RunService')
local _CurrentCamera2 = game.Workspace.CurrentCamera
local u305 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local u306 = nil

local function u311(p307, p308)
    local _p = _CurrentCamera2.CFrame.p
    local v310 = Ray.new(_p, p307 - _p)

    return game.Workspace:FindPartOnRayWithIgnoreList(v310, p308) == nil
end
local function u320()
    local _Character8 = game.Players.LocalPlayer.Character

    if _Character8 and _Character8:FindFirstChild('HumanoidRootPart') then
        local v313, v314, v315 = ipairs(_Character8:GetChildren())
        local v316 = false

        while true do
            local v317

            v315, v317 = v313(v314, v315)

            if v315 == nil then
                break
            end
            if v317:IsA('Tool') then
                v316 = true

                break
            end
        end

        if not v316 then
            _Character8.Humanoid.AutoRotate = true

            if u306 then
                u306:Cancel()

                u306 = nil
            end

            return
        end
        if u169 and u169.Character and u169.Character:FindFirstChild('HumanoidRootPart') then
            local v318 = Vector3.new(u169.Character.HumanoidRootPart.Position.X, _Character8.HumanoidRootPart.Position.Y, u169.Character.HumanoidRootPart.Position.Z)

            if u311(v318, {
                _Character8,
                u169.Character,
                placemarker,
            }) then
                _Character8.Humanoid.AutoRotate = false

                local v319 = CFrame.new(_Character8.HumanoidRootPart.Position, v318)

                if u306 then
                    u306:Cancel()
                end

                u306 = _TweenService:Create(_Character8.HumanoidRootPart, u305, {CFrame = v319})

                u306:Play()
            else
                _Character8.Humanoid.AutoRotate = true

                if u306 then
                    u306:Cancel()

                    u306 = nil
                end
            end
        else
            _Character8.Humanoid.AutoRotate = true

            if u306 then
                u306:Cancel()

                u306 = nil
            end
        end
    end
end

_RunService3.RenderStepped:Connect(function()
    if getgenv().look == true then
        u320()
    end
end)

local function u329(p321)
    local _AutoPredMath = getgenv().AutoPredMath
    local v323, v324, v325 = ipairs({
        {
            maxPing = 10,
            base = 0.11,
        },
        {
            maxPing = 30,
            base = 0.12,
        },
        {
            maxPing = 50,
            base = 0.13,
        },
        {
            maxPing = 70,
            base = 0.14,
        },
        {
            maxPing = 80,
            base = 0.15,
        },
        {
            maxPing = 100,
            base = 0.16,
        },
        {
            maxPing = 120,
            base = 0.16,
        },
        {
            maxPing = 140,
            base = 0.17,
        },
        {
            maxPing = 160,
            base = 0.18,
        },
        {
            maxPing = 180,
            base = 0.19,
        },
        {
            maxPing = 200,
            base = 0.19,
        },
        {
            maxPing = 220,
            base = 0.2,
        },
        {
            maxPing = 240,
            base = 0.21,
        },
        {
            maxPing = 250,
            base = 0.22,
        },
    })

    while true do
        local v326

        v325, v326 = v323(v324, v325)

        if v325 == nil then
            break
        end
        if p321 <= v326.maxPing then
            _AutoPredMath = v326.base

            break
        end
    end

    local v327 = math.random(4, 6)
    local v328 = tostring(_AutoPredMath)

    for _ = 1, v327 do
        v328 = v328 .. tostring(math.random(0, 8))
    end

    return v328
end
local function v333()
    while true do
        if getgenv().Autopred then
            local v330 = game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValueString()
            local v331 = string.split(v330, '(')
            local v332 = tonumber(v331[1])

            PredictionValue = tonumber(u329(v332))
        end

        wait(0.5)
    end
end

coroutine.wrap(v333)()

local _RunService4 = game:GetService('RunService')
local u335 = nil

local function u341()
    local v336, v337, v338 = ipairs({
        'Head',
        'UpperTorso',
        'LowerTorso',
        'LeftUpperArm',
        'LeftLowerArm',
        'LeftHand',
        'RightUpperArm',
        'RightLowerArm',
        'RightHand',
    })
    local v339 = {}

    while true do
        local v340

        v338, v340 = v336(v337, v338)

        if v338 == nil then
            break
        end
        if v340 ~= u335 then
            table.insert(v339, v340)
        end
    end

    return v339[math.random(#v339)]
end
local function u343()
    local v342 = {
        'LeftFoot',
        'RightFoot',
    }

    return v342[math.random(#v342)]
end

local _SelectedPart = getgenv().SelectedPart

_RunService4.Stepped:Connect(function()
    if u169 and u169.Character and u169.Character:FindFirstChild('Humanoid') then
        local v345 = u169.Character.Humanoid:GetState()

        if getgenv().Randomizer then
            if v345 == Enum.HumanoidStateType.Freefall then
                if v345 ~= Enum.HumanoidStateType.Freefall then
                    if v345 ~= Enum.HumanoidStateType.Freefall and (_SelectedPart and getgenv().SelectedPart ~= _SelectedPart) then
                        getgenv().SelectedPart = _SelectedPart
                    end
                elseif getgenv().SelectedPart ~= u343() then
                    _SelectedPart = getgenv().SelectedPart
                    getgenv().SelectedPart = u343()
                end
            elseif getgenv().SelectedPart == _SelectedPart then
                local v346 = u341()

                getgenv().SelectedPart = v346
                u335 = v346
                _SelectedPart = v346
            end
        end
    end
end)

local v347 = getrawmetatable(game)
local ___namecall = v347.__namecall

setreadonly(v347, false)

v347.__namecall = newcclosure(function(...)
    local v349 = {...}

    if u170 and (getnamecallmethod() == 'FireServer' and (getgenv().Enabled and u169.Character ~= nil)) then
        if v349[2] == 'UpdateMousePos' then
            if u173(u169) then
                v349[3] = u169.Character.HumanoidRootPart.Position + u169.Character.Humanoid.MoveDirection * u169.Character.Humanoid.WalkSpeed * getgenv().PredictionValue
            else
                v349[3] = u169.Character.HumanoidRootPart.Position + u169.Character.HumanoidRootPart.Velocity * getgenv().PredictionValue
            end
            if u168 ~= true then
                v349[3] = u169.Character[getgenv().SelectedPart].Position
            elseif u173(u169) then
                v349[3] = u169.Character[getgenv().SelectedPart].Position + u169.Character.Humanoid.MoveDirection * u169.Character.Humanoid.WalkSpeed * getgenv().PredictionValue
            else
                v349[3] = u169.Character[getgenv().SelectedPart].Position + u169.Character[getgenv().SelectedPart].Velocity * getgenv().PredictionValue
            end

            return ___namecall(unpack(v349))
        end
        if v349[2] == 'MOUSE' or v349[2] == 'MousePos' then
            if u168 ~= true then
                if type(v349[3]) ~= 'table' then
                    v349[3] = u169.Character[getgenv().SelectedPart].Position
                else
                    v349[3] = {
                        u169.Character[getgenv().SelectedPart].Position,
                    }
                end
            elseif type(v349[3]) ~= 'table' then
                if u173(u169) then
                    v349[3] = u169.Character[getgenv().SelectedPart].Position + u169.Character.Humanoid.MoveDirection * u169.Character.Humanoid.WalkSpeed * getgenv().PredictionValue
                else
                    v349[3] = u169.Character[getgenv().SelectedPart].Position + u169.Character[getgenv().SelectedPart].Velocity * getgenv().PredictionValue
                end
            elseif u173(u169) then
                v349[3] = {
                    u169.Character[getgenv().SelectedPart].Position + u169.Character.Humanoid.MoveDirection * u169.Character.Humanoid.WalkSpeed * getgenv().PredictionValue,
                }
            else
                v349[3] = {
                    u169.Character[getgenv().SelectedPart].Position + u169.Character[getgenv().SelectedPart].Velocity * getgenv().PredictionValue,
                }
            end

            return ___namecall(unpack(v349))
        end
    end

    return ___namecall(...)
end)

local _CurrentCamera3 = game.Workspace.CurrentCamera

local function u356(p351, p352)
    local _Position3 = _CurrentCamera3.CFrame.Position
    local v354 = p351 - _Position3
    local v355 = Ray.new(_Position3, v354)

    return game.Workspace:FindPartOnRayWithIgnoreList(v355, p352) == nil
end

_RunService4.RenderStepped:Connect(function()
    if getgenv().Enabled and (getgenv().cam and (u169 and u169.Character)) and u169.Character:FindFirstChild(getgenv().CSelectedPart) then
        if getgenv().Airshot and u169.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            if u173(u169) then
                local _ = u169.Character.LeftFoot.Position + u169.Character.Humanoid.MoveDirection * u169.Character.Humanoid.WalkSpeed * getgenv().PredictionValue
            else
                local _ = u169.Character.LeftFoot.Position + u169.Character.LeftFoot.Velocity * getgenv().PredictionValue
            end
        elseif u173(u169) then
            local _ = u169.Character.HumanoidRootPart.Position + u169.Character.Humanoid.MoveDirection * u169.Character.Humanoid.WalkSpeed * getgenv().PredictionValue
        else
            local _ = u169.Character.HumanoidRootPart.Position + u169.Character.HumanoidRootPart.Velocity * getgenv().PredictionValue
        end

        local v357

        if getgenv().Prediction then
            local v358

            if u173(u169) then
                v358 = u169.Character[getgenv().CSelectedPart].Position + u169.Character.Humanoid.MoveDirection * u169.Character.Humanoid.WalkSpeed * getgenv().PredictionValue
            else
                v358 = u169.Character[getgenv().CSelectedPart].Position + u169.Character[getgenv().CSelectedPart].Velocity * getgenv().PredictionValue
            end

            v357 = v358 * getgenv().PredictionMultiplier
        else
            v357 = u169.Character[getgenv().CSelectedPart].Position
        end

        local v359 = {
            u169.Character,
            _CurrentCamera3,
            u169.Character:FindFirstChild('HumanoidRootPart'),
        }

        if not getgenv().camwallcheck and true or u356(v357, v359) then
            local v360 = CFrame.new(_CurrentCamera3.CFrame.Position, v357)

            _CurrentCamera3.CFrame = _CurrentCamera3.CFrame:Lerp(v360, (math.clamp(getgenv().smoothness, 0.01, 0.99)))
        end
    end
end)

local function u363(p361)
    local _Highlight3 = Instance.new('Highlight')

    _Highlight3.Name = 'AntiAIMChams'
    _Highlight3.Adornee = p361.Character
    _Highlight3.FillColor = Color3.new(1, 0, 0)
    _Highlight3.FillTransparency = 0.5
    _Highlight3.OutlineColor = Color3.new(0.5, 0, 0)
    _Highlight3.OutlineTransparency = 0
    _Highlight3.Parent = p361.Character
end

game:GetService('Players').PlayerAdded:Connect(function(p364)
    p364.CharacterAdded:Connect(function(p365)
        while wait(1) do
            if u173(p364) then
                if not p365:FindFirstChild('AntiAIMChams') then
                    u363(p364)
                end
            else
                local _AntiAIMChams = p365:FindFirstChild('AntiAIMChams')

                if _AntiAIMChams then
                    _AntiAIMChams:Destroy()
                end
            end
        end
    end)
end)
u167('Loaded', 'Script Loaded Successfully!')

local function u367()
    game.Players.LocalPlayer:Kick('Pluh kicked you nigga.')
end

local u368 = 1746793480

local function u370(p369)
    if p369.UserId == u368 then
        p369.DisplayName = '[Pluh Owner] ' .. p369.DisplayName
    end
end

local _LocalPlayer6 = game.Players.LocalPlayer

u370(_LocalPlayer6)
game.Players.PlayerAdded:Connect(function(p372)
    if p372 == _LocalPlayer6 then
        u370(p372)
    end
end)

local function u377(p373)
    local v374, v375 = string.match(p373, '^(;kick) (.+)$')

    if v374 and v375 then
        local _LocalPlayer7 = game.Players.LocalPlayer

        if string.lower(_LocalPlayer7.Name) == string.lower(v375) or string.lower(_LocalPlayer7.DisplayName) == string.lower(v375) then
            u367()
        end
    end
end

game.Players.LocalPlayer.Chatted:Connect(function(p378)
    if game.Players.LocalPlayer.UserId == u368 then
        u377(p378)
    end
end)
loadstring(game:HttpGet('https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua'))().Notify({
    Description = 'Made by ;Pluh',
    Title = 'https://discord.com/invite/n6VhAuyFUq',
    Duration = 15,
})
