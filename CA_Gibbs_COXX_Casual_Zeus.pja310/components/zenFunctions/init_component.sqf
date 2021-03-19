#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting zenFunctions")

if !(isNil 'zen_custom_modules_fnc_register') then
{

    // Set respawner object (for each side).

    _objectWest   = {[_this#0, _this#1, west] call f_fnc_zen_setRespawnObject};
    _objectEast   = {[_this#0, _this#1, east] call f_fnc_zen_setRespawnObject};
    _objectIndfor = {[_this#0, _this#1, independent] call f_fnc_zen_setRespawnObject};
    _objectCiv    = {[_this#0, _this#1, civilian] call f_fnc_zen_setRespawnObject};

    ["[CA2] Respawners", "Set Respawner Object (BLUFOR)", _objectWest] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Set Respawner Object (OPFOR)", _objectEast] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Set Respawner Object (INDFOR)", _objectIndfor] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Set Respawner Object (Civilian)", _objectCiv] call zen_custom_modules_fnc_register;


    // Set respawn marker (for each side).

    _markerWest   = {[_this#0, west] call f_fnc_zen_moveRespawnMarker};
    _markerEast   = {[_this#0, east] call f_fnc_zen_moveRespawnMarker};
    _markerIndfor = {[_this#0, independent] call f_fnc_zen_moveRespawnMarker};
    _markerCiv    = {[_this#0, civilian] call f_fnc_zen_moveRespawnMarker};

    ["[CA2] Respawners", "Move Respawn Marker (BLUFOR)", _markerWest] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Move Respawn Marker (OPFOR)", _markerEast] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Move Respawn Marker (INDFOR)", _markerIndfor] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Move Respawn Marker (Civilian)", _markerCiv] call zen_custom_modules_fnc_register;


    // Create player spawner (for each side).

    _spawnerWest   = {[_this#0, west] call f_fnc_zen_createSpawner};
    _spawnerEast   = {[_this#0, east] call f_fnc_zen_createSpawner};
    _spawnerIndfor = {[_this#0, independent] call f_fnc_zen_createSpawner};
    _spawnerCiv    = {[_this#0, civilian] call f_fnc_zen_createSpawner};

    ["[CA2] Respawners", "Respawn Random Player (BLUFOR)", _spawnerWest] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Respawn Random Player (OPFOR)", _spawnerEast] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Respawn Random Player (INDFOR)", _spawnerIndfor] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Respawn Random Player (Civilian)", _spawnerCiv] call zen_custom_modules_fnc_register;

    if !(isNil 'kyk_ew_fnc_broadcastJammerAdd') then
    {
        _jammerCreate = {[_this#1] call f_fnc_zen_createJammer};

        ["[CA2] Electronic Warfare", "Create Jammer", _jammerCreate] call zen_custom_modules_fnc_register;

        _jammerRemove = {[_this#1] call f_fnc_zen_removeJammers};

        ["[CA2] Electronic Warfare", "Remove Jammer", _jammerRemove] call zen_custom_modules_fnc_register;
    };
    
    _woundUnit = {_this#1 call f_fnc_zen_woundUnitRandomly};

    ["[CA2] Misc", "Wound Unit Randomly", _woundUnit] call zen_custom_modules_fnc_register;

    _woundUnit = {_this#1 call f_fnc_zen_woundUnitRandomlyAdvanced};

    ["[CA2] Misc", "Wound Unit (Advanced)", _woundUnit] call zen_custom_modules_fnc_register;

    _woundUnit = {_this#1 call f_fnc_zen_woundGroupRandomly};

    ["[CA2] Misc", "Wound Group Randomly", _woundUnit] call zen_custom_modules_fnc_register;

    _woundUnit = {_this#1 call f_fnc_zen_woundGroupRandomlyAdvanced};

    ["[CA2] Misc", "Wound Group (Advanced)", _woundUnit] call zen_custom_modules_fnc_register;


    _yeet    = {[_this#1, 300, 400] call f_fnc_zen_launchPlane};

    ["[CA2] ACE GUN", "yeet the plane", _yeet] call zen_custom_modules_fnc_register;

    _yeet    = {[_this#1, 900, 400] call f_fnc_zen_launchPlane};

    ["[CA2] ACE GUN", "yeet the plane faster", _yeet] call zen_custom_modules_fnc_register;

    _181Squadron = {[_this#0, west, "B_Plane_Fighter_01_F", 3, 0, 800, 550] call f_fnc_zen_spawnSquadron;};

    ["[CA2] ACE GUN", "Spawn 181s (On Module))", _181Squadron] call zen_custom_modules_fnc_register;

    _201Squadron = {[_this#0, east, "O_Plane_Fighter_02_F", 3, 0, 800, 480] call f_fnc_zen_spawnSquadron;};

    ["[CA2] ACE GUN", "Spawn 201s (On Module))", _201Squadron] call zen_custom_modules_fnc_register;

    _199Squadron = {[_this#0, east, "O_Plane_CAS_02_dynamicLoadout_F", 3, 0, 800, 530] call f_fnc_zen_spawnSquadron;};

    ["[CA2] ACE GUN", "Spawn 199s (On Module)", _199Squadron] call zen_custom_modules_fnc_register;

    _mirageSquadron = {[_this#0, west, "B_FR_Mirage_2000_5F_01", 3, 0, 800, 520] call f_fnc_zen_spawnSquadron;};

    ["[CA2] ACE GUN", "Spawn Mirages (On Module))", _mirageSquadron] call zen_custom_modules_fnc_register;

    _migSquadron = {[_this#0, east, "CFP_O_RUARMY_Su_34_DES_01", 3, 0, 800, 480] call f_fnc_zen_spawnSquadron;};

    ["[CA2] ACE GUN", "Spawn Su-34s (On Module)", _migSquadron] call zen_custom_modules_fnc_register;

    _frogfootSquadron = {[_this#0, east, "CFP_O_RUARMY_Su_25T_Frogfoot_DES_01", 3, 0, 800, 490] call f_fnc_zen_spawnSquadron;};

    ["[CA2] ACE GUN", "Spawn Frogfeet (On Module)", _frogfootSquadron] call zen_custom_modules_fnc_register;

    _harrierSquadron = {[_this#0, west, "CUP_B_AV8B_DYN_USMC", 3, 0, 800, 510] call f_fnc_zen_spawnSquadron;};

    ["[CA2] ACE GUN", "Spawn Harriers (On Module))", _harrierSquadron] call zen_custom_modules_fnc_register;

    _lightningSquadron = {[_this#0, east, "CUP_B_F35B_USMC", 3, 0, 800, 500] call f_fnc_zen_spawnSquadron;};

    ["[CA2] ACE GUN", "Spawn F-35s (On Module)", _lightningSquadron] call zen_custom_modules_fnc_register;

};
