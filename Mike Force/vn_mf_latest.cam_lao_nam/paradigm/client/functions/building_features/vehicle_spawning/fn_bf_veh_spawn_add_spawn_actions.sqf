/*
    File: fn_bf_veh_spawn_add_spawn_actions.sqf
    Author: Spoffy
    Date: 2020-11-17
    Last Update: 2020-11-17
    Public: No
    
    Description:
        Adds vehicle spawning actions to an object, based on the building config.
    
    Parameter(s):
		_buildingObject - Object to add actions to [OBJECT]
    
    Returns:
		None
    
    Example(s):
		[_object] remoteExecCall ["para_c_fnc_bf_veh_spawn_add_spawn_actions", 2];
*/

params ["_buildingObject"];

//This *must* be defined, as the server will only use valid buildings.
private _building = _buildingObject getVariable "para_g_building";
private _buildingConfig = [_building] call para_g_fnc_get_building_config;

//TODO - Fill in when building sides are implemented.
private _buildingSide = "";
private _vehicleConfigs = "getText(_x >> 'side') in ['',_buildingSide]" configClasses (_buildingConfig >> "features" >> "vehicle_spawning" >> "vehicles");

{
	private _vehicleConfig = _x;
	[
		_buildingObject,
		{[_this getVariable ["para_g_building", objNull]] call para_g_fnc_building_is_functional},
		"",
		"",
		[_buildingObject, _vehicleConfig],
		getText (configFile >> "CfgVehicles" >> configName _vehicleConfig >> "displayName"),
		"para_c_fnc_bf_veh_spawn_request_vehicle_spawn"
	] call para_c_fnc_wheel_menu_add_obj_action;
} forEach _vehicleConfigs;