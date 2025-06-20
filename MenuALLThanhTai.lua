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
    Image = "rbxassetid://12550760234",
    Size = {60, 60},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = false,
    StrokeColor = Color3.fromRGB(255, 0, 0)
})

-- TAB 1: Script Farm
local Tab1 = MakeTab({ Name = "Script Farm" })
AddButton(Tab1, {
    Name = "Menu Farm lever",
    Callback = function()
        local Settings = {
            JoinTeam = "Pirates",
            Translator = true
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhtai207zzz/farm/refs/heads/main/farmthanhtaiboss.lua"))()
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
local Tab3 = MakeTab({ Name = "PVP VIP" })

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


