/*
	File: fn_vote_2.sqf
	Author: Heyoxe
	Date: 2020-07-05
	Last Update: 2020-07-09
	Public: No
	
	Description:
		Votes for the second option.
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s): none
*/

private _data = missionNamespace getVariable '#para_c_VoteData';
if (isNil "_data") exitWith {};
if (count (_data get "options") > 2) exitWith {};
1 call para_c_fnc_submitVote;
