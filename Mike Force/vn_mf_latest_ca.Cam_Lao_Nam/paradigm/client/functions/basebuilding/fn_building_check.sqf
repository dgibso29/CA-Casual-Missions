/*
    File: fn_building_check.sqf
    Author: Aaron Clark
    Date: 2020-07-19
    Last Update: 2020-07-19
    Public: No

    Description:
	No description added yet.

    Parameter(s):
	_object - Description [DATATYPE, defaults to DEFAULTVALUE]
	_needed_nearby - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
	Function reached the end [BOOL]

    Example(s):
	[parameter] call para_c_fnc_building_check
*/

params ["_object","_needed_nearby",["_start_pos",[0,0,0]],["_stop_pos",[0,0,-1]]];
private _placing_allowed = true;

private _transparent = "#(rgb,8,8,3)color(1,1,1,0)";	// transparent texture
private _whitetexture = "#(rgb,8,8,3)color(1,1,1,0.7)";	// white texture
private _bluetexture = "#(rgb,8,8,3)color(0,0,1,0.7)"; 	// blue texture
private _greentexture = "#(rgb,8,8,3)color(0,1,0,0.7)"; // green texture
private _redtexture = "#(rgb,8,8,3)color(1,0,0,0.7)"; 	// red texture

private _texture = _greentexture; // green texture
private _text = "";

// do restricted zone checks to make sure player did not move it into restricted zone
if (["blocked_area1", "blocked_area2", "blocked_area3"] findIf {_object inArea _x} isEqualTo -1) then
{
	_disallowed = false;
	_errtext = "Object collision";
	if (para_l_buildables_require_vehicles && !(_needed_nearby isEqualTo [])) then
	{
		private _nearby_vehicles = (getpos _object) nearObjects ["LandVehicle", 20];
		if ("fuel" in _needed_nearby && {(_nearby_vehicles select {getFuelCargo _x > 0} isEqualTo [])}) then
		{
			_disallowed = true;
			_errtext = "fuel truck needed nearby";
		};
		if ("ammo" in _needed_nearby && {(_nearby_vehicles select {getAmmoCargo _x > 0} isEqualTo [])}) then
		{
			_disallowed = true;
			_errtext = "ammo truck needed nearby";
		};
		if ("repair" in _needed_nearby && {(_nearby_vehicles select {getRepairCargo _x > 0} isEqualTo [])}) then
		{
			_disallowed = true;
			_errtext = "repair truck needed nearby";
		};
	};

	// is under water
	if ((getPosASL _object) select 2 < 0.1 ) then
	{
		_disallowed = true;
		_errtext = "under water";
	};

	private _bb = boundingBoxReal _object;
	private _center = [(_bb # 0 # 0 + _bb # 1 # 0) / 2, (_bb # 0 # 1 + _bb # 1 # 1) / 2];
	private _model_center_bottom = _center + [_bb # 0 # 2];
	private _start_pos = _object modelToWorld (_model_center_bottom);
	private _stop_pos = _start_pos vectoradd [0,0,-0.1];

	// this maybe clostly
	_ins = lineIntersectsSurfaces [
		AGLToASL _start_pos,
		AGLToASL _stop_pos,
		_object
	];
	if (getPosATL _object select 2 > 0 && count _ins == 0) then {_disallowed = true};

	if (_disallowed) then
	{
		_texture = _redtexture; // red texture

		// use color from attached object
		private _attached_to = attachedTo _object;
		if (!isNull _attached_to && !(_attached_to isEqualto player)) then {
			_texture = (getObjectTextures _attached_to) select 0;
		};

		_text = "building disallowed: " + _errtext;
		_placing_allowed = false;
	}
	else
	{
		_texture = _greentexture; // green texture
		_text = "";
		_placing_allowed = true;
	};

}
else
{
	_texture = _redtexture;  // red texture
	_text = localize "STR_vn_mf_restrictedzone";
	_placing_allowed = false;
};

// only set texture when changed
private _textures = getObjectTextures _object;
if !(_texture in _textures) then
{
	_object setObjectTextureGlobal [0, _texture];
};

[_placing_allowed, _text]
