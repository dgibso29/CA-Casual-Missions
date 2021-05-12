/*
    File: fn_building_on_functional.sqf
    Author: Spoffy
    Date: 2020-11-08
    Last Update: 2020-11-08
    Public: No
    
    Description:
        Called when a building becomes functional
    
    Parameter(s):
		_building - Building that became functional [OBJECT]
    
    Returns:
		None
    
    Example(s):
		[_building] call para_s_fnc_building_on_functional
*/

params ["_building"];

[_building, "onBuildingFunctional", [_building]] call para_s_fnc_building_fire_feature_event;