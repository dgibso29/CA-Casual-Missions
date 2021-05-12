/*
    File: fn_training.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-03-11
    Last Update: 2020-05-28
    Public: No

    Description:
	    Enables/disables training.

    Parameter(s):
        _ - not used [STRING]
        _trait - trait name [STRING]

    Returns: nothing

    Example(s):
	    ["","engineer"] call vn_mf_fnc_training;
*/

params
[
	"",			// 0 : STRING - not used but passed from menu
	"_trait" 		// 1 : STRING - trait name
];

private _traits = getArray (missionConfigFile >> "gamemode" >> "traits" >> "names");

private _index = _traits find _trait;

if (_index != -1) then
{
	["settrait", [_index,_agent]] call para_c_fnc_call_on_server;
};
