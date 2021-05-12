/*
    File: fn_debug_monitor.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-01-29
    Last Update: 2020-05-28
    Public: No

    Description:
	    Debug Monitor.

    Parameter(s): none

    Returns: nothing

    Example(s):
	    call vn_mf_fnc_debug_monitor;
*/

private _texts = [];
{
	private _name = configName _x;
	_texts pushBack (format["%1: %2\n",_name,(player getVariable [format["vn_mf_db_%1",_name],0])]);
} forEach ("isClass(_x)" configClasses (missionConfigFile >> "gamemode" >> "stats"));
hintSilent (_texts joinString "");
