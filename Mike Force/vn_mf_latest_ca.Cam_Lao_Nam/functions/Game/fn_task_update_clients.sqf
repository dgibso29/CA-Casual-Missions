/*
	File: fn_task_update_clients.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-03
	Public: No

	Description:
		Sends a view of the current tasks to all of the clients.
		Note: The global variables set in this file are NOT TO BE USED BY THE SERVER. The server has better sources of info.

	Parameter(s): none

	Returns: nothing

	Example(s): none
*/

//Create a list of all the task IDs for the client.
vn_mf_task_ids = [];

{
	_x params ["_taskId", "_taskDataStore"];
	vn_mf_task_ids pushBack _taskId;

	private _taskInfo = [
		//Name of the zone, e.g 'zone_ba_ria'
		_taskDataStore getVariable "taskMarker",
		//Array of all subtask IDs ["1:secondary_gh1_subtask_1"]
		_taskDataStore getVariable ["taskSubtasks", []]
	];

	//Send information on that task to the client.
	missionNamespace setVariable [format ["task_%1", _taskId], _taskInfo, true];
} forEach vn_mf_tasks;

publicVariable "vn_mf_task_ids";