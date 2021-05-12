/*
	File: fn_task_refresh_tasks_client.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No

	Description:
		[!:info] Only works on client
		Updates the client's task list with the task state currently available in the BIS Task framework.
		Used to handle situations where the state of the task isn't sync'ing properly (usually because it's targeting a group).
	
	Parameter(s):
		_taskIds - Array of task Ids [String[]]
	
	Returns: nothing
	
	Example(s):
		// Server
		[["id_1", "id_2"]] remoteExecCall ["vn_mf_fnc_task_refresh_tasks_client", 0];

		// Client
		(call vn_mf_fnc_task_refresh_tasks_client);
*/

params ["_taskIds"];

if (isNil "_taskIds" && isNil "vn_mf_task_ids") exitWith {};
if (isNil "_taskIds" && !(isNil "vn_mf_task_ids")) then {
	_taskIds = vn_mf_task_ids;
};

//Delete all simple tasks.
{
	player removeSimpleTask _x;
} forEach simpleTasks player;

{
	private _taskInfo = missionNamespace getVariable [format ["task_%1", _x], []];	
	if !(_taskInfo isEqualTo []) then {
		private _subtasks = _taskInfo select 1;
		_taskIds append (_subtasks apply {_x # 0});
	};
} forEach +_taskIds;

{
	private _taskVariable = _x call BIS_fnc_taskVar;
	private _simpleTask = player getVariable [_taskVariable, taskNull];

	//We have to remove the tasks system's record of the tasks
	//Otherwise the poor thing gets confused and stops working.
	player setVariable [_taskVariable, nil];

	//Reinitialise the simple task from the task system.
	[_x, false] call BIS_fnc_setTaskLocal;
} forEach _taskIds;
