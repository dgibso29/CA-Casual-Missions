/*
	File: fn_wheel_menu_add_obj_action.sqf
	Author: AWOL, Spoffy
	Date: 2020-05-28
	Last Update: 2020-07-04
	Public: Yes

	Description:
		Adds an action to the wheel menu.
		By using this with JIP, we can have a mixture of local actions and server-added actions, without the risk of the server overriding the client's actions.

	Parameter(s):
		Identical to para_c_fnc_wheel_menu_create_entry

	Returns:
		Function reached the end [BOOL]

	Example(s): none
     
 */

params [
	"_object"
];

private _entry = _this call para_c_fnc_wheel_menu_create_entry;
private _actions = _object getVariable ["para_wheel_menu_dyn_actions", []];

_actions pushBack _entry;

_object setVariable ["para_wheel_menu_dyn_actions", _actions];








