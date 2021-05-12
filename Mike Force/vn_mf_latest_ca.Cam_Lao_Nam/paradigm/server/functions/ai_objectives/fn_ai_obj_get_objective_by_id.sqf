/*
	File: fn_ai_get_objective_by_id.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-03
	Public: No

	Description:
		Retrieve the objective with the given id.

	Parameter(s):
		_id - Objective ID [Number]

	Returns:
		Objective [Location]

	Example(s):
		3 call para_s_fnc_ai_obj_get_objective_by_id;
*/

params ["_id"];

missionNamespace getVariable [format ["para_s_ai_objective_%1", _id], locationNull]
