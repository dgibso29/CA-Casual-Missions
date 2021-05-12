/*
    File: fn_changeteam.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-01-29
    Last Update: 2020-05-29
    Public: No
    
    Description:
        Changes team.
		[!:warning] The `_player` variable is passsed from the parent scope!
		[!:warning] This function should not be called directly!
    
    Parameter(s):
		_group - Not used [Group]
    
    Returns: nothing
    
    Example(s): none
*/

params ["_group"];
private _current_group = group _player;
private _current_group_ID = groupID _current_group;
// check that desired group is different from current group
if !(_current_group_ID isEqualTo _group) then
{
	// attempt get group from missionNamespace variable
	private _selected_group = missionNamespace getVariable [_group,grpNull];
	// check that group is found and is proper type
	if (!isNull _selected_group && {_selected_group isEqualType grpNull}) then
	{
		// make sure player is witin 20m of a duty officer
		if !(vn_mf_duty_officers inAreaArray [getPos _player, 20, 20, 0, false, 20] isEqualTo []) then
		{
			[_player, _selected_group] call vn_mf_fnc_force_team_change;
		} else {
			{["TaskFailed",["",localize "STR_vn_mf_needdutyofficer"]] call para_c_fnc_show_notification} remoteExecCall ["call",_player];
		};
	} else {
		["Attempted to join %1 to invalid group %2, with ID %3 - current group %4", _player, _selected_group, _group, _current_group_ID] call BIS_fnc_logFormat;
	};
};
