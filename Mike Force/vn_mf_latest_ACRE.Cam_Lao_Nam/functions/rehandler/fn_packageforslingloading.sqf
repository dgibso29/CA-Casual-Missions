/*
    File: fn_packageforslingloading.sqf
    Author: Spoffy
    Date: 2020-04-23
    Last Update: 2020-04-23
    Public: No
    
    Description:
        Remote execution handler for packaging a vehicle asset.
    
    Parameter(s):
		_id - Id of the vehicle asset to package [String]
    
    Returns: nothing
    
    Example(s):
		["myVehicle"] call vn_mf_fnc_package_for_slingloading
*/

params ["_id"];

[_id] call vn_mf_fnc_veh_asset_package_wreck;