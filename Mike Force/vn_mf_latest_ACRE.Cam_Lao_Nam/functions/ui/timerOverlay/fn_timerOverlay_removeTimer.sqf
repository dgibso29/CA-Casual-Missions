/*
	File: fn_timerOverlay_removeTimer.sqf
	Author: Heyoxe
	Date: 2020-07-04
	Last Update: 2020-07-04
	Public: Yes
	
	Description:
		Terminates and removes the timer
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s):
		call VN_MF_fnc_timerOVerlay_removeTimer;
*/

private _handle = missionNamespace getVariable ["#VN_MF_TimerManager", scriptNull];
terminate _handle;
call VN_MF_fnc_timerOverlay_hideTimer;