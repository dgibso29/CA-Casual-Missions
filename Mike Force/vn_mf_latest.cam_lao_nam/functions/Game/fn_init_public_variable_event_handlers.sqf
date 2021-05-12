/*
	File: fn_init_public_variable_event_handlers.sqf
	Author: Aaron Clark <vbawol>
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No
	
	Description:
		Event handler for player object variables
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s):
		call vn_mf_fnc_init_public_variable_event_handlers;
*/

// TODO remove unsed file
{
	_x params ["_name", "_function"];
	// set handler and use already compiled functions
	_name addPublicVariableEventHandler [player, missionNamespace getVariable [_function,{}]];
} forEach getArray(missionConfigFile >> "gamemode" >> "stats" >> "tracking" );
