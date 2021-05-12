/*
    File: fn_building_system_init.sqf
    Author: Spoffy
    Date: 2020-08-21
    Last Update: 2020-08-21
    Public: Yes
    
    Description:
		Initalises the building system
    
    Parameter(s):
		None
    
    Returns:
		None
    
    Example(s):
		[] call para_s_fnc_building_system_init
*/

para_g_max_base_radius = 250;
publicVariable "para_g_max_base_radius";

// init buildables type arrays
private _buildables_config = (_gamemode_config >> "buildables");
private _classes = "isClass _x" configClasses (_buildables_config);
private _types = [];
{
	private _buildable_type = getText(_x >> "type");
	if !(_buildable_type in _types) then
	{
		_types pushBack _buildable_type;
		missionNamespace setVariable [format["para_buildings_%1",_buildable_type],[]];
	};
} forEach _classes;

//All bases
missionNamespace setVariable ["para_g_bases", [], true];
//All buildings
para_l_buildings = [];

[missionNamespace, "vn_melee_attack", {
	params ["_unit", "_hitPos", "_hitObject"];
	private _building = _hitObject getVariable ["para_g_building", objNull];
	//Commented out waiting on scripted handler being added to handgun weapons
	if (!isNull _building && {currentWeapon _unit == "vn_m_shovel_01"}) exitWith {
		["building_on_hit", [_building]] call para_c_fnc_call_on_server;
		true
	};
	false
}] remoteExec ["BIS_fnc_addScriptedEventHandler", 0, true];

//Load any saved bases.
[] call para_s_fnc_basebuilding_load;