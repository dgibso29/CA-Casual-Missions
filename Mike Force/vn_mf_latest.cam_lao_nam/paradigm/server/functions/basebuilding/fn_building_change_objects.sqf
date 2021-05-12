/*
	File: fn_building_change_objects.sqf
	Author: Spoffy
	Date: 2020-10-17
	Last Update: 2020-10-17
	Public: No
	
	Description:
		Updates the list of objects associated with a building
	
	Parameter(s):
		_newObjects - New objects to assign to the building [ARRAY]
	
	Returns:
		None
	
	Example(s):
		[_building, [_object1]] call para_s_fnc_building_change_objects
*/
params ["_building", ["_newObjects", [], [[]]]];

_building setVariable ["para_g_objects", _newObjects, true];

{
	_x setVariable ["para_g_building", _building, true];
	//Use this remoteExec, so we can have several JIP'd remoteExecs on the same object.
	[[_x], "para_c_fnc_buildable_overlay_init", 0, _x] call para_s_fnc_remoteExec_jip_obj_stacked;
} forEach _newObjects;

[_building, "onBuildingObjectsChanged", [_building, _newObjects]] call para_s_fnc_building_fire_feature_event;