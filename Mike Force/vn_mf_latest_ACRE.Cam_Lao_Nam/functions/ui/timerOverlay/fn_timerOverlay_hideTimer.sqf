/*
	File: fn_timerOverlay_hideTimer.sqf
	Author: Heyoxe
	Date: 2020-07-04
	Last Update: 2020-07-04
	Public: No
	
	Description:
		Hides the timer with an animation.
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s): none
*/

private _holder = uiNamespace getVariable ['#VN_MF_TimerOverlay_Holder', controlNull];

_holder ctrlSetPositionX (safeZoneX + safezoneW);
_holder ctrlCommit 0.3;