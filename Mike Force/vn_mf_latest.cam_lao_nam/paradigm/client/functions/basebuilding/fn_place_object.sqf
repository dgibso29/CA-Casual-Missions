/*
	File: fn_place_object.sqf
	Author: Aaron Clark <vbawol>
	Date: 2020-05-23
	Last Update: 2020-07-22
	Public: No

	Description:
		Spawns object and loads related data

	Parameter(s):
		_class - Classname of the object [String, defaults to "Land_vn_b_tower_01"]

	Returns: nothing

	Example(s):
		["Land_vn_b_tower_01"] spawn para_c_fnc_place_object;
*/
//code
params [
	["_class","Land_vn_b_tower_01"]
];

//Abort building if we're already building.
call para_c_fnc_abort_building;

para_l_placing_script = _thisScript;

private _object_config = (missionConfigFile >> "gamemode" >> "buildables" >> _class);

if (!isClass _object_config) exitWith {["Building not in buildables config %1", _class] call BIS_fnc_logFormat;};

private _transparent = "#(rgb,8,8,3)color(1,1,1,0)";	// transparent texture
private _whitetexture = "#(rgb,8,8,3)color(1,1,1,0.7)";	// white texture
private _bluetexture = "#(rgb,8,8,3)color(0,0,1,0.7)"; 	// blue texture
private _greentexture = "#(rgb,8,8,3)color(0,1,0,0.7)"; // green texture
private _redtexture = "#(rgb,8,8,3)color(1,0,0,0.7)"; 	// red texture

//Load information on the object
private _initial_class = getText (_object_config >> "build_states" >> "initial_state" >> "object_class");
private _initial_rotation = getNumber (_object_config >> "rotation");

private _needed_nearby = getArray (_object_config >> "nearby");
private _initial_offset = getArray (_object_config >> "offset");

private _check_pos_start = getArray (_object_config >> "check_pos_start");
if (_check_pos_start isEqualTo []) then {
	_check_pos_start = [0,0,0];
};

private _check_pos_stop = getArray (_object_config >> "check_pos_stop");
if (_check_pos_stop isEqualTo []) then {
	_check_pos_stop = [0,0,-1];
};

if (_initial_offset isEqualTo []) then
{
	_initial_offset = [10,0,0];
};
private _max_segments = getNumber (_object_config >> "max_segments");

private _min_distance = getNumber (_object_config >> "min_distance");
if (_min_distance isEqualTo 0) then
{
	_min_distance = 5;
};
private _max_distance = getNumber (_object_config >> "max_distance");
if (_max_distance isEqualTo 0) then
{
	_max_distance = 10;
};

private _pos = player getRelPos [_min_distance, 0];
private _last_distance = 0;

para_l_placing_object = createVehicle [_initial_class, _pos, [], 0, "CAN_COLLIDE"];
para_l_placing_object setVectorUp [0,0,1];

_objects = [];
_objects pushBack para_l_placing_object;

// bridge or wall
if (_max_segments > 0) then
{
	_new_offset = _initial_offset;
	for "_i" from 1 to _max_segments do
	{
		_tmp = _initial_class createVehicle [0,0,0];
		_objects pushBack _tmp;
		_tmp attachTo [para_l_placing_object, _new_offset];
		_new_offset = _new_offset vectorAdd _initial_offset;
	};
};

["setlocaleh", [_objects]] call para_c_fnc_call_on_server;

para_l_placing = true;
para_l_placing_in_progress = false;
para_l_placing_allowed = true;
para_l_placing_aborted = false;

para_l_building_action_id = [
	player,											// Object the action is attached to
	localize "STR_vn_mf_build",										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",				// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",				// Progress icon shown on screen
	"para_l_placing && para_l_placing_allowed",						// Condition for the action to be shown
	"para_l_placing && para_l_placing_allowed",						// Condition for the action to progress
	{
		para_l_placing_in_progress = true;
		playSound selectRandom ["vn_build_1","vn_build_2","vn_build_3"];
		[format["<t font='tt2020base_vn' color='#ff0000' size = '.8'>%1</t>", localize "STR_para_building_placing_in_progress"],0,0,1,0,0,789] spawn BIS_fnc_dynamicText;
	},											// Code executed when action starts
	{},											// Code executed on every progress tick
	{
		params ["_target", "_caller", "_action_id", "_arguments"];
		para_l_placing = false;
		_arguments params ['_class','_needed_nearby','_check_pos_start','_check_pos_stop'];
		_remove_next = false;
		// check all attached objects are visible
		{
			if (_remove_next) then
			{
				detach _x;
				deleteVehicle _x;
			};
			[_x,_needed_nearby,_check_pos_start,_check_pos_stop] call para_c_fnc_building_check params ["_xisallowed","_xtext"];
			if (_xisallowed) then
			{
				_remove_next = true;
			};
		} forEach attachedObjects para_l_placing_object;

		private _objects = [para_l_placing_object] + attachedObjects para_l_placing_object;
		private _objectInfo = _objects apply {[_x, getPosWorld _x, getDir _x]};

		["placedbuilding", [_objectInfo, _class]] call para_c_fnc_call_on_server;
		para_l_placing_object = objNull;
		para_l_buildmode = nil;
	},											// Code executed on completion
	{
		para_l_placing_in_progress = false;
		_sound = ASLToAGL [0,0,0] nearestObject "#soundonvehicle";
		if !(isNull _sound) then
		{
			deleteVehicle _sound;
		};
		para_l_placing_aborted = true;

	},												// Code executed on interrupted
	[_class,_needed_nearby,_check_pos_start,_check_pos_stop],											// Arguments passed to the scripts as _this select 3
	2,												// Action duration [s]
	100,												// Priority
	true,												// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;

para_l_placing_click_handler = (findDisplay 46) displayAddEventHandler ["MouseButtonUp", {
	params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	if (!scriptDone para_l_placing_script && _button <= 2) then {
		//LMB, RMB, Middle
		private _diff = [1, -1, 0] select _button;
		//Wrap around at 3.
		para_l_placing_mode = (para_l_placing_mode + _diff) % 3;
		if (para_l_placing_mode < 0) then {para_l_placing_mode = 2};
		private _content = [
			localize "STR_para_building_position",
			localize "STR_para_building_rotation",
			localize "STR_para_building_height"
		] select para_l_placing_mode;
		[_content, -1, -1, 2, 1, 0] spawn BIS_fnc_dynamicText;
	};
}];

para_l_placing_mode = 0;
para_l_placing_center_pos = [0,0,0];
para_l_placing_last_player_dir = getDir player;
para_l_placing_final_rotation = _initial_rotation;
para_l_placing_height = -1;

//Compensate for attachTo using model center.
private _heightOffset = (getPosWorld para_l_placing_object # 2) - (getPosASL para_l_placing_object # 2);

hint parseText format ["<t size='2'>%1</t><br/>%2", localize "STR_para_building_hint_header", localize "STR_para_building_hint_body"];

while {para_l_placing} do
{
	uiSleep 0.02;

	if (currentWeapon player != "") then {
		// holster weapon
		para_l_holstered = currentMuzzle player;
		player action["switchWeapon", player, player, 100];
	};

	if !(para_l_placing_in_progress) then
	{
		private _startPos = AGLtoASL positionCameraToWorld [0,0,1];
		private _endPos = _startPos vectorAdd (getCameraViewDirection player vectorMultiply 40);
		private _intersections = lineIntersectsSurfaces [
			_startPos,
			_endPos,
			player,
			para_l_placing_object,
			true
		];

		//This is the position the player is currently looking at.
		private _lookPos = _intersections + [[_endPos]] select 0 select 0;
		private _playerDir = getDir player;

		switch (para_l_placing_mode) do {
			//Mode 0 - Set object position
			case 0: {
				if (freeLook || _lookPos isEqualTo []) exitWith {};
				para_l_placing_center_pos = _lookPos;
				if (para_l_placing_height >= 0) then {para_l_placing_center_pos set [2, para_l_placing_height]};
			};
			//Mode 1 - Set object rotation
			case 1: {
				if (freeLook) exitWith {};
				private _dirDelta = (_playerDir - para_l_placing_last_player_dir) * 3.5;
				para_l_placing_final_rotation = para_l_placing_final_rotation + _dirDelta;
			};
			//Mode 2 - Set object height
			case 2: {
				if (freeLook) exitWith {};
				para_l_placing_height = (_startPos vectorAdd (getCameraViewDirection player vectorMultiply (_startPos distance2D para_l_placing_center_pos))) select 2;
				para_l_placing_center_pos set [2, para_l_placing_height];
			};
		};

		//Calculate attach position
		private _offset = player worldToModelVisual ASLtoAGL para_l_placing_center_pos vectorAdd [0,0,_heightOffset];
		//We use "attachTo" so that it syncs quickly.
		para_l_placing_object attachTo [player, _offset];

		//Calculate correct rotation
		private _dir = para_l_placing_final_rotation - getDir player;
		para_l_placing_object setDir _dir;
		para_l_placing_last_player_dir = _playerDir;

		// visually calculate distance by segments
		[para_l_placing_object,_needed_nearby,_check_pos_start,_check_pos_stop] call para_c_fnc_building_check params ["_isallowed","_text"];
		para_l_placing_allowed = _isallowed;
		private _hide_remainder = false;
		{
			private _xisallowed = false;
			if (!_hide_remainder) then
			{
				[_x,_needed_nearby,_check_pos_start,_check_pos_stop] call para_c_fnc_building_check params ["_xisallowed","_xtext"];
				_hide_remainder = _xisallowed;
			} else {
				_x setObjectTextureGlobal [0, _transparent];
			};
		} forEach attachedObjects para_l_placing_object;
	}
	else
	{
		detach para_l_placing_object;
		{
			private _textures = getObjectTextures _x;
			if !(_transparent in _textures) then
			{
				_x setObjectTextureGlobal [0, _bluetexture];
			};
		} forEach attachedObjects para_l_placing_object;
		para_l_placing_object setObjectTextureGlobal [0, _bluetexture];
	};
};

if (!isNil "para_l_holstered") then {
	// unholster weapon
	player selectWeapon para_l_holstered;
	para_l_holstered = nil;
};

if !(isNull para_l_placing_object) then
{
	{
		detach _x;
		deleteVehicle _x;
	} forEach attachedObjects para_l_placing_object;
	deleteVehicle para_l_placing_object;

	[player,para_l_building_action_id] call BIS_fnc_holdActionRemove;
};
