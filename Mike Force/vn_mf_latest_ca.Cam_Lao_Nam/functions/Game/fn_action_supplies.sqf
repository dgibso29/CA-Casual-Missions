/*
	File: fn_action_supplies.sqf
	Author: Aaron Clark <vbawol>, Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No

	Description:
		Adds action to request supplies

	Parameter(s):
		_object - Object [Object]

	Returns: nothing

	Example(s):
		call vn_mf_fnc_action_supplies;
*/

params ["_object"];

private _gamemode_config = (missionConfigFile >> "gamemode");
private _supplyDropsConfig = _gamemode_config >> "supplydrops";

private _supplydrops = "true" configClasses _supplyDropsConfig;
// add supply officer actions
{
	private _request = configName _x;
    private _name = localize getText (_x >> "name");
	private _icon = getText (_x >> "icon");

	[
		_object,
		true,
		_icon,
		"",
		[_request, _object],
		_name,
		"vn_mf_fnc_client_request_supplies"
	] call para_c_fnc_wheel_menu_add_obj_action;
} forEach _supplydrops;