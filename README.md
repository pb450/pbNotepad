# pbNotepad
This script provides simple system for notes that can be handled as item in ox_inventory. Content of notes is saved to database. Notes after certain amount of time can be automatically cleaned from database.
See how this script works [right here](https://youtu.be/Rnkqqpwim8Q)
## Instalation and dependencies
In order to use this script you have to install [oxmysql](https://github.com/overextended/oxmysql), [ox_inventory](https://github.com/overextended/ox_inventory) and [ox_lib](https://github.com/overextended/ox_lib)
1. Download  zip from relases tab
2. Import .sql file from zip to your fivem server database (The on that oxmysql is linked to)
3. Copy folder pbnotepad to your resource folder
4. Add toItems.txt content to yours ox_inventory items.lua file (\ox_inventory\data\items.lua)
5. Add images from images folder to ox_inventory image folder (\ox_inventory\web\build\images)
6. Include script in your cfg file (ensure/start)

## Usage
To use notepad/note simply 'use it' in ox_inventory (Use field in inventory menu, shortcut)
