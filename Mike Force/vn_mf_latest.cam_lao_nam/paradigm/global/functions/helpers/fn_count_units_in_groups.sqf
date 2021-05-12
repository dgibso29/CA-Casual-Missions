/*
    File: fn_count_units_in_groups.sqf
    Author: Spoffy
    Date: 2020-01-29
    Last Update: 2020-01-29
    Public: No
    
    Description:
        Counts the total number of units found in an array of groups.
    
    Parameter(s):
        _this - [_group(n)] of groups [Array].
			_group - Group [Group]
    
    Returns:
    	Number of units in all of the groups added together [Number]
    
    Example(s):
        [grpNull, group1] call para_g_fnc_count_units_in_groups
*/

private _total = 0;

{
	_total = _total + count units _x;
} forEach _this;

_total