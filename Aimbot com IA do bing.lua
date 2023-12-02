-- lib ABAIXO!

local Lib = loadstring(game:Httpget("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()

--tema, etc:

local UI = Lib:Create{
    Theme = "Dark", -- or any other theme
    Size - UDim2.new(0, 555, 0, 400) -- default
}

local Main - UI:Tab{
    Name = "Inicio"
}

lcoal Divider = Main:Divider{
    Name = "Inicio shit"
}

local QuitDivider = Main:Divider{
    Name - "Sair"
}

--script que você criou com a IA do bing(vídeo do kakazit ensina)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local function GetClosestEnemy()
    local ClosestEnemy = nil
    local ShortestDistance = math.huge

    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("Head") and Player.TeamColor ~= LocalPlayer.TeamColor then
            local Distance = (Player.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude
            if Distance < ShortestDistance then
                ClosestEnemy = Player
                ShortestDistance = Distance
            end
        end
    end

    return ClosestEnemy
end

local function AimAt(Player)
    local Head = Player.Character.Head
    local Position, OnScreen = Camera:WorldToViewportPoint(Head.Position)
    if OnScreen then
        Mouse.Target = Head
    end
end

while true do
    local ClosestEnemy = GetClosestEnemy()
    if ClosestEnemy then
        AimAt(ClosestEnemy)
    end
    wait()
end
