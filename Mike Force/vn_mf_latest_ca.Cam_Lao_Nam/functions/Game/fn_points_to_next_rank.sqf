/*
	File: fn_player_within_radius.sqf
	Author: Aaron Clark <vbawol>
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No
	
	Description:
    converts rank to icon
	
	Parameter(s): none
	
	Returns:
    [0,1] [Array]
      0 - path to rank icon [String]
      1 - rank text name [String]

	Example(s):
    call vn_mf_fnc_points_to_next_rank
*/

(([player] call vn_mf_fnc_unit_next_rank) select 2) - (player getVariable ["vn_mf_db_rank",0])
