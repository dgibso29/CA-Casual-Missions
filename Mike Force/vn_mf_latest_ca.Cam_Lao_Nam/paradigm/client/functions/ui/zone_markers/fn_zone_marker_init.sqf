/*
    File: fn_zone_marker_init.sqf
    Author: Terra
    Date: 2021-02-19
    Last Update: 2021-02-21
    Public: Yes
    
    Description:
        Sets up the zone marker system. Zone markers display information about
        a given zone in the map when the player hovers above a given marker,
        that was added with para_c_fnc_zone_markerAdd.
    
    Parameter(s):
        None
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [] call para_c_fnc_zone_marker_init;
*/
#include "..\..\..\configs\ui\ui_def_idc.inc"
private _ctrlZoneMarkerInfo = findDisplay 12 ctrlCreate ["RscStructuredText", PARA_RSCDISPLAYMAP_ZONEINFO_IDC];
_ctrlZoneMarkerInfo ctrlSetPosition [-10, -10, 1, 1];
_ctrlZoneMarkerInfo ctrlSetBackgroundColor [0,0,0,1];
_ctrlZoneMarkerInfo ctrlSetTextColor [1,1,1,1];
_ctrlZoneMarkerInfo ctrlShow false;
para_c_fnc_zone_marker_mapEH = addMissionEventHandler ["Map", {
	params ["_opened", "_isForced"];
	if (!_opened) exitWith {};
    para_c_fnc_zone_marker_latestSelectedMarker = "";
    addMissionEventHandler ["EachFrame", {
        if (!visibleMap) exitWith {
            [] call para_c_fnc_zone_marker_hide_info;
            removeMissionEventHandler ["EachFrame", _thisEventHandler];
        };
        private _map = findDisplay 12;
        private _ctrlMap = _map displayCtrl 51;
        private _mouseMapPos = _ctrlMap ctrlMapScreenToWorld getMousePosition;
        //--- Find a zone marker where the mouse position currently is in
        private _zone_marker = para_c_fnc_zone_markers_list param [para_c_fnc_zone_markers_list findIf {_mouseMapPos inArea _x}, ""];
        if (_zone_marker != "") then {
            if (_zone_marker != para_c_fnc_zone_marker_latestSelectedMarker) then {
                //--- Display information about zone
                [_zone_marker] call para_c_fnc_zone_marker_show_info;
            } else {
                //--- Only update the position of the info
                [_zone_marker] call para_c_fnc_zone_marker_update_info_position;
            };
        } else {
            [] call para_c_fnc_zone_marker_hide_info;
        };
        para_c_fnc_zone_marker_latestSelectedMarker = _zone_marker;
    }];
}];
true
