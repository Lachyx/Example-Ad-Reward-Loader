repeat
	task.wait()
until game:IsLoaded()

-- Replace These Variables
local Hub = "Example Hub"
local Hub_Script_ID = "0bd8fd6455fc4....."
local Discord_Invite = ""
local UI_Theme = "Dark"

local Linkvertise_Enabled = true
local Linkvertise_Link = ""

local Lootlabs_Enabled = false
local Lootlabs_Link = ""
-------------------------------------------

makefolder(Hub)
local key_path = Hub .. "/Key.txt"
script_key = script_key or isfile(key_path) and readfile(key_path) or nil

local Cloneref = cloneref or clonereference or function(instance)
	return instance
end
local Players, HttpService = Cloneref(game:GetService("Players")), Cloneref(game:GetService("HttpService"))
local Request = http_request or request or syn.request or http

local UI = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local API = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()

API.script_id = Hub_Script_ID

local function notify(title, content, duration)
	UI:Notify({ Title = title, Content = content, Duration = duration or 8 })
end

local function checkKey(input_key)
	local status = API.check_key(input_key or script_key)
	if status.code == "KEY_VALID" then
		script_key = input_key or script_key
		writefile(key_path, script_key)
		UI:Destroy()
		API.load_script()
	elseif status.code:find("KEY_") then
		local messages = {
			KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
			KEY_INCORRECT = "Key is incorrect",
			KEY_INVALID = "Key is invalid",
		}
		notify("Key Check Failed", messages[status.code] or "Unknown error")
	else
		Players.LocalPlayer:Kick("Key check failed: " .. status.message .. " Code: " .. status.code)
	end
end

if script_key then
	checkKey()
end

local Window = UI:CreateWindow({
	Title = Hub,
	SubTitle = "Loader",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 320),
	Acrylic = false,
	Theme = UI_Theme,
	MinimizeKey = Enum.KeyCode.End,
})

local Tabs = { Main = Window:AddTab({ Title = "Key", Icon = "" }) }

local Input = Tabs.Main:AddInput("Key", {
	Title = "Enter Key:",
	Default = script_key or "",
	Placeholder = "Example: agKhRikQP..",
	Numeric = false,
	Finished = false,
})

if Linkvertise_Enabled then
	Tabs.Main:AddButton({
		Title = "Get Key (Linkvertise)",
		Callback = function()
			setclipboard(Linkvertise_Link)
			notify("Copied To Clipboard", "Ad Reward Link has been copied to your clipboard", 16)
		end,
	})
end

if Lootlabs_Enabled then
	Tabs.Main:AddButton({
		Title = "Get Key (Lootlabs)",
		Callback = function()
			setclipboard(Lootlabs_Link)
			notify("Copied To Clipboard", "Ad Reward Link has been copied to your clipboard", 16)
		end,
	})
end

Tabs.Main:AddButton({
	Title = "Check Key",
	Callback = function()
		checkKey(Input.Value)
	end,
})

Tabs.Main:AddButton({
	Title = "Join Discord",
	Callback = function()
		setclipboard(Discord_Invite)
		notify("Copied To Clipboard", "Discord Server Link has been copied to your clipboard", 16)
		Request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json", ["origin"] = "https://discord.com" },
			Body = HttpService:JSONEncode({ args = { code = Discord_Invite }, cmd = "INVITE_BROWSER", nonce = "." }),
		})
	end,
})

Window:SelectTab(1)
notify(Hub, "Loader Has Loaded Successfully")
