/*
	File: fn_spawning_valid_angles.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-31
	Public: Yes
	
	Description:
		Calculate valid angles to spawn in at when attacking a point.
	
	Parameter(s):
		_pos - Position to attack [Position]
	
	Returns: nothing
	
	Example(s): none
*/

params ["_position"];

_this call para_interop_fnc_valid_attack_angles


