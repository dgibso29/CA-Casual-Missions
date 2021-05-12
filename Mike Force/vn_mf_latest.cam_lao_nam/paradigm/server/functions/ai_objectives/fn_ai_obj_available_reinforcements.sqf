/*
    File: fn_ai_obj_available_reinforcements.sqf
    Author: Spoffy
    Date: 2020-12-22
    Last Update: 2020-12-22
    Public: No
    
    Description:
        Returns the reinforcements available at a pool.
    
    Parameter(s):
		_pool - Pool to query about available reinforcements [OBJECT]
    
    Returns:
		Number of available reinforcements [Number]
    
    Example(s):
		[_myPool] call para_s_fnc_ai_obj_available_reinforcements
*/

params ["_pool"];

private _spawnedUnitCount = {alive _x} count (_pool getVariable ["units", []]);
((_pool call para_s_fnc_ai_obj_reinforcement_pool_unit_capacity) * (_pool getVariable ["remaining", 1]) - _spawnedUnitCount) max 0;
