/*
	File: fn_force_team_change.sqf
	Author: Aaron Clark <vbawol>, Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No
	
	Description:
		Forces a player to switch to the given team.
	
	Parameter(s):
		_player - Player to force the team switch on [Object]
		_team - Name of the team [String]

	Returns: nothing
	
	Example(s):
		[player, "MikeForce"] call vn_mf_fnc_force_team_change
		[player, missionNamespace getVariable "MikeForce"] call vn_mf_fnc_force_team_change
*/

params ["_player", "_team"];

if (_team isEqualType "") then {
	_team = missionNamespace getVariable [_team, grpNull];
};

if (_team == grpNull) exitWith {["Cannot join player %1 to null group", _player] call BIS_fnc_logFormat;};

private _currentGroup = group _player;

// join group
_player setVariable ["vn_mf_db_player_group", groupId _team, true];

// spawn dummy unit to prevent group deletion
if (count (units _currentGroup) isEqualTo 1) then {
	private _dummyUnit = _currentGroup createUnit ["logic", [0,0,0], [], 0, "NONE"];
	_dummyUnit allowDamage false;
	_dummyUnit disableAI "ALL";
	_dummyUnit enableSimulationGlobal false;
};

["Joining player %1 to team %2", _player, _team] call BIS_fnc_logFormat;
[_player] joinSilent _team;

//The join isn't guaranteed to happen immediately, so we need to wait until it happens, then clear out dummy units.
[_player, _team] spawn {
	params ["_player", "_team"];
	private _time = diag_tickTime + 10;
	//Wait until the group change has happened, or 10 seconds has elapsed (so we don't leave this kicking around the scheduler indefinitely)
	waitUntil {sleep 0.1; group player == _team || diag_tickTime > _time};
	//Stop them being ordered around via the radio. 
	doStop _player;
	{
		deleteVehicle _x;
	} forEach (units _team select {typeOf _x isEqualTo "logic"});
};

[[_team], {
	params ["_team"];
	private _time = diag_tickTime + 10;
	//Wait until the group change has happened, or 10 seconds has elapsed (so we don't leave this kicking around the scheduler indefinitely)
	waitUntil {sleep 0.1; group player == _team || diag_tickTime > _time};
	[] call vn_mf_fnc_task_refresh_tasks_client;
	[] call vn_mf_fnc_tr_overview_team_update;
}] remoteExec ["spawn", _player];