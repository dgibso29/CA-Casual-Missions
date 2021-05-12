/*
    File: fn_tr_selectTeam_set.sqf
    Author: Dscha
    Date: 2020-04-23
    Last Update: 2020-04-23
    Public: No
    
    Description:
		Sends remoteExec request to the Server, to update the team on the player.
		After succesfully joined Group, Server answers by RemoteExec-ing "vn_mf_fnc_tr_overview_team_update" and the TaskRoster-Dialog udpates itself.
    
    Parameter(s): none
    
    Returns: nothing
    
    Example(s):
		Usefull example provided by Dscha:
		Erm, just like below? C'mon... it's a 1-liner ¯\_(ツ)_/¯
*/

//vn_tr_groupID (set in "vn_mf_fnc_tr_selectTeam")	=	"ACAV" / "GreenHornets" / "MikeForce" / "SpikeTeam"
["changeteam", [vn_tr_groupID]] call para_c_fnc_call_on_server;
