/*
	File: fn_task_counterattack.sqf
	Author: Spoffy
	Date: 2020-05-02
	Last Update: 2020-0502-15
	Public: No

	Description:
		Primary task to defend a zone against an enemy attack, and clear out nearby entrenchments.
		Uses the state machine task system.

	Parameter(s):
		_taskDataStore - Namespace for storing task info [Object]

	Returns: nothing

	Example(s):
		Not directly called.
*/

/* 
	Requires Task Variables:
		- originZone - Id of zone where attack originates
*/

params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	//Required parameters
	private _marker = _taskDataStore getVariable "taskMarker";
	private _zonePosition = markerPos _marker;
	private _prepTime = _taskDataStore getVariable ["prepTime", 0];

	private _attackTime = serverTime + (_taskDataStore getVariable ["prepTime", 0]);
	_taskDataStore setVariable ["attackTime", _attackTime];
	_taskDataStore setVariable ["attackPos", _zonePosition];
	_taskDataStore setVariable ["attackAreaSize", markerSize _marker];

	if (_prepTime > 0) then 
	{
		["CounterAttackPreparing", ["", (_prepTime / 60) toFixed 0]] remoteExec ["para_c_fnc_show_notification", 0];
		["Counterattack In", _attackTime, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;
	};

	[[
		["prepare_zone", _zonePosition]
	]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["prepare_zone", {
	params ["_taskDataStore"];

	if (_taskDataStore getVariable "attackTime" > serverTime) exitWith {};

	["CounterAttackImminent", []] remoteExec ["para_c_fnc_show_notification", 0];
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;

	//Default to X waves.
	private _baseMultiplier = 4;
	//Add a wave for each camp in our origin zone.
	private _infantryMultiplier = _baseMultiplier;

	private _attackObjective = [
		_taskDataStore getVariable "attackPos",
		//Difficulty 2, unless specified otherwise.
		_taskDataStore getVariable ["attackDifficulty", 2],
		_infantryMultiplier
	] call para_s_fnc_ai_obj_request_attack;

	_taskDataStore setVariable ["attackObjective", _attackObjective];
	_taskDataStore setVariable ["startTime", serverTime];

	["SUCCEEDED", [["defend_zone", _taskDataStore getVariable "attackPos"]]] call _fnc_finishSubtask;
}];

_taskDataStore setVariable ["defend_zone", {
	params ["_taskDataStore"];

	private _attackPos = _taskDataStore getVariable "attackPos";
	private _areaSize = _taskDataStore getVariable "attackAreaSize";
	private _areaDescriptor = [_attackPos, _areaSize select 0, _areaSize select 1, 0, false];

	//Side check - downed players don't count. Nor do players in aircraft. Ground vehicles are fair game.
	private _alivePlayersInZone = 
		allPlayers inAreaArray _areaDescriptor
		select {alive _x && side _x == west && !(vehicle _x isKindOf "Air") && !(_x getVariable ["vn_revive_incapacitated", false])};

	private _aliveEnemyInZone = 
		allUnits inAreaArray _areaDescriptor 
		select {alive _x && side _x == east};

	private _enemyOwnZoneStartTime = _taskDataStore getVariable "enemyOwnZoneStartTime";
	//Enemy hold the zone if no living players, and there's at least 1 guy in the zone.
	private _enemyHoldZone = count _alivePlayersInZone == 0 && count _aliveEnemyInZone > 0;

	if (_enemyHoldZone && isNil "_enemyOwnZoneStartTime") then {
		_enemyOwnZoneStartTime = serverTime;
		_taskDataStore setVariable ["enemyOwnZoneStartTime", _enemyOwnZoneStartTime];
	};

	//Enemy hold the zone for X seconds, we've failed
	if (_enemyHoldZone && {serverTime - _enemyOwnZoneStartTime > (_taskDataStore getVariable ["failureTime", 30])}) then {
		["FAILED"] call _fnc_finishSubtask;
		["FAILED"] call _fnc_finishTask;
	};

	private _startTime = _taskDataStore getVariable "startTime";

	//Zone has been held long enough, or they've killed enough attackers for the AI objective to complete.
	if (serverTime - _startTime > (_taskDataStore getVariable ["holdDuration", 1200]) 
	    || isNull (_taskDataStore getVariable "attackObjective")
	) then {
		_taskDataStore setVariable ["zoneDefended", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};

}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (   _taskDataStore getVariable ["zoneDefended", false] 
	) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	params ["_taskDataStore"];
	[_taskDataStore getVariable "attackObjective"] call para_s_fnc_ai_obj_finish_objective;
}];
