#include "macros.hpp"

params ["_object", "_speed", "_altitude"];

if !(isNull _object) then
{

    _pos = getPosAsl _object;

    _object setPosAsl [_pos#0, _pos#1, _altitude];
    _object setVelocityModelSpace [0, _speed, 0];
    _object setAirplaneThrottle 1;
    _object flyInHeight _altitude;

};
