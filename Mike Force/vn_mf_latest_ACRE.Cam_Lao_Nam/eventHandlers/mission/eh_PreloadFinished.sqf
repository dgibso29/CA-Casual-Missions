/*
    File: eh_PreloadFinished.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-01-29
    Last Update: 2020-05-27
    Public: No

    Description:
	    Preload finished event handler with self destruct.

    Parameter(s): none

    Returns: nothing

    Example(s):
	    Not called directly.
*/

// self destruct EH
removeMissionEventHandler ["PreloadFinished",_thisEventHandler ];
