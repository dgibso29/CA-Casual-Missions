/*
	File: fn_group_init.sqf
	Author: Aaron Clark <vbawol>
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No
	
	Description:
		Creates and initialize groups and duty officers
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s):
		call vn_mf_fnc_group_init;
*/

vn_mf_duty_officers = [];

// Create all groups agents and join into all groups
private _groups = getArray(_gamemode_config >> "settings" >> "groups" );
{
	_x params ["_group_name", ["_class","vn_b_men_army_01"]];
	private _marker = "duty_officer_" + toLower(_group_name);
	private _location = getMarkerPos _marker;
	if !(_location isEqualTo [0,0,0]) then
	{
		// create duty officer
		private _grp = createGroup [west, false];
		_grp setGroupIdGlobal [_group_name];

		// duty officer agent
		private _agent = createAgent [_class, _location, [], 0, "NONE"];
		_agent allowDamage false;

		_id = _agent spawn {
			removeAllWeapons _this;
			_this switchmove "";
			uiSleep 1;
			_this enableSimulationGlobal false;
			_this disableAI "ALL";
		};
		
		//Set up custom interaction overlay
		_agent setVariable ["#para_InteractionOverlay_ConfigClass", "DutyOfficer", true];

		// set group name as global var and reference to group server side
		missionNamespace setVariable [_group_name,_grp,true];

		// save duty officers to array for later use
		vn_mf_duty_officers pushBack _agent;
	};
} forEach _groups;

// broadcast duty officers
publicVariable "vn_mf_duty_officers";


