/*
	File: fn_player_can_enter_vehicle.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No
	
	Description:
		Check if the player can enter the vehicle.
	
	Parameter(s):
	_player - Player that wants to enter [Object]
	_role - Role in the vehicle they want to enter [String]
	_vehicle - Vehicle that the player is entering [Object]
	
	Returns:
		Can they enter the vehicle? [Boolean]
	
	Example(s): none
*/


params ["_player", "_role", "_vehicle"];

if (_role == "driver") exitWith {
	private _teamsVehicleIsLockedTo = _vehicle getVariable ["teamLock", []] apply {missionNamespace getVariable [_x, grpNull]};
	if (_teamsVehicleIsLockedTo isEqualTo [] || group _player in _teamsVehicleIsLockedTo) exitWith {
		true
	};
	false
};

true