/*
	File: fn_zones_create_vehicle_depot.sqf
	Author: Spoffy
	Date: 2020-12-02
	Last Update: 2020-12-02
	Public: No
	
	Description:
		Creates a vehicle depot in the given zone.
	
	Parameter(s):
		_zone - Zone marker name [STRING]
	
	Returns:
		Task data store [NAMESPACE]
	
	Example(s):
		["zone_saigon"] call vn_mf_fnc_zones_create_vehicle_depot
*/

params ["_zone"];

["destroy_vehicle_depot", _zone select struct_zone_m_marker] call vn_mf_fnc_task_create select 1