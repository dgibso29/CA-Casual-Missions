/*
	File: fn_building_create.sqf
	Author: Spoffy and AWOL
	Date: 2020-10-02
	Last Update: 2020-10-02
	Public: Yes
	
	Description:
		Creates a new building, composed of one or more objects.
	
	Parameter(s):
		_buildingType - type of building to create [STRING]
		_spawnInfo - Positions to create objects at, in format [posWorld, rotation] [ARRAY]
		_buildProgress - Build progress to create building with [NUMBER]
		_initialSupplies - Initial supplies to put in the building. [NUMBER]
		_buildingId - Unique ID of the building. Leave nil unless loading a building [NUMBER]
	
	Returns:
		Function reached the end [BOOL]
	
	Example(s):
		[parameter] call vn_fnc_myFunction
*/

params ["_buildingType", "_spawnInfo", ["_buildProgress", 0], ["_initialSupplies", 0], "_buildingId"];

//If we're passed a single position entry, put it in an array.
if (_spawnInfo select 0 select 0 isEqualType 0) then 
{
	_spawnInfo = [_spawnInfo];
};

private _buildableConfig = (missionConfigFile >> "gamemode" >> "buildables" >> _buildingType);

if (isNil "_buildingId") then 
{
	// Create building IDs.
	(["GET", "buildables_counter", 0] call para_s_fnc_profile_db) params ["","_buildablesCounter"];
	_buildingId = _buildablesCounter +	1;
	(["SET", "buildables_counter", _buildingId] call para_s_fnc_profile_db);
};

// Load config

//Create an object that represents the building, so we can swap models around at will.
//Give it a position, so we can query on it.
private _buildingPos = _spawnInfo select 0 select 0;
private _building = createSimpleObject ["a3\weapons_f\empty.p3d", AGLToASL _buildingPos];
_building setVariable ["para_s_building_id",_buildingId];
_building setVariable ["para_g_buildclass", _buildingType, true];

private _features = "true" configClasses (_buildableConfig >> "features") apply {configName _x};
//Select feature configs from both config file and mission config file.
private _featureConfigs = 
	(_features apply {configFile >> "CfgBuildingFeatures" >> _x})
	+ (_features apply {missionConfigFile >> "CfgBuildingFeatures" >> _x})
	select {isClass _x};
_building setVariable ["para_s_build_features", _featureConfigs];

//Turn the building into a supply source.
private _internalSupplySource = [
	_building,
	getNumber (_buildableConfig >> "supply_capacity"), 
	_initialSupplies
] call para_s_fnc_supply_source_create;

//Keep this here, as although we reference the building now, better to be able to easily change it in the future.
_building setVariable ["para_g_internal_supply_source", _internalSupplySource, true];
//This idea of connecting to a supply source allows multiple objects to share the same supply pool
[_building, _internalSupplySource] call para_s_fnc_building_connect_supply_source;

//Spawn in objects associated with this building.
private _objectClass = getText ([
	_buildableConfig >> "build_states" >> "middle_state" >> "object_class", 
	_buildableConfig >> "build_states" >> "final_state" >> "object_class"
] select (_buildProgress >= 1));

//Start out by spawning in the buildings.
private _objects = _spawnInfo apply 
{
	_x params ["_pos", "_dir"];
	//This position is always going to be a bit inaccurate, as we don't have model's center offset until it's spawned in.
	private _newObject = createVehicle [_objectClass, ASLtoAGL _pos, [], 0, 'CAN_COLLIDE'];
	_newObject setDir _dir;
	//Need to reset position as the spawned-in position will be inaccurate, and is broken by the rotation anyway.
	_newObject setPosWorld _pos;
	_newObject setVariable ["para_g_building", _building, true];
	[[_newObject], "para_c_fnc_buildable_overlay_init", 0, _newObject] call para_s_fnc_remoteExec_jip_obj_stacked;
	_newObject
};

//Add build progress to the building, fully building it.
//Do NOT do an object update, as we've instantiated everything correctly above.
[_building, _buildProgress, false] call para_s_fnc_building_add_build_progress;

//Do *not* call change_objects, as we don't want to fire an event yet.
_building setVariable ["para_g_objects", _objects, true];

para_l_buildings pushBack _building;

[_building, "onBuildingPlaced", [_building]] call para_s_fnc_building_fire_feature_event;
[_building, "onBuildingObjectsChanged", [_building, _objects]] call para_s_fnc_building_fire_feature_event;

_building