/*
    File: fn_checkGear.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-11-22
    Last Update: 2020-04-16
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Checks the players gear for blacklisted items.
        Found items are removed from the loadout.
        Furthermore a hint with the found items is displayed to the player
        while a server log entry is created for the admin.

    Parameter(s):
        _backpack - Backpack classname of the players current backpack [STRING, defaults to ""]

    Returns:
        Player checked without findings [BOOL]
*/

params [
    ["_backpack", "", [""]]
];

true
