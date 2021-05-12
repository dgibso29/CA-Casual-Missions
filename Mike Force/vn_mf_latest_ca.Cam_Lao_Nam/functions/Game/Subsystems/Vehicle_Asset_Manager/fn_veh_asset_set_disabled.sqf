/*
	File: fn_veh_asset_set_disabled.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-03
	Public: No

	Description:
		Sets a vehicle asset to disabled.

	Parameter(s):
		_id - Id of vehicle asset [Number]

	Returns: nothing

	Example(s): none
*/

params ["_id"];

[_id] call vn_mf_fnc_veh_asset_get_by_id set [struct_veh_asset_info_m_state_data, ["DISABLED", serverTime]];
[_id, "DISABLED"] call vn_mf_fnc_veh_asset_marker_create;