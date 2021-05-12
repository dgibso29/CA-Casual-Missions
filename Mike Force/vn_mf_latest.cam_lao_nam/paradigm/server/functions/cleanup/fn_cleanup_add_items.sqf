/*
	File: fn_cleanup_add_items.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-03
	Public: No

	Description:
		Adds an item to the cleanup system. It'll be cleaned up when nobody is nearby.
	
	Parameter(s):
		_item - Items to be cleaned up. Can be anything 'deleteVehicle' works on [Array|Object]

	Returns: nothing

	Example(s):
		_unit call para_s_fnc_cleanup_add_items;
*/

params ["_item"];

//If we've been passed an array, rather than an item, add them all.
//More efficient than looping somewhere to add items.
if (_item isEqualType []) then {
	para_s_cleanup_items append _item;
} else {
	para_s_cleanup_items pushBack _item;
};
