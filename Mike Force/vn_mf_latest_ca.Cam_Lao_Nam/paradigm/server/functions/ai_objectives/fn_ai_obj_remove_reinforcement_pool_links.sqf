/*
	File: fn_ai_obj_remove_reinforcement_pool_links.sqf
	Author: Spoffy
	Date: 2020-12-22
	Last Update: 2020-12-22
	Public: No
	
	Description:
		Remove the links between an objective and its reinforcement pools, or vice-versa.
		Each objective needs to know about the pools available, and each pool needs to know about the objectives it serves.
	
	Parameter(s):
		_item - Either a pool or an objective [OBJECT]
	
	Returns:
		Items unlinked, either pools or objectives [ARRAY]
	
	Example(s):
		[_myPool] call para_s_fnc_ai_obj_remove_reinforcement_pool_links
*/

params ["_item"];

if (_item getVariable "entity_type" == "reinforcement_pool") exitWith
{
	private _linkedObjectives =	_item getVariable ["objectives", []];

	{
		_x setVariable ["reinforcement_pools", (_x getVariable ["reinforcement_pools", []]) - [_item]];
	} forEach _linkedObjectives;

	_item setVariable ["objectives", []];

	_linkedObjectives
};

if (_item getVariable "entity_type" == "objective") exitWith
{
	private _linkedPools =	_item getVariable ["reinforcement_pools", []];

	{
		_x setVariable ["objectives", (_x getVariable ["objectives", []]) - [_item]];
	} forEach _linkedPools;

	_item setVariable ["reinforcement_pools", []];

	_linkedPools
};
