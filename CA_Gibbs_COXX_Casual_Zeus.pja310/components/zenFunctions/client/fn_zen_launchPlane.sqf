#include "macros.hpp"

params ["_object", "_speed", "_altitude"];

if (isNull _object) then
{
    systemChat "No object found: no plane launched.";
}
else
{
    [_object, _speed, _altitude] remoteExec ["f_fnc_zen_doLaunchPlane", _object];
};
