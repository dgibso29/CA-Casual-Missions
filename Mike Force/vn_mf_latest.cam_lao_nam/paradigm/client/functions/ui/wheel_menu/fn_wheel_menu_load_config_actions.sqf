/*
	File: fn_wheel_menu_load_config_actions.sqf
	Author: Spoffy
	Date: 2020-10-09
	Last Update: 2020-10-09
	Public: No
	
	Description:
		Loads wheel menu actions from the config file.
	
	Parameter(s):
		None
	
	Returns:
		Function reached the end [BOOL]
	
	Example(s):
		[] call para_g_fnc_wheel_menu_load_config_actions
*/

private _configEntries = "getText (_x >> 'function') != ''" configClasses (missionConfigFile >> "wheel_menu_actions");

para_c_wheel_menu_actions_always = [];
para_c_wheel_menu_actions_no_target = [];

{
	private _config = _x;
	private _colorCodes = getArray (_config >> "color_codes");
	private _iconColorCodes = getArray (_config >> "icon_color_codes");

	//We set this up to be passed as arguments to para_c_fnc_wheel_menu_add_obj_action
	private _arguments = [
		compile getText (_config >> "condition"),
		getText (_config >> "icon"),
		getText (_config >> "icon_highlighted"),
		compile getText (_config >> "arguments"), 
		getText (_config >> "text") call para_c_fnc_localize, 
		getText (_config >> "function"), 
		getNumber (_config >> "spawn") > 0,
		//Default the colorCodes, as wheel menu breaks without them
		[_colorCodes, [ [0.2,0.2,0.2,0.8], [0.8,0.8,0.8,1] ]] select (_colorCodes isEqualTo []),
		[_iconColorCodes, [ [0.6,0.6,0.6,0.8], [1,1,1,0.95] ]] select (_iconColorCodes isEqualTo [])
	];

	private _visibility = getText (_config >> "visible");

	switch (_visibility) do {
		case "ALWAYS": {para_c_wheel_menu_actions_always pushBack _arguments};
		case "NO_TARGET": {para_c_wheel_menu_actions_no_target pushBack _arguments};
	};

	localNamespace setVariable [format ["para_c_wheel_menu_action_%1", configName _config], _arguments];
} forEach _configEntries;
