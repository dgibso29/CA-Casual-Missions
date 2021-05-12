/*
	File: fn_ai_obj_delete_reinforcement_pool.sqf
	Author: Spoffy
	Date: 2020-12-21
	Last Update: 2020-12-21
	Public: Yes
	
	Description:
		Deletes a reinforcements pool
	
	Parameter(s):
		_pool - Pool to delete [OBJECT]
	
	Returns:
		None
	
	Example(s):
		[para_s_ai_obj_reinforcement_pools # 0] call para_s_fnc_ai_obj_delete_reinforcement_pool
*/

params ["_pool"];

para_s_ai_obj_reinforcement_pools = para_s_ai_obj_reinforcement_pools - [_pool];

[_pool] call para_s_fnc_ai_obj_remove_reinforcement_pool_links;

deleteVehicle _pool;