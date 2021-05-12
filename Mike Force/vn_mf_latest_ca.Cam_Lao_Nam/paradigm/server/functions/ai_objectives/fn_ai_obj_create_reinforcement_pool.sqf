/*
    File: fn_ai_obj_create_reinforcement_pool.sqf
    Author: Spoffy
    Date: 2020-12-21
    Last Update: 2020-12-21
    Public: Yes
    
    Description:
		Creates a reinforcements pool, used to replenish nearby objectives.
    
    Parameter(s):
		_pos - Position for the pool [ARRAY]
		_size - Pool size. This isn't number of units, but vaguely a multiplier applied to a playercount. [Number]
    
    Returns:
		Reinforcement pool simpleObject [OBJECT]
    
    Example(s):
		[getPos (allPlayers # 0), 20] call para_s_fnc_ai_obj_create_reinforcement_pool
*/

params ["_pos", ["_size", 1]];

private _poolId = para_s_ai_obj_pool_counter;
para_s_ai_obj_pool_counter = para_s_ai_obj_pool_counter	+ 1;

private _pool = createSimpleObject ["a3\weapons_f\empty.p3d", AGLtoASL _pos, true];
//Make sure it's exactly where we want it to be, when quering with getPos
_pool setPos _pos;
_pool setVariable ["entity_type", "reinforcement_pool"];
_pool setVariable ["id", _poolId];
_pool setVariable ["size", _size max 0];
_pool setVariable ["remaining", 1];

para_s_ai_obj_reinforcement_pools pushBack _pool;

[_pool] call para_s_fnc_ai_obj_add_reinforcement_pool_links;

_pool