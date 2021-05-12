/*
	File: fn_task_pri_capture.sqf
	Author: Spoffy
	Date: 2020-05-01
	Last Update: 2020-06-12
	Public: No

	Description:
		Primary task to take over a zone - clearing enemy forces out of it.
		Uses the state machine task system.

	Parameter(s):
		_taskDataStore - Namespace for storing task info [Object]

	Returns: nothing

	Example(s):
		Not directly called.
*/

/*
 * Task Parameters:
 *    None
 * Subtask Parameters:
 * 	  None
 * Runtime Parameters:
 *    None
 */

params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	private _zone = _taskDataStore getVariable "taskMarker";
	private _zonePosition = getMarkerPos _zone;

	//TODO - Add event handler to SiteDestroyed
	private _hqs = (localNamespace getVariable ["sites_hq", []]) inAreaArray _zone;
	private _hqPosition = if (count _hqs > 0) then {getPos (_hqs # 0)} else {_zonePosition};

	[[["kill_enemy", _zonePosition], ["destroy_sites", _zonePosition], ["destroy_enemy_supplies", _hqPosition]]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["kill_enemy", {
	params ["_taskDataStore"];

	private _zone = (_taskDataStore getVariable "taskMarker");

	private _playerCount = 0;
	private _enemyCount = 0;

	private _reinforcementPools = para_s_ai_obj_reinforcement_pools inAreaArray _zone;

	if ({_x getVariable ["remaining",0] > 0.5} count _reinforcementPools == 0) exitWith
	{
		_taskDataStore setVariable ["enemy_killed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["destroy_sites", {
	params ["_taskDataStore"];

	private _zone = (_taskDataStore getVariable "taskMarker");

	private _numberOfSites = count (localNamespace getVariable "sites" inAreaArray [markerPos _zone, 1200, 1200]);

	if (_numberOfSites == 0) exitWith
	{
		_taskDataStore setVariable ["sites_destroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["destroy_enemy_supplies", {
	params ["_taskDataStore"];

	private _zone = (_taskDataStore getVariable "taskMarker");
	private _hqs = (localNamespace getVariable ["sites_hq", []]) inAreaArray _zone;

	if (_hqs select {!isNull _x} isEqualTo []) then {
		_taskDataStore setVariable ["suppliesDestroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (
		_taskDataStore getVariable ["enemy_killed", false] 
		&& _taskDataStore getVariable ["suppliesDestroyed", false]
		&& _taskDataStore getVariable ["sites_destroyed", false]
		) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	[_taskDataStore getVariable "taskMarker"] call vn_mf_fnc_zones_capture_zone;
}];
