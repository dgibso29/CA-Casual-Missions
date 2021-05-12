/*
	File: fn_zones_create_aa_site.sqf
	Author: Spoffy
	Date: 2020-12-02
	Last Update: 2020-12-02
	Public: No
	
	Description:
		Creates an AA site in the given zone.
	
	Parameter(s):
		_zone - Zone marker name [STRING]
	
	Returns:
		Task data store [NAMESPACE]
	
	Example(s):
		["zone_saigon"] call vn_mf_fnc_zones_create_aa_site
*/

params ["_pos"];

[
	"aa",
	_pos,
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		private _result = [_spawnPos, "HEAVY"] call vn_mf_fnc_create_aa_emplacement;
		private _createdThings = _result select 0;

		//Create an AA warning marker.
		private _markerPos = _spawnPos getPos [10 + random 20, random 360];
		private _aaZoneMarker = createMarker [format ["AA_zone_%1", _siteId], _markerPos];
		_aaZoneMarker setMarkerSize [1000, 1000];
		_aaZoneMarker setMarkerShape "ELLIPSE";
		_aaZoneMarker setMarkerBrush "DiagGrid";
		_aaZoneMarker setMarkerColor "ColorRed";
		_aaZoneMarker setMarkerAlpha 0.3;

		private _aaMarker = createMarker [format ["AA_%1", _siteId], _markerPos];
		_aaMarker setMarkerType "o_antiair";
		_aaMarker setMarkerText "AA";
		_aaMarker setMarkerAlpha 0.5;

		private _vehicles = _createdThings select 0;
		private _groups = _createdThings select 1;
		{
			[_x, true] call para_s_fnc_enable_dynamic_sim;
		} forEach (_vehicles + _groups);

		private _guns = _result select 1;
		private _objectives = [];
		{
			_objectives pushBack ([_x] call para_s_fnc_ai_obj_request_crew);
		} forEach _guns;
		_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["markers", [_aaZoneMarker, _aaMarker]];
		_siteStore setVariable ["aaGuns", _guns];
		_siteStore setVariable ["vehicles", _vehicles]; 
		_siteStore setVariable ["units", (_createdThings select 1)]; 
		_siteStore setVariable ["groups", _groups];
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
		(_siteStore getVariable "aaGuns" findIf {alive _x} == -1)
	},
	//Teardown code
	{
		params ["_siteStore"];

		//Delete the AA warning marker
		{
			deleteMarker _x;
		} forEach (_siteStore getVariable "markers");

		{
			deleteVehicle _x;
		} forEach ((_siteStore getVariable "vehicles") + (_siteStore getVariable "units"));

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;