/*
    File: fn_sites_create_hq.sqf
    Author: Spoffy
    Date: 2020-12-19
    Last Update: 2020-12-19
    Public: No
    
    Description:
		Creates a new HQ site in the given location.
    
    Parameter(s):
		_pos - Position to spawn the HQ site at
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [markerPos "myHq"] call vn_mf_fnc_sites_create_hq
*/

params ["_pos"];

[
	"hq",
	_pos,
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		//Hide all nearby terrain objects.
		{
			_x hideObjectGlobal true;
		} forEach (nearestTerrainObjects [_spawnPos, ["TREE", "BUSH", "SMALL TREE", "ROCK", "ROCKS"], 50, false, true]);

		private _hqObjects = [_spawnPos] call vn_mf_fnc_create_hq_buildings;
		private _objectsToDestroy = _hqObjects select {_x isKindOf "land_vn_pavn_ammo"};

		{
			[_x, true] call para_s_fnc_enable_dynamic_sim;
		} forEach _hqObjects;

		//Create a HQ marker.
		private _markerPos = _spawnPos getPos [10 + random 20, random 360];
		private _hqMarker = createMarker [format ["HQ_%1", _siteId], _markerPos];
		_hqMarker setMarkerType "o_hq";
		_hqMarker setMarkerText "HQ";
		_hqMarker setMarkerAlpha 0.5;

		private _guns = _hqObjects select {_x isKindOf "StaticWeapon"};
		private _objectives = [];
		{
			_objectives pushBack ([_x] call para_s_fnc_ai_obj_request_crew);
		} forEach _guns;
		_objectives pushBack ([_spawnPos, 3, 2] call para_s_fnc_ai_obj_request_defend);

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["markers", [_hqMarker]];
		_siteStore setVariable ["staticGuns", _guns];
		_siteStore setVariable ["vehicles", _hqObjects]; 
		_siteStore setVariable ["objectsToDestroy", _objectsToDestroy];
	},
	//Teardown condition check code
	{
		//Check if we need to teardown every 15 seconds.
		15 call _fnc_periodicallyAttemptTeardown;
	},
	//Teardown condition
	{
		params ["_siteStore"];
		//Teardown when all guns destroyed
		(_siteStore getVariable "objectsToDestroy" findIf {alive _x} == -1)
	},
	//Teardown code
	{
		params ["_siteStore"];

		//Delete the AA warning marker
		{
			deleteMarker _x;
		} forEach (_siteStore getVariable "markers");

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;