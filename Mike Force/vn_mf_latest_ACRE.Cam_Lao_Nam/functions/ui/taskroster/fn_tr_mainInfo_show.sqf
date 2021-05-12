/*
    File: fn_tr_mainInfo_show.sqf
    Author: Dscha, modified by Terra
    Date: 2020-04-23
    Last Update: 2020-05-31
    Public: No
    
    Description:
		Loads up and sets the text in the Main Information Window (Teamlogo, short description).
    
    Parameter(s): none
    
    Returns: nothing
    
    Example(s): none
*/
    
disableSerialization;
#include "..\..\..\config\ui\ui_def_base.inc"

VN_TR_MAININFO_CTRL ctrlShow true;

_groupID = groupID group player;
getArray(MissionConfigFile >> "gamemode" >> "settings" >> "teams" >> _groupID) params[["_group_name_full", "ERROR: GROUP NAME FULL"], ["_group_icon", "Vn\ui_f_vietnam\ui\taskroster\img\missionTarget_prev.paa"], ["_group_name", "ERROR: GROUP NAME"]];
VN_TR_MAININFO_IMG_CTRL ctrlSetText _group_icon;
_group_name_bold = format["<t align='center' font='tt2020base_vn_bold'>%1</t>", _group_name];
VN_TR_MAININFO_TXT_TOP_CTRL ctrlSetStructuredText parsetext format[localize "STR_vn_mf_taskRoster_Main_teamWelcome", _group_name_bold];

//new
//--- Add role descriptions
_text = switch _groupID do {
	case "MikeForce":{"STR_vn_mf_taskRoster_Main_MikeForceDescription"};
	case "SpikeTeam":{"STR_vn_mf_taskRoster_Main_SpikeTeamDescription"};
	case "GreenHornets":{"STR_vn_mf_taskRoster_Main_GreenHornetsTeamDescription"};
	case "ACAV":{"STR_vn_mf_taskRoster_Main_ArmouredCavalryDescription"};
	default {""};
};

VN_TR_MAININFO_TXT_MID_CTRL ctrlSetStructuredText parseText format [localize _text, format ["<img size='5' color='#FFFFFF' image='%1'/>", _group_icon]];
VN_TR_MAININFO_TXT_MID_CTRL ctrlSetPositionH (ctrlTextHeight VN_TR_MAININFO_TXT_MID_CTRL);
VN_TR_MAININFO_TXT_MID_CTRL ctrlCommit 0;

_cfgDir = missionConfigFile >> "gamemode" >> "traits";
_cfgRolesTexts = getArray(_cfgDir >> "texts");
_cfgRolesNames = getArray(_cfgDir >> "names");
_cfgRolesImages = getArray(_cfgDir >> "icons");

//--- Delete old controls
((allControls VN_DISP_TR_TASKROSTER) select {ctrlParentControlsGroup _x == VN_TR_MAININFO_GRP_ROLES_CTRL}) apply {ctrlDelete _x};
//--- Top seperator
private _seperator = VN_DISP_TR_TASKROSTER ctrlCreate ["vn_mf_RscText", -1, VN_TR_MAININFO_GRP_ROLES_CTRL];
_seperator ctrlSetPosition [0, 0, UIW(15), pixelH];
_seperator ctrlCommit 0;
_seperator ctrlSetBackgroundColor [0,0,0,1];
_tgH = pixelH + UIH(0.1); // keep track of the y position in the controls group for the next row

{
	private _role = _x;
	private _addH = 0; // find the highest h value of any text control
	private _nCtrls = []; // store newly created controls
	//--- Row group
	private _ctrlSingleRoleGroup = VN_DISP_TR_TASKROSTER ctrlCreate ["vn_mf_RscControlsGroupNoScrollbarHV", -1, VN_TR_MAININFO_GRP_ROLES_CTRL];
	_nCtrls pushBack _ctrlSingleRoleGroup;
	_ctrlSingleRoleGroup ctrlSetPosition [0, _tgH, UIW(15), UIH(1)];
	_ctrlSingleRoleGroup ctrlCommit 0;
	//--- Role icon, column 1
	private _ctrlRoleName = VN_DISP_TR_TASKROSTER ctrlCreate ["vn_mf_RscPicture",-1,_ctrlSingleRoleGroup];
	_ctrlRoleName ctrlSetPosition [0, 0, UIW(1.5), UIH(1.5)];
	_ctrlRoleName ctrlCommit 0;
	_ctrlRoleName ctrlSetText (_cfgRolesImages select _forEachIndex);
	_ctrlRoleName ctrlSetTooltip localize (_cfgRolesTexts select _forEachIndex);
	_ctrlRoleName ctrlSetTextColor [0,0,0,0.8];
	//--- Tasks, column 2
	private _ctrlRoleTasks = VN_DISP_TR_TASKROSTER ctrlCreate ["vn_mf_RscStructuredText",-1,_ctrlSingleRoleGroup];
	_nCtrls pushBack _ctrlRoleTasks;
	_ctrlRoleTasks ctrlSetPosition [UIW(3), 0, UIW(6.5), UIH(1)];
	_ctrlRoleTasks ctrlCommit 0;
	private _roleTasks = switch _role do {
		case "medic":{localize "STR_vn_mf_taskRoster_Main_medicTasks"};
		case "engineer":{localize "STR_vn_mf_taskRoster_Main_engineerTasks"};
		case "explosiveSpecialist":{localize "STR_vn_mf_taskRoster_Main_explosive_specialistTasks"};
		case "radioOperator": { localize "STR_vn_mf_radioOperatorTasks" };
		default {""};
	};
	_ctrlRoleTasks ctrlSetStructuredText parseText format ["<t size='0.75'>%1</t>",_roleTasks];
	_addH = _addH max ctrlTextHeight _ctrlRoleTasks;
	//--- Player list, column 3
	private _ctrlListPlayers = VN_DISP_TR_TASKROSTER ctrlCreate ["vn_mf_RscStructuredText", -1, _ctrlSingleRoleGroup];
	_nCtrls pushBack _ctrlListPlayers;
	_ctrlListPlayers ctrlSetPosition [UIW(9.5), 0, UIW(5.5), UIH(1)];
	_ctrlListPlayers ctrlCommit 0;
	private _t = [];
	//--- Find the roles of the players
	private _traitsUnits = missionNamespace getVariable ["vn_mf_traits_arr", [[], [], [], []]];
	_traitsUnits params ["_medics", "_engineers", "_explosiveSpecialists", "_radioOperators"];
	units group player apply {
		if (_role == "engineer" && _x in _engineers) then {
			_t pushBack name _x;
		};
		if (_role == "explosiveSpecialist" && _x in _explosiveSpecialists) then {
			_t pushBack name _x;
		};
		if (_role == "medic" && _x in _medics) then {
			_t pushBack name _x;
		};
		if (_role == "radioOperator" && _x in _radioOperators) then {
			_t pushBack name _x;
		};
	};
	if (count _t == 0) then {_t = ["-"]};
	_ctrlListPlayers ctrlSetStructuredText parseText format ["<t size='0.75'>%1</t>", (_t joinString ", ")];
	_addH = _addH max ctrlTextHeight _ctrlListPlayers;
	//--- Request button, column 4
	/* _ctrlRequestButton = VN_DISP_TR_TASKROSTER ctrlCreate ["vn_mf_RscButtonMenu", -1, _ctrlSingleRoleGroup];
	_ctrlRequestButton ctrlSetPosition [UIW(12), 0, UIW(2.5), UIH(0.5)];
	_ctrlRequestButton ctrlCommit 0;
	_ctrlRequestButton ctrlSetStructuredText parseText format ["<t size='0.5' align='center'>%1</t>", localize "STR_vn_mf_taskRoster_Main_requestButton"];
	_ctrlRequestButton ctrlAddEventHandler ["ButtonClick", {
		params ["_ctrlRequestButton"];
		//--- TODO: Backend request role
	}]; */
	_addH = _addH max UIH(1.5);
	_nCtrls apply {
		_x ctrlSetPositionH _addH;
		_x ctrlCommit 0;
	};
	_tgH = _tgH + _addH + UIH(0.1);
	//--- Seperator between roles
	_seperator = VN_DISP_TR_TASKROSTER ctrlCreate ["RscText", -1, VN_TR_MAININFO_GRP_ROLES_CTRL];
	_seperator ctrlSetPosition [0, _tgH, UIW(15), pixelH];
	_seperator ctrlCommit 0;
	_seperator ctrlSetBackgroundColor [0,0,0,1];
	_tgH = _tgH + pixelH + UIH(0.1);
} forEach _cfgRolesNames;