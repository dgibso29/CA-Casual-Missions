/*
	File: fn_ai_obj_add_reinforcement_pool_links.sqf
	Author: Spoffy
	Date: 2020-12-22
	Last Update: 2020-12-22
	Public: No
	
	Description:
		Updates the links between an objective and reinforcement pools.
		Each objective needs to know about the pools available, and each pool needs to know about the objectives it serves.
	
	Parameter(s):
		_item - Either a pool or an objective [OBJECT]
	
	Returns:
		Items linked to, either pools or objectives [ARRAY]
	
	Example(s):
		[_myPool] call para_s_fnc_ai_obj_add_reinforcement_pool_links
*/

params ["_item"];

if (_item getVariable "entity_type" == "reinforcement_pool") exitWith
{
	//Locate nearby objectives, and add this pool to their available pools.
	private _nearbyObjectives = para_s_ai_obj_objectives inAreaArray [getPos _item, para_s_ai_obj_reinforcement_pool_range, para_s_ai_obj_reinforcement_pool_range];

	{
		_x setVariable ["reinforcement_pools", (_x getVariable ["reinforcement_pools", []]) + [_item]];
	} forEach _nearbyObjectives;

	_item setVariable ["objectives", _nearbyObjectives];

	_nearbyObjectives
};

if (_item getVariable "entity_type" == "objective") exitWith
{
	//Locate nearby pools, and add them to this objective
	private _nearbyPools = para_s_ai_obj_reinforcement_pools inAreaArray [getPos _item, para_s_ai_obj_reinforcement_pool_range, para_s_ai_obj_reinforcement_pool_range];

	{
		_x setVariable ["objectives", (_x getVariable ["objectives", []]) + [_item]];
	} forEach _nearbyPools;

	_item setVariable ["reinforcement_pools", _nearbyPools];

	_nearbyPools
};
