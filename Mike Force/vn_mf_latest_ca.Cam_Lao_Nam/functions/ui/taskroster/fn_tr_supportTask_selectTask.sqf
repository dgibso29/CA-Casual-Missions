/*
    File: fn_tr_supportTask_selectTask.sqf
    Author: Dscha
    Date: 2020-04-23
    Last Update: 2020-05-29
    Public: No
    
    Description:
		Called by Listbox "onLBSelChanged".
		Support Request Teams will be updated, depending on the selected Missions.
    
    Parameter(s):
		_0 - List-/Combobox control [Control]
		_1 - List-/Combobox selected Index (list of Tasknames) [Number]
    
    Returns: nothing
    
    Example(s):
		onLBSelChanged = "_this call vn_mf_fnc_tr_supportTask_selectTask; false;"
*/

disableSerialization;
#include "..\..\..\config\ui\ui_def_base.inc"

private _display = ctrlParent (_this#0);
//get selected Index of ctrl
private _index = _this#1;

//disable "Create new support Task" (all requirements must be met, before it get's enabled)
VN_TR_SUPREQ_CTASK_CTRL ctrlEnable false;
//reset Map position (if Team or Mission selection has changed)
VN_TR_SUPREQ_SELPOS_CTRL ctrlSetText "Select Position";

//Get the data from the selected Index
private _supportClassname = VN_TR_SUPREQ_TASK_CTRL lnbData [_index,0];
//update temporary data
vn_tr_supportMissionInfo = [_supportClassname,[],[]];
systemchat str ["vn_tr_supportMissionInfo: ",vn_tr_supportMissionInfo];

//get the Teams-List-/Combobox and clear it
_ctrl_availableTeams = VN_TR_SUPREQ_TEAM_CTRL;
lnbclear _ctrl_availableTeams;
//get the Teams, who are able to be assigned to the selected Task
//ret: Array with configName of allowed Teams for that Task
_teamsToAssign = getArray(missionConfigFile >> "gamemode" >> "tasks" >> _supportClassname >> "taskgroups");
_taskDesc = getText(missionConfigFile >> "gamemode" >> "tasks" >> _supportClassname >> "requesterDesc");
VN_TR_SUPREQ_DESC_TXT_CTRL ctrlSetStructuredText parseText _taskDesc;
systemchat str ["_teamsToAssign", _teamsToAssign];
//Fill the List-/Combobox with the Teams
{
	private _group_data = getArray(MissionConfigFile >> "gamemode" >> "settings" >> "teams" >> _x);
	//["Regular Name", "path to Icon", "Shortname"]
	_group_data params["_group_name","_group_icon","_group_name_short"];
	
	private _index = _ctrl_availableTeams lnbAddRow ["",_group_name_short];
	_ctrl_availableTeams lnbSetData [[_index,0], _x];
	_ctrl_availableTeams lnbSetPicture [[_index,0], _group_icon];

} forEach _teamsToAssign;
_ctrl_availableTeams lbSetCurSel 0;