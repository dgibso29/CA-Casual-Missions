/*
    File: fn_wheel_menu_open.sqf
    Author: Aaron Clark <vbawol> and Spoffy
    Date: 2020-04-16
    Last Update: 2020-05-28
    Public: Yes

    Description:
		Enables Dynamic Wheel Menu Selector.

    Parameter(s): 


    Returns:
		Always returns true [BOOL]

    Example(s):
		call para_c_fnc_wheel_menu_open;
*/

private _isIncapacitated = [player] call para_g_fnc_unit_is_incapacitated;
if (_isIncapacitated) exitWith { true };

private _display = uiNamespace getVariable ["vn_wheelmenu", displayNull];
if(isNull _display)then
{
	getCursorObjectParams params ["_target", "_selections", "_distance"];
	private _actions = [];

	// find target or use player if target is too far away
	if (isNull _target || {_distance > 5}) then
	{
		_target = player;
		_actions append para_c_wheel_menu_actions_no_target;
	};

	_actions append para_c_wheel_menu_actions_always;

	private _entries = _actions apply {([_target] + _x) call para_c_fnc_wheel_menu_create_entry};

	// Get actions added to the target object
	_entries append (_target getVariable ["para_wheel_menu_dyn_actions", []]);

	// do condition checks
	_finalEntries = [];
	{
		_x params ["_wheelParams",["_condition",true]];
		if (_condition isEqualType {}) then {
			_condition = _target call _condition;
		};

		if (_condition) then
		{
			_finalEntries pushBack _wheelParams;
		};
	} forEach _entries;

	//Wheel menu won't open with 1 entry.
	//Need to add a blank placeholder.
	if (count _finalEntries == 1) then 
	{
		_finalEntries pushBack [
			"",
			"",
			[[[], ""], "", true],
			[ [0.2,0.2,0.2,0.8], [0.8,0.8,0.8,1] ],
			[ [0.6,0.6,0.6,0.8], [1,1,1,0.95] ]	
		]
	};

	// enable menu
	[_finalEntries] call vn_fnc_wm_init;

	// close menu on repeated press
	private _EH_closeWM = {
		params["_display","_button","_shift","_ctrl","_alt"];
		if (isNil "para_g_wheel_menu_enabled") then
		{
			para_g_wheel_menu_enabled = true;
			private _key_bind = ["para_keydown_open_wheel_menu"] call para_c_fnc_get_key_bind;
			if(([_button,_shift,_ctrl,_alt] joinString "_") isEqualTo (_key_bind joinString "_"))then
			{
				if(!isNull _display)then
				{
					_display closeDisplay 1;
				};
			};
		};
	};

	private _EH_closeWM_up = {
		params["_display","_button","_shift","_ctrl","_alt"];
		if !(isNil "para_g_wheel_menu_enabled") then
		{
			private _key_bind = ["para_keydown_open_wheel_menu"] call para_c_fnc_get_key_bind;
			if(([_button,_shift,_ctrl,_alt] joinString "_") isEqualTo (_key_bind joinString "_"))then
			{
				para_g_wheel_menu_enabled = nil;
			};
		};
	};


	// add handler to close menu
	_display = uiNamespace getVariable ["vn_wheelmenu", displayNull];
	if(!isNull _display)then
	{
		_display displayAddEventHandler ["KeyDown", _EH_closeWM];
		_display displayAddEventHandler ["KeyUp", _EH_closeWM_up];
	};

};
true
