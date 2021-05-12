/*
	File: fn_building_serialize.sqf
	Author: Spoffy
	Date: 2020-11-08
	Last Update: 2020-11-08
	Public: Yes
	
	Description:
		Serializes a building ready for saving.
	
	Parameter(s):
		_building - Building to save [OBJECT]

	Returns:
		Serialized building info [ARRAY]
	
	Example(s):
		[_building] call para_s_fnc_building_serialize;
*/

params ["_building"];

[
	//Version number. First is breaking changes, second is non-breaking.
	"1.0",
	//Building id
	_building getVariable "para_s_building_id",
	//Building type
	_building getVariable "para_g_buildclass",
	//Building internal supply values
	_building getVariable "para_g_internal_supply_source" getVariable "para_g_current_supplies",
	//Object position and directions (spawn info)
	_building getVariable "para_g_objects" apply {[getPosWorld _x apply {_x toFixed 3}, getDir _x toFixed 3]},
	//Build progress
	_building getVariable "para_g_build_progress"
]