/*
	File: fn_cleanup_job.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-03
	Public: No

	Description:
		A scheduled job that checks all grids that needs to be cleaned up, and cleans them up if nobody is nearby.

	Parameter(s): nothing

	Returns: nothing

	Example(s): none
*/

private _deadBodies = allDead select {_x isKindOf "Man" && !(_x getVariable ["para_s_cleaned_up", false])};
private _allToClean = _deadBodies + para_s_cleanup_items;

private _inPlayerRange = [];
{
	_inPlayerRange append (_allToClean inAreaArray [getPos _x, para_s_cleanup_minPlayerDistance, para_s_cleanup_minPlayerDistance]);
} forEach allplayers;

private _entitiesToClean = _allToClean - _inPlayerRange;

private _remainingDeadBodies = _deadBodies - _entitiesToClean;

private _deadBodyOverrun = count _remainingDeadBodies - para_s_cleanup_max_bodies;
if (_deadBodyOverrun > 0) then {
	_entitiesToClean append (_deadBodies select [0, _deadBodyOverrun]);
};

{
	_x setVariable ["para_s_cleaned_up", true];
} forEach _entitiesToClean;

para_s_cleanup_items = para_s_cleanup_items - _entitiesToClean;

_entitiesToClean spawn {
	{
		deleteVehicle _x;
		sleep 0.2;
	} forEach _this;
};
