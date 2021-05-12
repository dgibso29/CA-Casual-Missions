/*
    File: critical_stats.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-03-11
    Last Update: 2020-06-07
    Public: No
    
    Description:
        Updates the critical stats HUD (Thirst/Hunger/...)
    
    Parameter(s): none
    
    Returns: nothing
    
    Example(s): none
*/

private _stats = getArray(missionConfigFile >> "gamemode" >> "health" >> "gui_progress_bars");
{
	_x params ["_name", "_color"];

	private _ctrl = uiNamespace getVariable [format["vn_mf_db_%1_ctrl",_name],controlNull];
	if !(isNull _ctrl) then
	{
		_var = player getVariable [format["vn_mf_db_%1",_name], 1];

		private _pbgControl = uiNamespace getVariable [format ["#VN_MF_HngerThirstHUD_ProgressBackground_%1", _forEachIndex], controlNull];
		if (_var <= 0.25) then
		{
			_pbgControl ctrlSetBackgroundColor [1, 0, 0, 0.25];
			_pbgControl ctrlCommit 0;

			[_ctrl,_color] spawn {
				params ["_ctrl","_color"];
				_ctrl ctrlSetTextColor [1,0,0,0.5];
				uiSleep 0.5;
				_ctrl ctrlSetTextColor _color;
				uiSleep 0.5;
				_ctrl ctrlSetTextColor [1,0,0,0.5];
				uiSleep 0.5;
				_ctrl ctrlSetTextColor _color;
			};
		} else {
			_pbgControl ctrlSetBackgroundColor [1, 1, 1, 0.5];
			_pbgControl ctrlCommit 0;
		};
	};
} forEach _stats;
