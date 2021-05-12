/*
    File: fn_zone_marker_show_info.sqf
    Author: Terra
    Date: 2021-02-20
    Last Update: 2021-02-21
    Public: No
    
    Description:
        Internal use. Shows the information about the given marker on the map. 
        Only one zone can be displayed at a time. Only calling this function 
        will not update the tooltip's position. Use para_c_fnc_zone_marker_init and
        para_c_fnc_zone_markerAdd to set up the system.
    
    Parameter(s):
        _marker - Zone marker [STRING, defaults to nil]
    
    Returns:
        Information about the zone [TEXT]
    
    Example(s):
        ["zone_locationName"] call para_c_fnc_zone_marker_show_info;
*/
#include "..\..\..\configs\ui\ui_def_idc.inc"
params ["_marker"];
private _map = findDisplay 12;
private _ctrlMap = _map displayCtrl 51;
_ctrlZoneMarkerInfo = _map displayCtrl PARA_RSCDISPLAYMAP_ZONEINFO_IDC;
/* 
    ****************************************
    TODO: Get all information about the zone
    ****************************************
*/
private _zoneName = _marker;
//--- Set the text of the marker, position will be updated automatically
private _info = [
    _marker, // Title
    format ["Enemy strength: %1", 100],
    format ["Enemy size: %1", 234]
];
//--- Get max text width (workaround for multiline ctrlTextWidth)
private _titleSize = 1.5;
private _cfgRscStructuredText = configFile >> "RscStructuredText";
private _textSize = getNumber (_cfgRscStructuredText >> "size");
private _textFont = getText (_cfgRscStructuredText >> "Attributes" >> "font");
private _maxTextW = selectMax (_info apply {
    private _sizeModifier = [1, _titleSize] select (_info select 0 == _x);
    _x getTextWidth [_textFont, _textSize * _sizeModifier]
});
_maxTextW = _maxTextW + 2 * 0.016;
_ctrlZoneMarkerInfo setVariable ["MaxTextWidth", _maxTextW];
//--- Set the text
_info set [0, format ["<t size='%2'>%1</t>", _info select 0, _titleSize]];
_ctrlZoneMarkerInfo ctrlSetStructuredText parseText (_info joinString "<br/>");
[_marker] call para_c_fnc_zone_marker_update_info_position;
_ctrlZoneMarkerInfo ctrlShow true;
_info
