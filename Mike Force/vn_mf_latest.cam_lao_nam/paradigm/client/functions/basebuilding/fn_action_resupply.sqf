/*
	File: fn_action_resupply.sqf
	Author: Aaron Clark <vbawol>, Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No

	Description:
		Adds action to ressuply

	Parameter(s):
		_object - Object [Object]

	Returns: nothing

	Example(s):
		call para_c_fnc_action_resupply;
*/

params ["_object"];

[
	_object,
	{_this call para_g_fnc_is_resupply},
	"\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_resupply_ca.paa",
	"",
	_object,
	localize "STR_vn_mf_resupply",
	"para_c_fnc_resupply_building_with_crate"
] call para_c_fnc_wheel_menu_add_obj_action;
