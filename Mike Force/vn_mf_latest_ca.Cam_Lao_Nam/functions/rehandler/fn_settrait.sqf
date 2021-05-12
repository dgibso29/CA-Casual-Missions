/*
    File: fn_settrait.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-03-05
    Last Update: 2020-06-06
    Public: No
    
    Description:
        Sets traits on player.
		[!:warning] The `_player` variable is passsed from the parent scope!
		[!:warning] This function should not be called directly!
    
    Parameter(s):
		_index - Index [Number]
		_agent - Not used [Object]
    
    Returns: nothing
    
    Example(s): none
*/

params ["_index","_agent"];

private _config = (missionConfigFile >> "gamemode" >> "traits");
private _trait_names = getArray (_config >> "names"); // {"medic","engineer","explosiveSpecialist", "vn_artillery"};
private _traits = getArray (_config >> "traits");

// make sure player is witin 20m of a duty officer
if !(vn_mf_duty_officers inAreaArray [getPos _player, 20, 20, 0, false, 20] isEqualTo []) then
{
	// limit number of units per team with this trait
	private _trait_name = _trait_names select _index;
	private _trait = _traits select _index;

	private _current_traits = missionNamespace getVariable ["vn_mf_traits_arr", [[],[],[],[]]];
	private _selected_traits = (_current_traits select _index);

	// remove disconnected users
	private _to_remove = [];
	{
		if (isNull _x || !isPlayer _x) then
		{
			_to_remove pushBack _forEachIndex;
		}
	} forEach _selected_traits;
	{
		_selected_traits deleteAt _x
	}
	forEach _to_remove;
	private _group_ID = groupId group _player;
	// check if group is over limit for trait
	private _limit = getNumber (_config >> _group_ID >> _trait_name);
	private _allowed = (count (_selected_traits select {groupID group _x isEqualTo _group_ID}) < _limit);

	_set_trait_index = _player getVariable ["vn_mf_dyn_trait_set", -1];

	if (_allowed || _index isEqualTo _set_trait_index) then
	{
		//We need these to set the isCustom flag on setUnitTrait!
		private _vanilla_traits = [ 
			"audibleCoef", 
			"camouflageCoef", 
			"loadCoef", 
			"engineer", 
			"explosiveSpecialist", 
			"medic", 
			"UAVHacker" 
		];

		// only allow one trait per player, if one is set then remove existing
		_already_set = !(_set_trait_index isEqualTo -1);
		if (_already_set) then
		{
			private _existing_traits = (_current_traits select _set_trait_index);

			// remove existing user from other set trait
			private _to_remove = [];
			{
				if (_player isEqualTo _x) then
				{
					_to_remove pushBack _forEachIndex;
				}
			} forEach _existing_traits;

			{
				_existing_traits deleteAt _x
			} forEach _to_remove;
			// set trait to false
			private _trait_to_remove = _traits select _set_trait_index;
			[_player,[_trait_to_remove, false, !(_trait_to_remove in _vanilla_traits)]] remoteExecCall ["setUnitTrait",_player];
			_player setVariable ["vn_mf_dyn_trait_set", -1];
		};

		// set trait only if different from last
		if !(_index isEqualTo _set_trait_index) then
		{
			_selected_traits pushBackUnique _player;

			// mark player as already having set a trait
			_player setVariable ["vn_mf_dyn_trait_set", _index];

			[_player,[_trait, true, !(_trait in _vanilla_traits)]] remoteExecCall ["setUnitTrait",_player];
			{["TrainingSucceeded"] call para_c_fnc_show_notification} remoteExecCall ["call",_player];
		};

		// save changes to array and push to all players
		missionNamespace setVariable ["vn_mf_traits_arr", _current_traits, true];
	}
	else
	{
		{["TrainingFailedOneTraitPerTeam"] call para_c_fnc_show_notification} remoteExecCall ["call",_player];
	};

	[_selected_traits,_allowed] call BIS_fnc_log;
};
