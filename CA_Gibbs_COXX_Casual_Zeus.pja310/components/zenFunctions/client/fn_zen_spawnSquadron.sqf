#include "macros.hpp"

params ["_position", "_side", "_unitClass", "_numberToSpawn", ["_azimuth", 0], "_speed", "_altitude"];

[_position, _side, _unitClass, _numberToSpawn, _azimuth, _speed, _altitude] remoteExec ["f_fnc_zen_doSpawnSquadron", 2];