/*
	File: fn_timerOverlay_showTimer.sqf
	Author: Heyoxe
	Date: 2020-07-04
	Last Update: 2020-07-04
	Public: No
	
	Description: none
	
	Parameter(s):
		Shows the timer with an animation.
	
	Returns: nothing
	
	Example(s): none
*/

#include "..\..\..\config\ui\ui_def_base.inc"


private _holder = uiNamespace getVariable ['#VN_MF_TimerOverlay_Holder', controlNull];

_holder ctrlSetPositionX (safeZoneX + safezoneW - UIW(9.5));
_holder ctrlCommit 0.3;