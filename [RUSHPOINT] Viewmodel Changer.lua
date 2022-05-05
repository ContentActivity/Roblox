-- // VARIABLES

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Path = ReplicatedStorage:FindFirstChild("Assets"):FindFirstChild("Weapons")

local AssetIds = {
	{"Chancellor", 9550732192} -- 1) Weapon Name, 2) Model Id
}

local function SetPath(Object, Weapon)
	if Path:FindFirstChild(Weapon):FindFirstChild("Default"):FindFirstChild("ViewModel") then
		Path:FindFirstChild(Weapon):FindFirstChild("Default"):FindFirstChild("ViewModel"):Destroy()
		
		warn("The old model has been removed.")
	end
	
	Object.Name = "ViewModel"
	Object.Parent = Path:FindFirstChild(Weapon):FindFirstChild("Default")
end

local function GetObject(Table)
	local Object = game:GetObjects('rbxassetid://'.. Table[2])[1]
	
	if Object then
		return Object
	else
		warn("The required model was not found.")
	end
end

local function ChangeModel(Table)
	local Object = GetObject(Table)
	
	SetPath(Object, Table[1])
end

for Index, Table in pairs(AssetIds) do
	ChangeModel(Table)
end
