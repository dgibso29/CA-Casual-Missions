/*
    File: fn_snake_handler.sqf
    Author: Aaron Clark
    Date: 2020-07-21
    Last Update: 2020-07-21
    Public: No

    Description:
	No description added yet.

    Parameter(s):
	none

    Returns:
	Function reached the end [BOOL]

    Example(s):
	call vn_mf_fnc_snake_handler
*/

if (isNil "vn_mf_snake_last_bite_time") then {
	vn_mf_snake_last_bite_time = 0;
};

if (isNil "vn_mf_snake_brain" || {isNull vn_mf_snake_brain}) then {
	private _snake_den = position player nearObjects ["Snake_random_F", 10];
	if !(_snake_den isEqualTo []) then
	{
		private _snake = selectRandom _snake_den;
		_snake setVariable ["BIS_fnc_animalBehaviour_disable", true];
		vn_mf_snake_brain = [_snake] spawn {
			params ["_snake"];
			private _gamemode_config = (missionConfigFile >> "gamemode");
			getArray(_gamemode_config >> "settings" >> "snakebitechance" ) params [["_chance",0.5],["_distance",1]];
			getArray(_gamemode_config >> "settings" >> "snakebitefrequency" ) params [["_frequency",300],["_extra_time",300]];
			_last_hiss_time = diag_tickTime;
			while { sleep 1; alive _snake } do
			{
				if (isNull _snake) exitWith {};
				_snake moveTo (getPosATL player);

				private _snake_can_bite = 
					((vn_mf_snake_last_bite_time + _frequency + random _extra_time) < diag_tickTime)
					|| (!isNil "snake_original_behaviour" && vn_mf_snake_last_bite_time + 30 < diag_tickTime);


				if (   _snake distance player <= _distance 
				    && _snake_can_bite
					&& {random 1 <= _chance}) 
				then
				{
					playSound "vn_snake_bite_scream_sound";
					// add posion to player
					["eatdrink", [-1,-1,"snake_bite"]] call para_c_fnc_call_on_server;
					vn_mf_snake_last_bite_time = diag_tickTime;
				} else {
					if (_snake distance player < 10 && (_last_hiss_time + 30) < diag_tickTime) then
					{
						_snake say3D "vn_snake_hiss_sound";
						_last_hiss_time = diag_tickTime;
					};
				};
			};
		};
	};
};
