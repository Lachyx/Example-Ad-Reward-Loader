# Example Hub Loader

## Overview
This script is a example of a loader for Luarmor, handling key verification, user authentication, and UI interaction. It includes support for key retrieval via Linkvertise and Lootlabs, along with Discord server linking.

## Features
- Key authentication system
- Integration with **Luarmor API** for script validation
- UI built using **Fluent UI**
- Linkvertise and Lootlabs support for key retrieval
- Automatic clipboard copying for links
- Discord invite functionality

## Installation
1. Ensure you have **Roblox Executor** that supports HTTP requests.
2. Copy and paste the script into your executor.
3. Run the script and follow the instructions.

## Configuration
Modify these variables at the beginning of the script to customize settings:
```lua
local Hub = "Example Hub"  -- Name of your hub
local Hub_Script_ID = "0bd8fd6455fc4....."  -- Script ID for API authentication
local Discord_Invite = ""  -- Discord server invite link
local UI_Theme = "Dark"  -- UI theme ("Dark" or "Light")

local Linkvertise_Enabled = true  -- Enable or disable Linkvertise support
local Linkvertise_Link = ""  -- Linkvertise URL

local Lootlabs_Enabled = false  -- Enable or disable Lootlabs support
local Lootlabs_Link = ""  -- Lootlabs URL
```

## Key System
- The script reads the key from `Key.txt` inside the script's folder.
- If a valid key is found, it will be automatically checked.
- Users can enter a new key manually through the UI.
- If the key is invalid, an error message is displayed.

## UI Components
- **Enter Key**: Users enter their key to authenticate.
- **Get Key (Linkvertise)**: Copies the Linkvertise key retrieval link to the clipboard.
- **Get Key (Lootlabs)**: Copies the Lootlabs key retrieval link to the clipboard.
- **Check Key**: Validates the entered key with the API.
- **Join Discord**: Copies the Discord invite link to the clipboard and attempts to open it.

## Dependencies
- **Fluent UI**: Used for the script's interface.
- **Luarmor API**: Used for key validation.
