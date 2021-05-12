/*
	File: fn_cleanup_subsystem_init.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-03
	Public: No

	Description:
		Initialises the Cleanup Subsystem.

	Parameter(s): nothing

	Returns: nothing

	Example(s):
		call para_s_fnc_cleanup_subsystem_init;
*/

para_s_cleanup_minPlayerDistance = 400;
para_s_cleanup_max_bodies = 30;

para_s_cleanup_items = [];

["cleanup", para_s_fnc_cleanup_job, [], 60] call para_g_fnc_scheduler_add_job;