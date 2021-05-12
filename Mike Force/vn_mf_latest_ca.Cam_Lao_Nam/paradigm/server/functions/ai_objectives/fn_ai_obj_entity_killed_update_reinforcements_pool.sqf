/*
    File: fn_ai_obj_entity_killed_update_reinforcements_pool.sqf
    Author: Spoffy
    Date: 2020-12-22
    Last Update: 2020-12-22
    Public: No
    
    Description:
        EntityKilled event handler, that updates the reinforcement pool with the info that the entity is dead.
		Specifically - reduces the overall % of units remaining in the pool.
    
    Parameter(s):
		_entity - Entity killed [Object]
		_killer - Entity that did the killing [Object]
		_instigator - Person who "pulled the trigger" [Object]
		_useEffects - Same as useEffects in setDamage alternative syntax [Boolean]
    
    Returns:
		none
    
    Example(s):
		addMissionEventHandler ["EntityKilled", para_s_fnc_ai_obj_entity_killed_update_reinforcements_pool];
*/

params ["_entity", "_killer", "_instigator", "_useEffects"];

private _pool = _entity getVariable "reinforcementsPool";
if !(isNil "_pool") then 
{
	_pool setVariable [
		"remaining", 
		(_pool getVariable ["remaining", 1]) - (1 / (_pool call para_s_fnc_ai_obj_reinforcement_pool_unit_capacity)) max 0
	];
};