/*
	File: fn_sites_teardown_site.sqf
	Author: Spoffy
	Date: 2020-12-11
	Last Update: 2020-12-11
	Public: No
	
	Description:
		No description added yet.
	
	Parameter(s):
		_localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
	
	Returns:
		Function reached the end [BOOL]
	
	Example(s):
		[parameter] call vn_fnc_myFunction
*/

params ["_siteStore"];

private _id = _siteStore getVariable "site_id";
private _type = _siteStore getVariable "site_type";

//Call site-specific teardown code
[_siteStore] call (_siteStore getVariable ["site_teardown", {}]);

//Remove the reference to the site
private _siteKey = format ["site_%1", _id];
localNamespace setVariable [_siteKey, nil];

//Remove the site from the type list.
private _siteTypeKey = format ["sites_%1", _type];
private _sites = localNamespace getVariable [_siteTypeKey, []];
_sites deleteAt (_sites find _siteStore);

//Register in a global list of sites
private _allSites = localNamespace getVariable "sites";
_allSites deleteAt (_allSites find _siteStore);

//Delete the site
deleteVehicle _siteStore;