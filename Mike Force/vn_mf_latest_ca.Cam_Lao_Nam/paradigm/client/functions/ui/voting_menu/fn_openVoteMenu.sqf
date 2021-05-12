/*
	File: fn_openVoteMenu.sqf
	Author: Heyoxe
	Date: 2020-07-05
	Last Update: 2020-07-09
	Public: No
	
	Description:
		Opens the multi-vote menu

	Parameter(s): none
	
	Returns: nothing
	
	Example(s): none
*/

private _data = missionNamespace getVariable '#para_c_VoteData';
if (isNil "_data") exitWith {};
createDialog "para_VotingMenu";