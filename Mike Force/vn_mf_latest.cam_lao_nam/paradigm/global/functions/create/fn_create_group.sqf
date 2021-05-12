/*
	File: fn_create_group.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-01
	Public: No
	
	Description:
		Wrapper around script command 'createGroup', to allow us to implement gamemode-specific functionality.
	
	Parameter(s):
		_side - Side of the group [Side]
		_deleteWhenEmpty - Whether or not to delete the group when empty [Boolean, defaults to true]
	
	Returns:
		Group created [Group]
	
	Example(s):
		[east, false] call para_g_fnc_create_group
*/

params ["_side", ["_deleteWhenEmpty", true]];

createGroup [_side, _deleteWhenEmpty];