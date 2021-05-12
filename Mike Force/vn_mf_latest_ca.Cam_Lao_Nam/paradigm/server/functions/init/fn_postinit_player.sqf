/*
	File: fn_postinit_player.sqf
	Author: Spoffy
	Date: 2020-10-20
	Last Update: 2020-10-20
	Public: No
	
	Description:
		Runs the post-init scripts for Paradigm's player init process.
		Remote executed from the client.
	
	Parameter(s):
		_player - Player to run postinit on [OBJECT]
		_didJIP - Whether the player is join in progress [BOOLEAN]
	
	Returns:
		None
	
	Example(s):
		[player, didJIP] remoteExecCall ["para_s_fnc_postinit_player", 2];
*/

params ["_player", "_didJIP"];

diag_log format ["Paradigm: Player postinit - %1 - %2", _player, getPlayerUID _player];

private _owner = remoteExecutedOwner;
if (_owner == 0 || owner _player == 0 || owner _player != remoteExecutedOwner) exitWith {
	diag_log format ["Paradigm: Aborting player postinit, as player object is unowned - %1", _player];
};

private _fnc_playerPostInitServer = compile preprocessFile "para_player_postinit_server.sqf";

[_player, didJIP] call _fnc_playerPostInitServer;
