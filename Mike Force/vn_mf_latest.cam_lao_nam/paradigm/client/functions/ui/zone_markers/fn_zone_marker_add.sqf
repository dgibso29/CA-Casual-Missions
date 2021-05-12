/*
    File: fn_zone_marker_add.sqf
    Author: Terra
    Date: 2021-02-20
    Last Update: 2021-02-21
    Public: Yes
    
    Description:
        Adds the given marker the to the Zone Marker system.
    
    Parameter(s):
        _marker - Marker that should display information about the zone when hovered above [STRING, defaults to nil]
    
    Returns:
        Index of the marker in the zone marker list [NUMBER]
    
    Example(s):
        ["zone_locationName"] call para_c_fnc_zone_marker_add;
*/
params ["_marker"];
if (isNil "para_c_fnc_zone_markers_list") then {para_c_fnc_zone_markers_list = []};
para_c_fnc_zone_markers_list pushBackUnique _marker
