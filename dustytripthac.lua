-- Create a ScreenGui to hold the buttons
local gui = Instance.new("ScreenGui")
gui.Name = "ScriptControls"
gui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame to hold the buttons
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 210, 0, 180)
frame.Position = UDim2.new(0.5, -100, 0.9, -100)
frame.AnchorPoint = Vector2.new(0.5, 1)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BackgroundTransparency = 0.5
frame.BorderSizePixel = 0
frame.Active = true
frame.Visible = false
frame.Parent = gui

-- Create a button to start the script
local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0, 90, 0, 16)
startButton.Position = UDim2.new(0, 5, 0, 0)
startButton.Text = "Start (U)"
startButton.TextSize = 12
startButton.Parent = frame

-- Create a button to stop the script
local stopButton = Instance.new("TextButton")
stopButton.Size = UDim2.new(0, 90, 0, 16)
stopButton.Position = UDim2.new(1, -95, 0, 0)
stopButton.Text = "Stop (O)"
stopButton.TextSize = 12
stopButton.Parent = frame

-- Create a button to go back to chunk 1
local homeButton = Instance.new("TextButton")
homeButton.Size = UDim2.new(0, 90, 0, 16)
homeButton.Position = UDim2.new(0, 5, 0, 20)
homeButton.Text = "Home (P)"
homeButton.TextSize = 12
homeButton.Parent = frame

-- Create a button for anti-afk
local afkButton = Instance.new("TextButton")
afkButton.Size = UDim2.new(0, 90, 0, 16)
afkButton.Position = UDim2.new(1, -95, 0, 20)
afkButton.Text = "Anti-AFK (L)"
afkButton.TextSize = 12
afkButton.Parent = frame

-- Create a button to minimize or restore the GUI
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 200, 0, 16)
toggleButton.Position = UDim2.new(0.5, -100, 1, -16)
toggleButton.Text = "Open GUI (Y)"
toggleButton.TextSize = 12
toggleButton.Parent = gui

-- Create a button to teleport food
local teleportFoodButton = Instance.new("TextButton")
teleportFoodButton.Size = UDim2.new(0, 200, 0, 16)
teleportFoodButton.Position = UDim2.new(0.5, -100, 0, 50)
teleportFoodButton.Text = "TP Food (1)"
teleportFoodButton.TextSize = 12
teleportFoodButton.Parent = frame

-- Create a button to teleport guns
local teleportGunsButton = Instance.new("TextButton")
teleportGunsButton.Size = UDim2.new(0, 200, 0, 16)
teleportGunsButton.Position = UDim2.new(0.5, -100, 0, 80)
teleportGunsButton.Text = "TP Guns & Ammo (2)"
teleportGunsButton.TextSize = 12
teleportGunsButton.Parent = frame

-- Create a button to teleport rare items
local teleportRareButton = Instance.new("TextButton")
teleportRareButton.Size = UDim2.new(0, 200, 0, 16)
teleportRareButton.Position = UDim2.new(0.5, -100, 0, 110)
teleportRareButton.Text = "TP Rare Items (3)"
teleportRareButton.TextSize = 12
teleportRareButton.Parent = frame

-- Create a button to give all guns unlimited ammo
local ammoButton = Instance.new("TextButton")
ammoButton.Size = UDim2.new(0, 200, 0, 16)
ammoButton.Position = UDim2.new(0.5, -100, 0, 140)
ammoButton.Text = "Unlimited Ammo (4)"
ammoButton.TextSize = 12
ammoButton.Parent = frame

local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
local workspace = game:GetService("Workspace")
local chunkNumber = 51
local lastStoppedChunk = 51
local running = false
local sandstormCFrame = CFrame.new(204.360123, 3.51325297, 7849.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1)

-- Function to start the script
local function startScript()
    running = true
    chunkNumber = lastStoppedChunk
    local player = game.Players.LocalPlayer
    while running do
        local sandstorm = game.Workspace:FindFirstChild("SandStormEffect")
        if sandstorm then
            -- Check if the player's health is below 20 and teleport accordingly
            if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health < 20 then
                chunkNumber = chunkNumber - 5
                lastStoppedChunk = chunkNumber - 5
                rootPart.CFrame = sandstormCFrame
                while game.Workspace:FindFirstChild("SandStormEffect") do
                repeat
                    wait(0.1)
                until player.Character.Humanoid.Health > 50
                    wait(0.1)
                end
            else
                -- Continue normal teleportation process
                while not game.Workspace.points:FindFirstChild(tostring(chunkNumber)) do
                    wait(0.01)
                end
                for i, v in pairs(game.Workspace.points:GetChildren()) do
                    if v.Name == tostring(chunkNumber) then
                        rootPart.CFrame = v.CFrame
                        break
                    end
                end
                chunkNumber = chunkNumber + 5
                lastStoppedChunk = chunkNumber
                wait(0.1)
            end
        else
            -- Check if the player's health is below 20 and teleport accordingly
            if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health < 20 then
                chunkNumber = chunkNumber - 5
                lastStoppedChunk = chunkNumber - 5
                rootPart.CFrame = sandstormCFrame
                -- Wait until health goes back above 50
                repeat
                    wait(0.1)
                until player.Character.Humanoid.Health > 50
            else
                -- Normal teleportation process
                while not game.Workspace.points:FindFirstChild(tostring(chunkNumber)) do
                    wait(0.01)
                end
                for i, v in pairs(game.Workspace.points:GetChildren()) do
                    if v.Name == tostring(chunkNumber) then
                        rootPart.CFrame = v.CFrame
                        break
                    end
                end
                chunkNumber = chunkNumber + 5
                lastStoppedChunk = chunkNumber
                wait(0.1)
            end
        end
    end
end

-- Function to stop the script
local function stopScript()
    running = false
    lastStoppedChunk = chunkNumber
end

-- Function to go back to home
local function goHome()
    running = false
    wait(0.5)
    lastStoppedChunk = chunkNumber - 5
    rootPart.CFrame = CFrame.new(204.360123, 3.51325297, 7849.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end

-- Function to toggle GUI visibility
local function toggleVisibility()
    frame.Visible = not frame.Visible
    if frame.Visible then
        toggleButton.Text = "Minimize (Y)"
    else
        toggleButton.Text = "Restore (Y)"
    end
end

-- Function to teleport objects
local function teleportObjects(objectName)
    local Item = workspace:FindFirstChild(objectName)

    if Item then
        local descendants = Item:GetDescendants()

        for i = 1, #descendants do
            local object = descendants[i]
            if object:IsA("BasePart") then
                object.CFrame = rootPart.CFrame
            end
        end
    else
        print(objectName .. " object not found in Workspace")
    end
end

-- Function to teleport food
local function teleportFood()
    teleportObjects("Burger")
    teleportObjects("Apple")
    teleportObjects("banana")
    teleportObjects("Garlic")
    teleportObjects("Bread")
    teleportObjects("Peper")
    teleportObjects("t")
    teleportObjects("Pizza")
    teleportObjects("Onion")
    teleportObjects("Donut")
    teleportObjects("Food")
    teleportObjects("Bar")
end

-- Function to teleport guns
local function teleportGuns()
    teleportObjects("AK47")
    teleportObjects("PumpShotgun")
    teleportObjects("RPG")
    teleportObjects("Mac10")
    teleportObjects("Pistol")
    teleportObjects("AMMO_CRATE")
end

-- Function to teleport rare items
local function teleportRareItems()
    teleportObjects("Backpack_6")
    teleportObjects("Backpack_8")
    teleportObjects("Rubber Duck")
    teleportObjects("Green PaintballGun")
    teleportObjects("Yellow PaintballGun")
    teleportObjects("Blue PaintballGun")
    teleportObjects("Saveable_HealingPotion")
    teleportObjects("Gray Duck")
    teleportObjects("Blue Duck")
    teleportObjects("DancePotion")
    teleportObjects("RubberChicken")
    teleportObjects("Firework")
    teleportObjects("Tophat Duck")
    teleportObjects("Pink PaintballGun")
    teleportObjects("Red PaintballGun")
    teleportObjects("Devil Duck")
    teleportObjects("Monster Mash Dance Potion")
    teleportObjects("FirePotion")
    teleportObjects("Shrek")
    teleportObjects("BalloonGun")
    teleportObjects("Raygun")
end

-- Unlimited ammo for all guns
local function unlimitedAmmo()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "Raygun" or v.Name == "BalloonGun" or v.Name == "Red PaintballGun" or v.Name == "Pink PaintballGun" or v.Name == "Blue PaintballGun" or v.Name == "Yellow PaintballGun" or v.Name == "Green PaintballGun" or v.Name == "Pistol" or v.Name == "AK47" or v.Name == "GOLDAK47" or v.Name == "Mac10" or v.Name == "PumpShotgun" or v.Name == "RPG" then
            v:SetAttribute("CurrentMagSize", 9999)
            v:SetAttribute("MagSize", 9999)
            v:SetAttribute("MaxBulletsAmount", 9999)
            wait()
        end
    end
    game:GetService("Workspace").ChildAdded:Connect(function(v)
        if v.Name == "Raygun" or v.Name == "BalloonGun" or v.Name == "Red PaintballGun" or v.Name == "Pink PaintballGun" or v.Name == "Blue PaintballGun" or v.Name == "Yellow PaintballGun" or v.Name == "Green PaintballGun" or v.Name == "Pistol" or v.Name == "AK47" or v.Name == "GOLDAK47" or v.Name == "Mac10" or v.Name == "PumpShotgun" or v.Name == "RPG" then
            v:SetAttribute("CurrentMagSize", 9999)
            v:SetAttribute("MagSize", 9999)
            v:SetAttribute("MaxBulletsAmount", 9999)
            wait()
        end
    end)
end

-- anti-afk
local function antiAfk()
  local vu = game:GetService("VirtualUser")
  game:GetService("Players").LocalPlayer.Idled:connect(function()
  vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
  wait(1)
  vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
  end)
end

startButton.MouseButton1Click:Connect(startScript)
stopButton.MouseButton1Click:Connect(stopScript)
homeButton.MouseButton1Click:Connect(goHome)
toggleButton.MouseButton1Click:Connect(toggleVisibility)
teleportFoodButton.MouseButton1Click:Connect(teleportFood)
teleportGunsButton.MouseButton1Click:Connect(teleportGuns)
teleportRareButton.MouseButton1Click:Connect(teleportRareItems)
ammoButton.MouseButton1Click:Connect(unlimitedAmmo)
afkButton.MouseButton1Click:Connect(antiAfk)

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.U then
        startScript()
    elseif input.KeyCode == Enum.KeyCode.O then
        stopScript()
    elseif input.KeyCode == Enum.KeyCode.P then
        goHome()
    elseif input.KeyCode == Enum.KeyCode.Y then
        toggleVisibility()
    elseif input.KeyCode == Enum.KeyCode.One then
        teleportFood()
    elseif input.KeyCode == Enum.KeyCode.Two then
        teleportGuns()
    elseif input.KeyCode == Enum.KeyCode.Three then
        teleportRareItems()
    elseif input.KeyCode == Enum.KeyCode.Four then
        unlimitedAmmo()
    elseif input.KeyCode == Enum.KeyCode.L then
        antiAfk()
    end
end)
