/*
    File: fn_tr_overview_team_update.sqf
    Author: Dscha
    Date: 2020-04-23
    Last Update: 2020-04-23
    Public: No
    
    Description:
		Spawned by the Server.
		Updates the ctrl in the TaskRoster with the correct emblem/sign.
    
    Parameter(s): none
    
    Returns: nothing
    
    Example(s):
		[] remoteExec ["vn_mf_fnc_tr_overview_team_update", _playerObj];
*/

if!(remoteExecutedOwner isEqualTo 2) exitWith {systemchat str ["Team Update: Not send by Server! - OwnerID:", remoteExecutedOwner]};

disableSerialization;
#include "..\..\..\config\ui\ui_def_base.inc"

_stopTime = diag_tickTime + 2;
waitUntil	{
				!isNull VN_DISP_TR_TASKROSTER OR
				(diag_tickTime > _stopTime)
			};
if(diag_tickTime > _stopTime)exitWith{ systemchat str ["Team Update: TIMEOUT "]; };

VN_TR_USERNAME_CTRL ctrlSetText profileName;

_groupID = groupID (group player);
if !(_groupID in ["ACAV","GreenHornets","MikeForce","SpikeTeam"]) then{_groupID = "FAILED"};
systemchat str ["team Update - _groupID: ",_groupID];
vn_tr_groupID = _groupID;

getArray(MissionConfigFile >> "gamemode" >> "settings" >> "teams" >> _groupID) params[["_group_name_full", "ERROR: GROUP NAME FULL"], ["_group_icon", "Vn\ui_f_vietnam\ui\taskroster\img\missionTarget_prev.paa"], ["_group_name", "ERROR: GROUP NAME"]];
VN_TR_TEAMNAME_CTRL ctrlSetText _group_name_full;
VN_TR_TEAMLOGO_CTRL ctrlSetText _group_icon;


_group_name_bold = format["<t align='center' font='tt2020base_vn_bold'>%1</t>", _group_name];
VN_TR_MAININFO_TXT_TOP_CTRL ctrlSetStructuredText parsetext format[localize "STR_vn_mf_taskRoster_Main_teamWelcome", _group_name_bold];
VN_TR_MAININFO_IMG_CTRL ctrlSetText _group_icon;

call vn_mf_fnc_tr_missions_fill;
