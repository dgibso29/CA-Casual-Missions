/*
    File: fps_tracker.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-03-10
    Last Update: 2020-05-26
    Public: No

    Description:
	Set fps on player locally on server.

    Parameter(s): none

    Returns: nothing

    Example(s):
	Not called directly.
*/

["setfps", diag_fps] call para_c_fnc_call_on_server;
