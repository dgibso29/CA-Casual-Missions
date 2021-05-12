/*
	File: fn_zones_create_camp.sqf
	Author: Spoffy
	Date: 2020-12-02
	Last Update: 2020-12-02
	Public: No
	
	Description:
		Creates a camp in the given zone.
	
	Parameter(s):
		_zone - Zone marker name [STRING]
	
	Returns:
		Task data store [NAMESPACE]
	
	Example(s):
		["zone_saigon"] call vn_mf_fnc_zones_create_camp
*/

params ["_zone"];

["destroy_camp", _zone select struct_zone_m_marker] call vn_mf_fnc_task_create select 1