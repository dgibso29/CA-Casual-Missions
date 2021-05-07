#include "macros.hpp"

params ["_unit"];

if (isNull _unit) then
{
    systemChat "No unit found to wound.";
}
else
{
	["Wound Unit Randomly",
	[
		["SLIDER", "Max Number of Wounds", [1, 20, 6, 0]],
		["COMBO", "Wound Types", [[["bullet", "grenade", "explosive", "shell", "vehiclecrash", "collision", "backblast", "stab", "punch", "falling", "ropeburn", "drowning"], ["bullet"], ["grenade"], ["explosive"], ["shell"], ["vehiclecrash"], ["collision"], ["backblast"], ["stab"], ["punch"], ["falling"], ["ropeburn"], ["drowning"]], ["All", "Bullet", "Grenade", "Explosive", "Shell", "Vehicle Crash", "Collision", "Backblast", "Stab", "Punch", "Fall", "Rope Burn", "Drowning"],0]],
		["COMBO", "Wound Locations", [[["head", "body", "leftArm", "rightArm", "leftLeg", "rightLeg"],["head"], ["body"], ["leftArm"], ["rightArm"], ["leftLeg"], ["rightLeg"]], ["All", "Head", "Body", "Left Arm", "Right Arm", "Left Leg", "Right Leg"], 0]]
		// ["SLIDER:PERCENT", "Wound Damage Range", [0, 1, 0.5, 2]]
	],
	{
		params ["_dialogValues", "_args"];
		_dialogValues params ["_maxWounds", "_forceWoundTypes", "_forceWoundLocations", "_damageRange"];
		_args params ["_unit"];
		[_unit, _maxWounds, _forceWoundTypes, _forceWoundLocations, _damageRange] remoteExec ["f_fnc_zen_doWoundUnitRandomly", 2];

	},
	{},
	[_unit]] call zen_dialog_fnc_create;
};