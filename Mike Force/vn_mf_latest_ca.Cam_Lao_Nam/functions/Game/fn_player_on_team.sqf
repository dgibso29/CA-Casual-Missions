/*
	File: fn_player_on_team.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No
	
	Description:
		Checks if a player is on a given team
	
	Parameter(s):
		_player - Player to check [Object]
		_team - Id of team [String]
	
	Returns:
		True if player on the given team, false otherwise.
	
	Example(s):
		[player, "MikeForce"] call vn_mf_fnc_playerInTeam
*/

params ["_player", "_team"];

(groupId group _player == _team)