// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_pjump.sqf"
#include "..\x_setup.sqf"

params ["_startLocation"];

if (d_HALOWaitTime > 0) then {d_next_jump_time = time + d_HALOWaitTime};

titleText ["", "Plain"];

player setPos _startLocation;

sleep 3;

if (d_with_ai && {d_player_canu}) then {[getPosATL player, velocity player, getDirVisual player] spawn d_fnc_moveai};

d_jump_action_id = player addAction [localize "str_a3_rscgrouprootmenu_items_openparachute0", {
	private _chute = createVehicle ["Steerable_Parachute_F", [0,0, getPos player # 2], [], 0, "FLY"];
	_chute setDir (getDir player);
	_chute setPos (getPos player);
	player moveInDriver _chute;
	player removeAction d_jump_action_id;
	d_jump_action_id = nil;
}, 0, 6, false, false, "", "if (!d_player_canu || {getPos player # 2 < 1.5}) then {player removeAction d_jump_action_id;d_jump_action_id = nil; false} else {true}"];
