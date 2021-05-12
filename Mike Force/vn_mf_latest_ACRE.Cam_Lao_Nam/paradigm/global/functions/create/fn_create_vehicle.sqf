/*
	File: fn_create_vehicle.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-01
	Public: No
	
	Description:
		Wrapper around script command 'createVehicle'.
	
	Parameter(s):
		// Same as 'createVehicle'
	
	Returns:
		Created vehicle, or objNull if not possible [Object]
	
	Example(s): none
*/

params ["_type", "_position", ["_markers", []], ["_placement", 0], ["_special", "NONE"]];

createVehicle [_type, _position, _markers, _placement, _special];