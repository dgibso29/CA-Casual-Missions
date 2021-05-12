/*
    File: fn_serialize_namespace.sqf
    Author: Spoffy, AWOL
    Date: 2020-08-20
    Last Update: 2020-08-20
    Public: Yes
    
    Description:
		Serializes a namespace into an array of key-value pairs.
    
    Parameter(s):
		_namespace - Namespace to serialize [NAMESPACE]
		_additionalVars - Extra vars that need serializing, that don't begin with the standard prefix [ARRAY]
    
    Returns:
        Array of key-value arrays
    
    Example(s):
		[cursorObject] call para_g_fnc_serialize_namespace
*/

params ["_namespace", ["_additionalVars", []]];

private _varsToSave = (allVariables _namespace) select {_x find "para_db_" isEqualTo 0 || _x in _additionalVars};
private _varData = [];

{
	_varData pushBack [_x, _namespace getVariable _x];
} forEach _varsToSave;

_varData