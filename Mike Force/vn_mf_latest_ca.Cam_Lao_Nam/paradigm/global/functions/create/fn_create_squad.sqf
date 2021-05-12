/*
	File: fn_create_squad.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-01
	Public: No
	
	Description:
		Spawns units given as a parameter, assigns them to a group.
	
	Parameter(s):
		_units - Array of unit classes [Array, defaults to [] (empty array)]
		_groupTarget - Group to put units in, or side to create units in [Group|Side]
		_position - Position to spawn units around [Position3D]
	
	Returns:
		Array in form of [[units], group] [Array]
	
	Example(s):
		["vn_test", west] call para_g_fnc_create_squad
*/

params [["_units", []], "_groupTarget", "_position"];

private _group = _groupTarget;

if (typeName _groupTarget == "SIDE") then {
	_group = [_groupTarget, true] call para_g_fnc_create_group;
};

private _spawnedUnits = _units apply {[_group, _x, _position, [], 5, "NONE"] call para_g_fnc_create_unit};

[_spawnedUnits, _group]