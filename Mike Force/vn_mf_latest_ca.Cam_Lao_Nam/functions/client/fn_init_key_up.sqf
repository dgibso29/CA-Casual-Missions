/*
    File: fn_init_key_up.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-01-29
    Last Update: 2020-05-28
    Public: No

    Description:
	Setup key up handler functions.

    Parameter(s): none

    Returns: nothing

    Example(s):
	call para_c_fnc_init_key_up;
*/
{
	private _var_key = ["vn_mf_fnc_key_up"];
	private _var_key_data = profileNamespace getVariable [configName _x,[getNumber(_x >> "defaultKey"),getText(_x >> "shift"),getText(_x >> "ctrl"),getText(_x >> "alt")]];
	// fix old data
	if (_var_key_data isEqualType 0) then
	{
		_var_key_data = [getNumber(_x >> "defaultKey"),getText(_x >> "shift"),getText(_x >> "ctrl"),getText(_x >> "alt")];
		profileNamespace setVariable [configName _x,_var_key_data];
	};
	_var_key append _var_key_data;
	missionNamespace setVariable [(_var_key joinString "_"),getText(_x >> "function")];
} forEach ("getNumber(_x >> 'down') == 0" configClasses (missionConfigFile >> "gamemode" >> "keys"));
