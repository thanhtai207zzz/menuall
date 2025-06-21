-- Tải giao diện UI
loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/main/UiREDzV2.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Giao diện chính
local Window = MakeWindow({
    Hub = {
        Title = "Menu ThanhTai",
        Animation = "TikTok: ltt_07zzz"
    },
    Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "",
        KeyLink = "",
        Keys = {"1234"},
        Notifi = {
            Notifications = true,
            CorrectKey = "Running the Script...",
            Incorrectkey = "The key is incorrect",
            CopyKeyLink = "Copied to Clipboard"
        }
    }
})

-- Nút minimize
MinimizeButton({
    Image = "rbxassetid://83190276951914",
    Size = {60, 60},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = false,
    StrokeColor = Color3.fromRGB(255, 0, 0)
})

-- TAB 1: Script Farm
local Tab1 = MakeTab({ Name = "Script Farm" })
AddButton(Tab1, {
    Name = "CHÀO MỪNG ĐẾN BẠN ĐẾN VỚI MENU THANHTÀI CHÚC BẠN CHƠI VUI VẼ",
    Callback = function()
        local Settings = {
            JoinTeam = "Pirates",
            Translator = true
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhtai207zzz/farm/refs/heads/main/farmthanhtaiboss.lua"))(Settings)
    end
})
AddButton(Tab1, {
    Name = "Menu Farm lever",
    Description = "00",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhtai207zzz/farm/refs/heads/main/farmthanhtaiboss.lua"))()
    end
})

-- Auto Collect Drop
AddToggle(Tab1, {
    Name = "Auto Nhặt Vật Phẩm Drop",
    Callback = function(state)
        _G.autoCollectDrops = state
        if state then
            task.spawn(function()
                while _G.autoCollectDrops do
                    for _, v in pairs(workspace:GetChildren()) do
                        if v:IsA("Tool") or v:IsA("Part") then
                            if (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 25 then
                                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 0)
                                task.wait()
                                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 1)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})



-- TAB 2: Boss Giang Hồ
local Tab2 = MakeTab({ Name = "Boss Giang Hồ" })
AddButton(Tab2, {
    Name = "Nhấn để Bật Script Auto Fram Boss ",
    Description = "00",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhtai207zzz/Varbossmoinhatbythanhtai/refs/heads/main/Autovarbossmoinhat.lua"))()
    end
})

-- TAB 3: PvP
local Tab3 = MakeTab({ Name = "PVP / ESP" })

-- Hiện máu kẻ địch
AddToggle(Tab3, {
    Name = "ESP Máu Địch",
    Callback = function(state)
        _G.enemyHealthBar = state
        if state then
            task.spawn(function()
                while _G.enemyHealthBar do
                    for _, enemy in pairs(Players:GetPlayers()) do
                        if enemy ~= LocalPlayer and enemy.Character and enemy.Character:FindFirstChild("Humanoid") then
                            local head = enemy.Character:FindFirstChild("Head")
                            if head and not head:FindFirstChild("EnemyHP") then
                                local hpBar = Instance.new("BillboardGui", head)
                                hpBar.Name = "EnemyHP"
                                hpBar.Size = UDim2.new(4, 0, 0.4, 0)
                                hpBar.StudsOffset = Vector3.new(0, 2.5, 0)
                                hpBar.AlwaysOnTop = true
                                local bar = Instance.new("Frame", hpBar)
                                bar.Name = "Bar"
                                bar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                                bar.BorderSizePixel = 0
                                bar.Size = UDim2.new(1, 0, 1, 0)
                                Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 6)
                            end
                            local gui = head:FindFirstChild("EnemyHP")
                            if gui then
                                local percent = math.clamp(enemy.Character.Humanoid.Health / enemy.Character.Humanoid.MaxHealth, 0, 1)
                                gui.Bar.Size = UDim2.new(percent, 0, 1, 0)
                            end
                        end
                    end
                    wait(0.2)
                end
                for _, p in pairs(Players:GetPlayers()) do
                    if p.Character and p.Character:FindFirstChild("Head") then
                        local gui = p.Character.Head:FindFirstChild("EnemyHP")
                        if gui then gui:Destroy() end
                    end
                end
            end)
        end
    end
})



-- Đánh nhanh thật sự
AddToggle(Tab3, {
    Name = "Đánh Nhanh",
    Callback = function(state)
        _G.realFastAttack = state
        if state then
            task.spawn(function()
                while _G.realFastAttack do
                    local tool = Character:FindFirstChildOfClass("Tool")
                    if tool then
                        for i = 1, 5 do
                            pcall(function()
                                tool:Activate()
                            end)
                        end
                    end
                    wait(0.05)
                end
            end)
        end
    end
})

-- Tự đánh khi cầm vũ khí
AddToggle(Tab3, {
    Name = "Auto đánh khi cầm vũ khí",
    Callback = function(state)
        _G.autoAtk = state
        if state then
            task.spawn(function()
                while _G.autoAtk do
                    local tool = Character:FindFirstChildOfClass("Tool")
                    if tool then pcall(function() tool:Activate() end) end
                    wait(0.2)
                end
            end)
        end
    end
})

-- Hitbox Sáng Đậm
AddToggle(Tab3, {
    Name = "Hitbox Sáng Đậm",
    Callback = function(state)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local char = p.Character
                if char then
                    for _, partName in ipairs({"Head", "HumanoidRootPart", "Torso"}) do
                        local part = char:FindFirstChild(partName)
                        if part and part:IsA("BasePart") then
                            if state then
                                part.Size = Vector3.new(15, 15, 15)
                                part.Material = Enum.Material.Neon
                                part.Color = Color3.fromRGB(255, 0, 0)
                                part.Transparency = 0.1
                                part.Anchored = false
                                part.CanCollide = false
                            else
                                part.Size = Vector3.new(2, 2, 1)
                                part.Material = Enum.Material.Plastic
                                part.Color = Color3.fromRGB(163, 162, 165)
                                part.Transparency = 0
                            end
                        end
                    end
                end
            end
        end
    end
})



-- Tối ưu hóa game mạnh mẽ
AddButton(Tab3, {
    Name = "Tối Ưu FPS MẠNH",
    Callback = function()
        local function disableEffects()
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Fire") or obj:IsA("Smoke") then
                    obj.Enabled = false
                end
            end
        end

        disableEffects()

        for _, v in ipairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") then
                v.Enabled = false
            end
        end

        Lighting.GlobalShadows = false
        Lighting.FogEnd = 1e10
        Lighting.Brightness = 0
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)

        local Terrain = workspace:FindFirstChildOfClass("Terrain")
        if Terrain then
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
            Terrain.WaterReflectance = 0
            Terrain.WaterTransparency = 1
        end

        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
})

-- PvP Pro Mode
AddButton(Tab3, {
    Name = "PvP SupperMode",
    Description = "Kích hoạt chế độ PvP nâng cao 👹",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhtai207zzz/scrip/refs/heads/main/scripythanhtai.lua"))()
    end
})

-- TAB 4: Nhảy / Bay
local Tab4 = MakeTab({ Name = "Nhảy / Bay" })

AddToggle(Tab4, {
    Name = "Nhảy Cao",
    Callback = function(state)
        _G.jumpOn = state
        if state then
            task.spawn(function()
                while _G.jumpOn do
                    local humanoid = Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.JumpPower = 120
                    end
                    task.wait(0.2)
                end
            end)
        else
            local humanoid = Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = 50
            end
        end
    end
})

AddToggle(Tab4, {
    Name = "Bay cao",
    Callback = function(state)
        _G.flyOn = state
        local humanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if state and humanoidRootPart then
            local bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
            bodyVelocity.Name = "FlyForce"
            bodyVelocity.Velocity = Vector3.new(0, 50, 0)
            bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        else
            local fly = humanoidRootPart and humanoidRootPart:FindFirstChild("FlyForce")
            if fly then fly:Destroy() end
        end
    end
})



-- TAB 5: speed
local Tab5 = MakeTab({ Name = "Speed / Ép Xung Hz" })

-- FPS Boost Preset
AddButton(Tab5, {
    Name = "⚙️Chế độ 60Hz⚙️",
    Callback = function()
        settings().Rendering.FrameRateManager = Enum.FrameRateManagerMode.Efficient
    end
})

AddButton(Tab5, {
    Name = "⚙️Chế độ 120Hz⚙️",
    Callback = function()
        settings().Rendering.FrameRateManager = Enum.FrameRateManagerMode.On
    end
})


-- Speed Tab5
local currentSpeed = 16
local speedEnabled = false
local slider

AddToggle(Tab5, {
    Name = "Bật Chay Nhanh",
    Callback = function(state)
        speedEnabled = state
        local humanoid = Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid.WalkSpeed = state and currentSpeed or 16 end
        if slider and slider.Object then slider.Object.Visible = state end
    end
})

slider = AddSlider(Tab5, {
    Name = "Tùy Chỉnh Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(value)
        currentSpeed = value
        local humanoid = Character:FindFirstChildOfClass("Humanoid")
        if humanoid and speedEnabled then humanoid.WalkSpeed = value end
    end
})

if slider and slider.Object then slider.Object.Visible = false end

AddButton(Tab5, {
    Name = "Reset Tốc Độ Về 16",
    Callback = function()
        currentSpeed = 16
        local humanoid = Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid.WalkSpeed = speedEnabled and 16 or 16 end
        if slider and slider.Object then slider:Set(16) end
    end
})




-- TAB 6: Thông Tin 
local Tab6 = MakeTab({ Name = "Thông tin Liên Hệ" })
AddButton(Tab6, {
    Name = "Discord: https://discord.gg/sA4uezPKF",
    Callback = function()
       setclipboard("https://discord.gg/sA4uezPKF")
    end
})


AddButton(Tab6, {
    Name = "Facebook: Thanh Tàii(ltt)",
    Callback = function()
      setclipboard("https://www.facebook.com/thanh.taii.838328")
    end
})
