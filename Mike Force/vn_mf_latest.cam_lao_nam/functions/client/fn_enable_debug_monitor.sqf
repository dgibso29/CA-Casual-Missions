/*
    File: fn_enable_debug_monitor.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-01-29
    Last Update: 2020-05-28
    Public: No

    Description:
	    Enables/disables debug monitor.

    Parameter(s): none

    Returns: nothing

    Example(s):
	    call vn_mf_fnc_enable_debug_monitor
*/

if (isNil "vn_mf_enable_debug_monitor") then
{
	vn_mf_enable_debug_monitor = true;
}
else
{
	vn_mf_enable_debug_monitor = nil;
	hintSilent "Debug Monitor: disabled";
};
false