/*
	File: fn_hideVote.sqf
	Author: Heyoxe
	Date: 2020-07-05
	Last Update: 2020-07-05
	Public: No
	
	Description:
		Hides the VoteOverlay with an animation.

	Parameter(s):
		_duration - Duration of the animation [Number]

	Returns: nothing

	Example(s):
		call para_c_fnc_hideVote;
*/

params [
	"_duration"
];

private _holder = uiNamespace getVariable ['#para_c_VoteoOverlay_Holder', controlNull];

_holder ctrlSetPositionH 0;
_holder ctrlCommit _duration;