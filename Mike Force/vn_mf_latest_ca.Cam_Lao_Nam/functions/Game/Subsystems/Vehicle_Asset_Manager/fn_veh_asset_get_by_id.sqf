/*
    File: fn_veh_asset_get_by_id.sqf
    Author: Spoffy
    Date: 2020-11-23
    Last Update: 2020-11-23
    Public: Yes
    
    Description:
		Retrieves the vehicle asset info with the given id
    
    Parameter(s):
		_id - ID of the vehicle asset [STRING]
    
    Returns:
		Vehicle asset info if it exists, [] otherwise [ARRAY]
    
    Example(s):
		["myId"] call vn_mf_fnc_veh_asset_get_by_id
*/

params ["_id"];

missionNamespace getVariable [_id call vn_mf_fnc_veh_asset_key, []]