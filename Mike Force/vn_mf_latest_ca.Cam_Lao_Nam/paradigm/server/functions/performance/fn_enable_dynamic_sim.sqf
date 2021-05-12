/*
    File: fn_enable_dynamic_sim.sqf
    Author: Spoffy
    Date: 2021-04-04
    Last Update: 2021-04-04
    Public: Yes
    
    Description:
		Enables dynamic simulation for an object globally
    
    Parameter(s):
		_object - Object to enable dynamic simulation on [OBJECT]
		_enable - Whether or not to enable dynamic simulation [BOOL]
    
    Returns:
		New state of dynamic simulation [BOOL]
    
    Example(s):
		[cursorObject] call para_s_fnc_enable_dynamic_sim
*/

params ["_object", ["_enable", true, [true]]];

[[_object, _enable], "enableDynamicSimulation", 0, _object] call para_s_fnc_remoteExec_jip_obj_stacked;

_enable