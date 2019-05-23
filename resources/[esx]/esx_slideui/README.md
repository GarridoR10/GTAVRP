# esx_slideui
## Description
Modified UI for ESX Servers that uses pNotify to show information that was requested through chat commands.

Please note that this is not an always on-screen UI and it's meant for those that want a CLEAN user interface with elements that appear only when requested, therefore, the ESX UI elements were moved into 'pNotify' notifications and will appear only when a specific chat command is triggered.
## Dependencies
* [pNotify](https://github.com/Nick78111/pNotify)
* [esx_society](https://github.com/ESX-Org/esx_society)
## Setup
* Install into resources/[esx]
* Add the following lines to the end of es_extended/client/main.lua file
```
RegisterNetEvent('esx:slideui_hideoldui')
AddEventHandler('esx:slideui_hideoldui', function(disableui)
    if disableui then
        TriggerEvent('es:setMoneyDisplay', 0.0)
        ESX.UI.HUD.SetDisplay(0.0)
    else
        TriggerEvent('es:setMoneyDisplay', 1.0)
        ESX.UI.HUD.SetDisplay(1.0)
    end
end)
```
* Add the following line to your server.cfg AFTER EVERY JOB WAS STARTED!!
```
start esx_slideui
```
## Configuration
* If you don't want to disable the old UI, you have to set `Config.DisableOldUI` to `false` in `config.lua`
## Important Notes
* Don't forget to add the event written above (in the Setup section) to es_extended/client/main.lua
* This script must be started AFTER every job was started
## Usage
* The script is used with the following chat commands: `/cash`; `/balance`; `/dirty`; `/job`; `/societybalance`
## Screenshots
* **`/cash`**

![screenshot](https://i.imgur.com/Zn6Y43b.jpg)
##
* **`/cash`; `/dirty`; `/balance`**

![screenshot](https://i.imgur.com/TwJ32O4.jpg)
##
* **`/job`; `/societybalance`** - Note: Society balance can only be seen by the society boss

![screenshot](https://i.imgur.com/wwG0DEF.jpg)
