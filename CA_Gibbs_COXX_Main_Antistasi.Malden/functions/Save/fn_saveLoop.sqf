private _filename = "fn_saveLoop";
if (!isServer) exitWith {
	[1, "Miscalled server-only function", _filename] call A3A_fnc_log;
};

if (savingServer) exitWith {["Save Game", "Server data save is still in progress"] remoteExecCall ["A3A_fnc_customHint",theBoss]};
savingServer = true;
[2, "Starting persistent save", _filename] call A3A_fnc_log;
["Persistent Save Starting","Starting persistent save..."] remoteExec ["A3A_fnc_customHint",0,false];
// Save each player with global flag
{
	[getPlayerUID _x, _x, true] call A3A_fnc_savePlayer;
} forEach (call A3A_fnc_playableUnits);

// Check if this campaign is already in the save list
private _saveList = [profileNamespace getVariable "antistasiSavedGames"] param [0, [], [[]]];
private _saveIndex = -1;
{
	if (_x select 0 == campaignID) exitWith { _saveIndex = forEachIndex };
} forEach _saveList;

// If not, append a new entry
if (_saveIndex == -1) then {
	private _gametype = if (teamPlayer isEqualTo independent) then {"Greenfor"} else {"Blufor"};
	_saveList pushBack [campaignID, worldName, _gametype];
	profileNamespace setVariable ["antistasiSavedGames", _saveList];
};

// Update the legacy campaign ID store
profileNamespace setVariable ["ss_campaignID", campaignID];

private ["_garrison"];
["attackCountdownOccupants", attackCountdownOccupants] call A3A_fnc_setStatVariable;
["attackCountdownInvaders", attackCountdownInvaders] call A3A_fnc_setStatVariable;
["gameMode", gameMode] call A3A_fnc_setStatVariable;
["difficultyX", skillMult] call A3A_fnc_setStatVariable;
["bombRuns", bombRuns] call A3A_fnc_setStatVariable;
["smallCAmrk", smallCAmrk] call A3A_fnc_setStatVariable;
["membersX", membersX] call A3A_fnc_setStatVariable;
private _antennasDeadPositions = [];
{ _antennasDeadPositions pushBack getPos _x; } forEach antennasDead;
["antennas", _antennasDeadPositions] call A3A_fnc_setStatVariable;
//["mrkNATO", (markersX - controlsX) select {sidesX getVariable [_x,sideUnknown] == Occupants}] call A3A_fnc_setStatVariable;
["mrkSDK", (markersX - controlsX - outpostsFIA) select {sidesX getVariable [_x,sideUnknown] == teamPlayer}] call A3A_fnc_setStatVariable;
["mrkCSAT", (markersX - controlsX) select {sidesX getVariable [_x,sideUnknown] == Invaders}] call A3A_fnc_setStatVariable;
["posHQ", [getMarkerPos respawnTeamPlayer,getPos fireX,[getDir boxX,getPos boxX],[getDir mapX,getPos mapX],getPos flagX,[getDir vehicleBox,getPos vehicleBox]]] call A3A_fnc_setStatVariable;
["dateX", date] call A3A_fnc_setStatVariable;
["skillFIA", skillFIA] call A3A_fnc_setStatVariable;
["destroyedSites", destroyedSites] call A3A_fnc_setStatVariable;
["distanceSPWN", distanceSPWN] call A3A_fnc_setStatVariable;
["civPerc", civPerc] call A3A_fnc_setStatVariable;
["chopForest", chopForest] call A3A_fnc_setStatVariable;
["maxUnits", maxUnits] call A3A_fnc_setStatVariable;
["nextTick", nextTick - time] call A3A_fnc_setStatVariable;
["weather",[fogParams,rain]] call A3A_fnc_setStatVariable;
private _destroyedPositions = destroyedBuildings apply { getPosATL _x };
["destroyedBuildings",_destroyedPositions] call A3A_fnc_setStatVariable;

//Save aggression values
["aggressionOccupants", [aggressionLevelOccupants, aggressionStackOccupants]] call A3A_fnc_setStatVariable;
["aggressionInvaders", [aggressionLevelInvaders, aggressionStackInvaders]] call A3A_fnc_setStatVariable;

private ["_hrBackground","_resourcesBackground","_veh","_typeVehX","_weaponsX","_ammunition","_items","_backpcks","_containers","_arrayEst","_posVeh","_dierVeh","_prestigeOPFOR","_prestigeBLUFOR","_city","_dataX","_markersX","_garrison","_arrayMrkMF","_arrayOutpostsFIA","_positionOutpost","_typeMine","_posMine","_detected","_typesX","_exists","_friendX"];

_hrBackground = (server getVariable "hr") + ({(alive _x) and (not isPlayer _x) and (_x getVariable ["spawner",false]) and ((group _x in (hcAllGroups theBoss) or (isPlayer (leader _x))) and (side group _x == teamPlayer))} count allUnits);
_resourcesBackground = server getVariable "resourcesFIA";
_vehInGarage = [];
_vehInGarage = _vehInGarage + vehInGarage;
{
	_friendX = _x;
	if ((_friendX getVariable ["spawner",false]) and (side group _friendX == teamPlayer))then {
		if ((alive _friendX) and (!isPlayer _friendX)) then {
			if (((isPlayer leader _friendX) and (!isMultiplayer)) or (group _friendX in (hcAllGroups theBoss)) and (not((group _friendX) getVariable ["esNATO",false]))) then {
				_resourcesBackground = _resourcesBackground + (server getVariable [(typeOf _friendX),0]);
				_backpck = backpack _friendX;
				if (_backpck != "") then {
					switch (_backpck) do {
						case MortStaticSDKB: {_resourcesBackground = _resourcesBackground + ([SDKMortar] call A3A_fnc_vehiclePrice)};
						case AAStaticSDKB: {_resourcesBackground = _resourcesBackground + ([staticAAteamPlayer] call A3A_fnc_vehiclePrice)};
						case MGStaticSDKB: {_resourcesBackground = _resourcesBackground + ([SDKMGStatic] call A3A_fnc_vehiclePrice)};
						case ATStaticSDKB: {_resourcesBackground = _resourcesBackground + ([staticATteamPlayer] call A3A_fnc_vehiclePrice)};
					};
				};
				if (vehicle _friendX != _friendX) then {
					_veh = vehicle _friendX;
					_typeVehX = typeOf _veh;
					if (not(_veh in staticsToSave)) then {
						if ((_veh isKindOf "StaticWeapon") or (driver _veh == _friendX)) then {
							if ((group _friendX in (hcAllGroups theBoss)) or (!isMultiplayer)) then {
								_resourcesBackground = _resourcesBackground + ([_typeVehX] call A3A_fnc_vehiclePrice);
								if (count attachedObjects _veh != 0) then {{_resourcesBackground = _resourcesBackground + ([typeOf _x] call A3A_fnc_vehiclePrice)} forEach attachedObjects _veh};
							};
						};
					};
				};
			};
		};
	};
} forEach allUnits;


["resourcesFIA", _resourcesBackground] call A3A_fnc_setStatVariable;
["hr", _hrBackground] call A3A_fnc_setStatVariable;
["vehInGarage", _vehInGarage] call A3A_fnc_setStatVariable;

_arrayEst = [];
{
	_veh = _x;
	_typeVehX = typeOf _veh;
	if ((_veh distance getMarkerPos respawnTeamPlayer < 50) and !(_veh in staticsToSave) and !(_typeVehX in ["ACE_SandbagObject","Land_PaperBox_01_open_boxes_F","Land_PaperBox_01_open_empty_F"])) then {
		if (((not (_veh isKindOf "StaticWeapon")) and (not (_veh isKindOf "ReammoBox")) and (not (_veh isKindOf "ReammoBox_F")) and (not (_veh isKindOf "FlagCarrier")) and (not(_veh isKindOf "Building"))) and (not (_typeVehX == "C_Van_01_box_F")) and (count attachedObjects _veh == 0) and (alive _veh) and ({(alive _x) and (!isPlayer _x)} count crew _veh == 0) and (not(_typeVehX == "WeaponHolderSimulated"))) then {
			_posVeh = getPos _veh;
			_xVectorUp = vectorUp _veh;
			_xVectorDir = vectorDir _veh;
			_arrayEst pushBack [_typeVehX,_posVeh,_xVectorUp,_xVectorDir];
		};
	};
} forEach vehicles - [boxX,flagX,fireX,vehicleBox,mapX];

_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
{
	_positionX = position _x;
	if ((alive _x) and !(surfaceIsWater _positionX) and !(isNull _x)) then {
		_arrayEst pushBack [typeOf _x,getPosATL _x,getDir _x];
	};
} forEach staticsToSave;

["staticsX", _arrayEst] call A3A_fnc_setStatVariable;
[] call A3A_fnc_arsenalManage;

_jna_dataList = [];
_jna_dataList = _jna_dataList + jna_dataList;
["jna_dataList", _jna_dataList] call A3A_fnc_setStatVariable;

_prestigeOPFOR = [];
_prestigeBLUFOR = [];

{
	_city = _x;
	_dataX = server getVariable _city;
	_prestigeOPFOR = _prestigeOPFOR + [_dataX select 2];
	_prestigeBLUFOR = _prestigeBLUFOR + [_dataX select 3];
} forEach citiesX;

["prestigeOPFOR", _prestigeOPFOR] call A3A_fnc_setStatVariable;
["prestigeBLUFOR", _prestigeBLUFOR] call A3A_fnc_setStatVariable;

_markersX = markersX - outpostsFIA - controlsX;
_garrison = [];
_wurzelGarrison = [];

{
	_garrison pushBack [_x,garrison getVariable [_x,[]]];
	_wurzelGarrison pushBack [
		_x,
		garrison getVariable [format ["%1_garrison",_x], []],
	 	garrison getVariable [format ["%1_requested",_x], []],
		garrison getVariable [format ["%1_over", _x], []]
	];
} forEach _markersX;

["garrison",_garrison] call A3A_fnc_setStatVariable;
["wurzelGarrison", _wurzelGarrison] call A3A_fnc_setStatVariable;
["usesWurzelGarrison", true] call A3A_fnc_setStatVariable;

_arrayMines = [];
{
	_typeMine = typeOf _x;
	_posMine = getPos _x;
	_dirMine = getDir _x;
	_detected = [];
	if (_x mineDetectedBy teamPlayer) then {
		_detected pushBack teamPlayer
	};
	if (_x mineDetectedBy Occupants) then {
		_detected pushBack Occupants
	};
	if (_x mineDetectedBy Invaders) then {
		_detected pushBack Invaders
	};
	_arrayMines = _arrayMines + [[_typeMine,_posMine,_detected,_dirMine]];
} forEach allMines;

["minesX", _arrayMines] call A3A_fnc_setStatVariable;

_arrayOutpostsFIA = [];

{
	_positionOutpost = getMarkerPos _x;
	_arrayOutpostsFIA pushBack [_positionOutpost,garrison getVariable [_x,[]]];
} forEach outpostsFIA;

["outpostsFIA", _arrayOutpostsFIA] call A3A_fnc_setStatVariable;

if (!isDedicated) then {
	_typesX = [];
	{
		if ([_x] call BIS_fnc_taskExists) then {
			_state = [_x] call BIS_fnc_taskState;
			if (_state == "CREATED") then {
				_typesX pushBackUnique _x;
			};
		};
	} forEach ["AS","CON","DES","LOG","RES","CONVOY","DEF_HQ","rebelAttack","invaderPunish"];

	["tasks",_typesX] call A3A_fnc_setStatVariable;
};

_dataX = [];
{
	_dataX pushBack [_x,server getVariable _x];
} forEach airportsX + outposts;

["idlebases",_dataX] call A3A_fnc_setStatVariable;

_dataX = [];
{
	_dataX pushBack [_x,timer getVariable _x];
} forEach (vehAttack + vehNATOAttackHelis + vehPlanes + vehCSATAttackHelis);

["idleassets",_dataX] call A3A_fnc_setStatVariable;

_dataX = [];
{
	_dataX pushBack [_x,killZones getVariable [_x,[]]];
} forEach airportsX + outposts;

["killZones",_dataX] call A3A_fnc_setStatVariable;

_controlsX = controlsX select {(sidesX getVariable [_x,sideUnknown] == teamPlayer) and (controlsX find _x < defaultControlIndex)};
["controlsSDK",_controlsX] call A3A_fnc_setStatVariable;

//Saving the state of the testing timer
["testingTimerIsActive", testingTimerIsActive] call A3A_fnc_setStatVariable;

saveProfileNamespace;
savingServer = false;
_saveHintText = ["<t size='1.5'>",nameTeamPlayer," Assets:<br/><t color='#f0d498'>HR: ",str _hrBackground,"<br/>Money: ",str _resourcesBackground," €</t></t><br/><br/>Further infomation is provided in <t color='#f0d498'>Map Screen > Game Options > Persistent Save-game</t>."] joinString "";
["Persistent Save Completed",_saveHintText] remoteExec ["A3A_fnc_customHint",0,false];
[2, "Persistent Save Completed", _filename] call A3A_fnc_log;
