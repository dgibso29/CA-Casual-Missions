/*
	File: fn_base_deserialize.sqf
	Author: Spoffy
	Date: 2020-11-08
	Last Update: 2020-11-08
	Public: No
	
	Description:
		Instantiates a base from its serialized representation (loads it)
	
	Parameter(s):
		_serializedBase - Serialized representation of the base [ARRAY]
	
	Returns:
		Base created
	
	Example(s):
		[parameter] call vn_fnc_myFunction
*/
params ["_serializedBase"];

private _version = _serializedBase select 0;
if (_version == "1.0") exitWith
{
	_serializedBase params 
	[
		"_version",
		"_id",
		"_name",
		"_radius",
		"_internalSupplies",
		"_pos"
	];

	[_pos apply {parseNumber _x}, _name, _radius, _internalSupplies, _id] call para_s_fnc_base_create
};