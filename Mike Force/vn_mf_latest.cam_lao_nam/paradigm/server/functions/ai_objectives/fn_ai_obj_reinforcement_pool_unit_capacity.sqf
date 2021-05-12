/*
	File: fn_ai_obj_reinforcement_pool_max_units.sqf
	Author: Spoffy
	Date: 2020-12-22
	Last Update: 2020-12-22
	Public: No
	
	Description:
		Returns the maximum number of units that a pool could have available, for the current number of players.
	
	Parameter(s):
		_pool - Reinforcement pool [Object]
	
	Returns:
		Number of units a reinforcements pool can hold [Number]
	
	Example(s):
		[_nearestPool] call para_s_fnc_ai_obj_reinforcement_pool_unit_capacity
*/

params ["_pool"];

(_pool getVariable ["size", 0]) * para_s_ai_obj_reinforcement_pool_scaling * count allPlayers