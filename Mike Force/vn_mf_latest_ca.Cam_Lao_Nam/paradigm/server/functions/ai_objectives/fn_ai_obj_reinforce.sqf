/*
    File: fn_ai_obj_reinforce.sqf
    Author: Spoffy
    Date: 2020-12-12
    Last Update: 2020-12-12
    Public: No
    
    Description:
        Reinforces an objective with X units, from a reinforcement pool
    
    Parameter(s):
		_objective - Objective to reinforce [Object]
		_unitCount - Number of units to send [Number]
		_pool - Reinforcements pool to use [Object]
    
    Returns:
		None
    
    Example(s):
		[_myObjective, 30, _nearestPool] call para_s_fnc_ai_obj_reinforce;
*/
params ["_objective", "_unitCount", "_pool"];

private _objectivePos = getPos _objective;

//Can we do a direct reinforce, or are players too close?
private _blockDirectRange = para_s_ai_obj_reinforce_block_direct_spawn_range;

//Spawn types:
//- DIRECT: On the point
//- FOOT: Units spawn a distance away, and are forced to run in on foot.

private _enabledSpawnTypes = _x getVariable ["enabled_spawn_types", ["DIRECT", "FOOT"]];

private _spawnPosition = [];

//Direct spawn if no players blocking it.
if ("DIRECT" in _enabledSpawnTypes && {count (allPlayers inAreaArray [getPos _objective, _blockDirectRange, _blockDirectRange]) <= 0}) then 
{
	//World position because we're using simple objects
	_spawnPosition = _objectivePos;
};

//Foot spawn if no other option.
if (_spawnPosition isEqualTo []) then 
{
	private _validAttackAngles = [getPos _objective] call para_g_fnc_spawning_valid_attack_angles;
	private _tracerDirection = (_validAttackAngles select 0) + random ((_validAttackAngles select 1) - (_validAttackAngles select 0));
	private _tracerResult = [_objectivePos, nil,  _tracerDirection, 300] call para_g_fnc_spawning_find_valid_position_tracer;
	if !(_tracerResult isEqualTo []) then {_spawnPosition = _tracerResult select 0;};
};

private _squadType = _objective getVariable "squad_type";

private _groups = [];
private _units = [];

[
	_unitCount,
	_objective getVariable "squad_size",
	{
		params ["_squadSize"];
		private _squadComposition = [_squadType, east, _squadSize, _spawnPosition] call para_g_fnc_spawning_get_squad_composition;
		private _squad = [_squadComposition, east, _spawnPosition] call para_s_fnc_loadbal_create_squad;
		_groups pushBack (_squad # 1);
		_units append (_squad # 0);
	}
] call para_s_fnc_ai_obj_create_squads_from_unit_count;

[_groups] call para_s_fnc_ai_obj_give_group_ownership;

{
	_x setVariable ["reinforcementsPool", _pool];
} forEach _units;

//Update the list of units spawned from the pool, trimming any deleted ones.
_pool setVariable ["units", (_pool getVariable ["units", []] select {!isNull _x}) + _units];

{
	[_x, _objective] call para_s_fnc_ai_obj_assign_to_objective;
} forEach _groups;