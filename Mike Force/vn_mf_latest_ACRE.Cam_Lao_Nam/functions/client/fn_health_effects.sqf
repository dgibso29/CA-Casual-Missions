/*
    File: fn_health_effects.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-03-04
    Last Update: 2020-05-28
    Public: No

    Description:
		Sets health stats based effects on player.

    Parameter(s): none

    Returns: nothing

    Example(s):
		call vn_mf_fnc_health_effects;
*/

private _stamina_scheme = "Default";
// disable spriting if player is thirsty
if (player getVariable ["vn_mf_db_thirst", 1] isEqualTo 0) then
{
	_stamina_scheme = "FastDrain";
	player allowSprint false;
}
else
{
	player allowSprint true;
};

// force walk if player is hungry
if (player getVariable ["vn_mf_db_hunger", 1] isEqualTo 0) then
{
	_stamina_scheme = "Exhausted";
	player forceWalk true;
}
else
{
	player forceWalk false;
};

setStaminaScheme _stamina_scheme;
