/*
    File: fn_ai_public_var_set.sqf
    Author: Spoffy
    Date: 2020-07-04
    Last Update: 2020-07-04
    Public: No
    
    Description:
        Sets a public variable in the given namespace.
        Used to provide an abstraction over rehandler.
    
    Parameter(s):
        _namespace - Namespace to set variable in. [NAMESPACE]
        _varName - Name of variable to set [STRING]
        _value - Value to set [ANY]
    
    Returns:
        Nothing
    
    Example(s):
        [_group, "currentThoughts", "needsCheese"] call para_g_fnc_ai_public_var_set;
*/

params ["_namespace", "_varName", "_value"];

private _params = [_namespace, format ["ai_%1", _varName], _value];

if (isServer) then {
    _params call para_s_fnc_set_public_variable;
} else {
    ["set_public_variable", _params] call para_c_fnc_call_on_server;
};
