/*
	File: fn_welcomeScreenLoad.sqf
	Author: Heyoxe
	Date: 2021-04-0
	Last Update: 2021-04-30
	Public: Yes
	
	Description:
		Loads the correct welcome screen information.

	Parameter(s):
		_display - A Display [Display]
        _mode - Mode to be fetched in `missionConfigFile >> "ParaWelcomeScreen" >> ${_mode}` [String]
	
	Returns: nothing
	
	Example(s): none
*/

params [
    ["_display", displayNull, [displayNull]],
    ["_mode", "", [""]]
];

private _config = missionConfigFile >> "ParaWelcomeScreen";
private _modeConfig = _config >> _mode;

private _title = getText (_modeConfig >> "title");
private _version = getText (_config >> "version");
private _content = parseText (getArray (_modeConfig >> "content") joinString "");

private _controls = [10, 20, 30] apply { _display displayCtrl _x };
_controls params ["_ctrlTitle", "_ctrlVersion", "_ctrlContent"];

_ctrlTitle ctrlSetText _title;
_ctrlVersion ctrlSetText _version;

private _baseHeight = (ctrlPosition _ctrlContent)#3;
_ctrlContent ctrlSetStructuredText _content;
_ctrlContent ctrlSetPositionH ((ctrlTextHeight _ctrlContent) max _baseHeight);
_ctrlContent ctrlCommit 0;
