/*
	File: fn_ai_subsystem_init.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-03
	Public: No

	Description:
		Initialises the AI management subsystem.

	Parameter(s): none

	Returns: nothing

	Example(s): nothing
*/
params [["_subsystemConfig", []]];

para_s_ai_obj_config = createHashMapFromArray _this;

//All groups that have been created/are owned by the AI subsystem
para_s_ai_obj_managedGroups = [];

para_s_ai_obj_objective_counter = 0;
para_s_ai_obj_objectives = [];
para_s_ai_obj_active_objectives = [];

para_s_ai_obj_pool_counter = 0;
para_s_ai_obj_reinforcement_pools = [];
para_s_ai_obj_reinforcement_pool_range = 1000;
para_s_ai_obj_reinforcement_pool_scaling = 1;

para_s_ai_obj_activation_radius = 1000;
para_s_ai_obj_priority_radii = [300,400,500,700,para_s_ai_obj_activation_radius];
para_s_ai_obj_reinforce_block_direct_spawn_range = 600;
para_s_ai_obj_reinforce_reallocate_range = 600;

para_s_ai_obj_hard_ai_limit = para_s_ai_obj_config getOrDefault ["hardAiLimit", 80];

para_s_ai_obj_pursuitRadius = 300;
para_s_ai_obj_maxPursuitDistance = 1200;

para_s_ai_obj_infinite_reinforcement_pool = [[0,0,0], 9999999] call para_s_fnc_ai_obj_create_reinforcement_pool;

addMissionEventHandler ["EntityKilled", para_s_fnc_ai_obj_entity_killed_update_reinforcements_pool];

["ai_manager", para_s_fnc_ai_obj_job, [], 5] call para_g_fnc_scheduler_add_job;