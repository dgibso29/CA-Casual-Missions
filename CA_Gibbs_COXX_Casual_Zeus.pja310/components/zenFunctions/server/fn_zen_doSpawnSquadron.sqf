#include "macros.hpp"

params ["_position", "_side", "_unitClass", "_numberToSpawn", "_azimuth", "_speed", "_altitude"];

_planes = []; 

x = 0;
for "_i" from 1 to _numberToSpawn do  
{ 
 _adjPos = [(_position select 0) + (250 * (x - 1)), _position select 1, (_position select 2) + 50]; 
 _plane = _unitClass createVehicle _adjPos; 
 _plane setDir _azimuth;
 [vehicle _plane, _speed, _altitude] call f_fnc_zen_doLaunchPlane; 
 _planes set [x, _plane]; 
 createVehicleCrew _plane; 
 x = x + 1;
}; 
 
_group = group (driver (_planes select 0)); 

for "_i" from 0 to _numberToSpawn - 1 do 
{
 _pilot = crew (_planes select _i);
 _pilot join _group;
};

deleteWaypoint [_group, 0]; 
//_group addWaypoint [getMarkerPos _targetMarker, 200]; 
_group setCombatMode "RED";
_group setSpeedMode "FULL";

 
// { 
//  [vehicle _x, _speed] call f_fnc_zen_doLaunchPlane; 
// } forEach _planes;