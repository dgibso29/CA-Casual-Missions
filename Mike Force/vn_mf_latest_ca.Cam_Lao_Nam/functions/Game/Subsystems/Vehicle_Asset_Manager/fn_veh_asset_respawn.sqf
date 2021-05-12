/*
	File: fn_veh_asset_respawn.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-03
	Public: No

	Description:
		Respawns a vehicle asset.

	Parameter(s):
		_id - Id of vehicle asset [Number]

	Returns: nothing

	Example(s): none
*/

params ["_id"];

private _vehicleInfo = [_id] call vn_mf_fnc_veh_asset_get_by_id;
private _spawnInfo = _vehicleInfo select struct_veh_asset_info_m_spawn_info;
_spawnInfo params ["_className", "_direction", "_position", "_initialVariables"];

private _oldVehicle = _vehicleInfo select struct_veh_asset_info_m_vehicle;

_oldVehicle enableSimulationGlobal true;
deleteVehicle _oldVehicle;

private _vehicle = [_className, ASLtoAGL _position, [], 0, "NONE"] call para_g_fnc_create_vehicle;

_vehicle setDir _direction;
_vehicle setPosASL _position;

//This restores UAV drivers. Shouldn't need it in VN, but better safe than sorry.
if (getNumber (configfile >> "CfgVehicles" >> _className >> "isUAV") > 0 && count crew _vehicle > 0) then {
	createVehicleCrew _vehicle;
};

//Restore initial variables
//TODO: Un-network this, once teamLock is fixed to be less buggy with respawn.
{
	_vehicle setVariable [_x select 0, _x select 1, true];
} forEach _initialVariables;

_vehicleInfo set [struct_veh_asset_info_m_vehicle, _vehicle];

[_id, _vehicle] call vn_mf_fnc_veh_asset_init_vehicle;
