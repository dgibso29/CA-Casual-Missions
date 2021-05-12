/*
	File: fn_veh_asset_add_package_action.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-03
	Public: No
	
	Description:
		Adds an action that packages a wreck into a slingloadable container.
	
	Parameter(s):
		_id - Id of vehicle asset [Number]

	Returns: nothing

	Example(s): none
*/

params ["_id"];

private _vehicle = [_id] call vn_mf_fnc_veh_asset_get_by_id select struct_veh_asset_info_m_vehicle;

[
	[
		_vehicle,
		[
			"Package Wreck for Transport",
			{
				params ["_target", "_caller", "_id", "_args"];
				["packageforslingloading", _args] call para_c_fnc_call_on_server;
			},
			[_id],
			1.5,
			false,
			true,
			"",
			"true",
			10,
			false
		]
	],
	"addAction",
	0,
	_vehicle
] call para_s_fnc_remoteExec_jip_obj_stacked;