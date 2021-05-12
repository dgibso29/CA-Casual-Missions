/*
    File: fn_base_delete.sqf
    Author: Spoffy
    Date: 2020-10-03
    Last Update: 2020-10-03
    Public: No
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [parameter] call vn_fnc_myFunction
*/
params ["_base"];

{
	[_x] call para_s_fnc_building_disconnect_base;
} forEach (_base getVariable "para_g_buildings");

para_g_bases = para_g_bases - [_base];

deleteVehicle _base;

publicVariable "para_g_bases";