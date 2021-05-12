/*
    File: fn_loadbal_set_fps.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-05-10
    Last Update: 2020-06-06
    Public: No
    
    Description:
        Sets var on server.
		[!:warning] The `_player` variable is passsed from the parent scope!
    
    Parameter(s):
		_fps - FPS [Number, defaults to 0]
    
    Returns: nothing
    
    Example(s):
		para_s_fnc_loadbal_set_fps (server)
			or
		["setfps", [diag_fps]] call para_c_fnc_call_on_server;
*/

params [
	["_fps",0,[0]]	// 0 : NUMBER - fps
];

// set fps to local var on the player.
_player setVariable ["para_s_dyn_fps",_fps];
