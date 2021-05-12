/*
	File: fn_sites_create_site.sqf
	Author: Spoffy
	Date: 2020-12-11
	Last Update: 2020-12-11
	Public: No
	
	Description:
		No description added yet.
	
	Parameter(s):
		_type - Name of the type of site [STRING]
		_pos - Position to create the site at [ARRAY]
		_setup - Code to set the site up, spawn in assets, etc [CODE]
		_setupTeardownConditionTriggers - Code to set up when _teardownCondition should be checked [CODE]
		_teardownCondition - Returns true when the site should be torn down (removed) [CODE]
		_teardown - Code that removes the site from the map when called [CODE]
	
	Returns:
		The site store containing site info [NAMESPACE]
	
	Example(s):
		[parameter] call vn_fnc_myFunction
*/
params ["_type", "_pos", "_setup", "_setupTeardownConditionTriggers", "_teardownCondition",  "_teardown"];

//Give the site a unique ID
private _siteId = localNamespace getVariable ["site_current_id", 0];
_siteId = _siteId + 1;
localNamespace setVariable ["site_current_id", _siteId];

private _siteKey = format ["site_%1", _siteId];

//Create a store for the site data, and save it under the site's id.
//Use a simple object, because sites inherently have a position.
//Therefore simple objects give us much, much more power to run queries (like `inAreaArray`)
private _siteStore = createSimpleObject ["a3\weapons_f\empty.p3d", AGLtoASL _pos, true];
//Make sure we're in exactly the right position.
_siteStore setPos _pos;
localNamespace setVariable [_siteKey, _siteStore];

_siteStore setVariable ["site_id", _siteId];
_siteStore setVariable ["site_type", _type];
_siteStore setVariable ["site_teardown_condition", _teardownCondition];
_siteStore setVariable ["site_teardown", _teardown];

//Setup the site
[_siteStore] call _setup;

private _fnc_attemptTeardown = compile format ["[%1] call vn_mf_fnc_sites_attempt_teardown", _siteId];
private _fnc_periodicallyAttemptTeardown = {[_siteKey, vn_mf_fnc_sites_attempt_teardown, _siteId, _this] call para_g_fnc_scheduler_add_job;};

//Setup the triggers which will cause _teardownCondition to be evaluated
[_siteStore] call _setupTeardownConditionTriggers;

//Register in a list of sites of this type.
private _siteTypeKey = format ["sites_%1", _type];
private _sites = localNamespace getVariable [_siteTypeKey, []];
_sites pushBack _siteStore;
localNamespace setVariable [_siteTypeKey, _sites];

//Register in a global list of sites
localNamespace getVariable "sites" pushBack _siteStore;

_siteStore