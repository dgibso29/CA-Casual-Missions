/*
    File: eh_EntityRespawned.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-04-12
    Last Update: 2020-05-27
    Public: No

    Description:
		Entity respawned event handler, used to reapply unit loadout after death.

    Parameter(s):
		_entity - respawned entity [OBJECT]
		_corpse - corpse/wreck [OBJECT]

    Returns: nothing

    Example(s):
		Not called directly.
*/

params
[
	"_entity",
	"_corpse"
];
// respawn player with same loadout as before death
if (isPlayer _entity) then
{
	// get loadout from body
	private _loadout = getUnitLoadout _corpse;

	// get dropped weaponholders
	private _weaponholders = _corpse getVariable ["vn_mf_dyn_weaponholders",[]];
	{
		if (!isnull _x) then {
			private _weaponholder = _x;
			{
				private _type = getNumber(configfile >> "cfgweapons" >> (_x select 0) >> "type");
				switch _type do
				{
					case 1: {_loadout set [0,_x]};
					case 4: {_loadout set [1,_x]};
				};
			} forEach (weaponsItemsCargo _weaponholder);
			// remove weaponholder
			deletevehicle _weaponholder;
		};
	} foreach _weaponholders;

	// restore loadout
	_entity setUnitLoadout [_loadout, false];

	// wipe out unused data
	_corpse setVariable ["vn_mf_dyn_weaponholders",nil,true];
};
