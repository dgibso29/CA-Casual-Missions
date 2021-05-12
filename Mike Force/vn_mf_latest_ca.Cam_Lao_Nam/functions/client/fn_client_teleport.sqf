/*
    File: fn_client_teleport.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-03-13
    Last Update: 2020-05-28
    Public: No

    Description:
	    Execute teleport remote exec.

    Parameter(s):
        _teleporterName - Name of the source teleporter
        _destination - Name of the destination

    Returns: nothing

    Example(s):
        [_teleporter, _dest] call vn_mf_fnc_client_teleport
*/

['teleport',_this] call para_c_fnc_call_on_server;
