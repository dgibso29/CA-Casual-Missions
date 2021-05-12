/*
    File: fn_sites_generate.sqf
    Author: Spoffy
    Date: 2020-12-11
    Last Update: 2020-12-11
    Public: No
    
    Description:
		Places new sites down on the map procedurally. 
    
    Parameter(s):
		None
    
    Returns:
		None
    
    Example(s):
		[] call vn_mf_fnc_sites_generate
*/

private _attempts = 3;

//Simple approach for now - surround hostile zones with AA and artillery.
private _zonesToGenerateIn = mf_s_zones select {!(_x select struct_zone_m_captured)};

private _fnc_findPos = {
	params ["_startPos", "_minDist", "_maxDist"];
	private _result = _startPos;
	for "_i" from 1 to _attempts do
	{
		_result = _startPos getPos [_minDist + random (_maxDist - _minDist), random 360];
		if (!surfaceIsWater _result) exitWith {};
	};
	_result
};

{
	private _zoneData = _x;
	private _center = markerPos (_zoneData select struct_zone_m_marker);

	//Create initial AA emplacements
	for "_i" from 1 to (1 + ceil random (mf_s_max_aa_per_zone - 1)) do
	{
		[[_center, 300, 600] call _fnc_findPos] call vn_mf_fnc_sites_create_aa_site;
	};

	//Create initial artillery emplacements
	for "_i" from 1 to (1 + ceil random (mf_s_max_artillery_per_zone - 1)) do
	{
		[[_center, 400, 800] call _fnc_findPos] call vn_mf_fnc_sites_create_artillery_site;
	};

	//Create zone HQ
	private _hqPosition = _center;
	for "_i" from 0 to 10 do {
		private _testPosition = _hqPosition getPos [100, random 360];
		_testPosition = (selectBestPlaces [_testPosition, 200, "-(houses + 10 * waterDepth)", 10, 1]) select 0 select 0;
		if !(_testPosition isFlatEmpty [0, -1, 0.5, 50, 0] isEqualTo []) exitWith {
			_hqPosition = _testPosition + [0];
		};
	};
	[_hqPosition] call vn_mf_fnc_sites_create_hq;
} forEach _zonesToGenerateIn;