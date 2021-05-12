/*
    File: fn_building_on_non_functional.sqf
    Author: Spoffy
    Date: 2020-11-08
    Last Update: 2020-11-08
    Public: No
    
    Description:
        Called when a building becomes non-functional
    
    Parameter(s):
		_building - Building that stopped being functional [OBJECT]
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
		[_building] call para_s_fnc_building_on_non_functional
*/

params ["_building"];

[_building, "onBuildingNonFunctional", [_building]] call para_s_fnc_building_fire_feature_event;