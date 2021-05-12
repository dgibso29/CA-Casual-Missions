/*
    File: fn_ui_hints_show_hint.sqf
    Author: Spoffy
    Date: 2021-03-24
    Last Update: 2021-03-24
    Public: No
    
    Description:
        Shows a particularly hint.
    
    Parameter(s):
		None
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [parameter] call vn_fnc_myFunction
*/

params ["_title", "_body", ["_image", ""]];

private _activeHints = uiNamespace getVariable ["para_c_activeHints", []];
private _hintQueue = localNamespace getVariable ["para_c_hintQueue", []];

if (count _activeHints >= 3) exitWith {
	_hintQueue pushBack _this;
	localNamespace setVariable ["para_c_hintQueue", _hintQueue];
};

private _cardConfig = localNamespace getVariable "para_c_survivalCardConfig";
private _cardPositionFuncs = _cardConfig get "positions";

private _cardsToCreate = [];

{
    private _control = _x get "control";
    _cardsToCreate pushBack [
        // Content
        _x get "structuredText",
        // Position to create at
        ctrlPosition _control select [0, 2],
        // Position to end up at
        _cardPositionFuncs select _forEachIndex apply {call _x}
    ];
    ctrlDelete _control;
} forEach _activeHints;

if (!isNil "_image") then {
    _image = format ["<img image='%1'/>", _image];
};

private _newCardText = format [
    "<t size='1.3' align='center' font='RobotoCondensedBold'>%1<br/><t size='4' color='FFFFFF'>%2</t></t><br/>%3",
    _title,
    _image,
    _body
];

private _structuredText = parseText _newCardText;

private _newCardEndPosition = _cardPositionFuncs select (count _cardsToCreate) apply {call _x};
private _newCardStartPosition = [safeZoneW - safeZoneX, _newCardEndPosition # 1];

_cardsToCreate pushBack [_structuredText, _newCardStartPosition, _newCardEndPosition];

// Create cards in reverse order to ensure they're layered correctly
reverse _cardsToCreate;

systemChat str _cardsToCreate;

private _cardDisplay = (uiNamespace getVariable "para_RscSurvivalHints");
private _cardControls = _cardsToCreate apply {
    _x params ["_text", "_startPosition", "_endPosition"];
    private _newCard = _cardDisplay ctrlCreate ["para_RscSurvivalCard", -1];
    private _content = _newCard controlsGroupCtrl 500;
    _content ctrlSetStructuredText _text;
    _content ctrlCommit 0;
    systemChat format ["Creating card: %1, %2", _startPosition, _text];
    _newCard ctrlSetPosition _startPosition;
    _newCard ctrlCommit 0;
    systemChat format ["Created %1 moving to %2", _newCard, _endPosition];
    _newCard ctrlSetPosition _endPosition;
    _newCard ctrlCommit 0.3;
    _newCard
};

private _cardInfo = createHashMapFromArray [
    ["control", controlNull],
    ["structuredText", _structuredText]
];
_activeHints pushBack _cardInfo;

// Return to normal order of cards (top to bottom)
reverse _cardControls;

// Update control references with the new controls
{
    _x set ["control", _cardControls select _forEachIndex];
} forEach _activeHints;

uiNamespace setVariable ["para_c_activeHints", _activeHints];

playSound "vn_mf_card_1";

_activeHints

