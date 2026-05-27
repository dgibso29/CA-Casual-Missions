/*
	Zeus spawner AI presets

	Use this file to set up presets of groups of units to be spawned with the zeus spawner. 

	A "unit" here is a group or groups that can be spawned by one click of the spawn button.
	It is not necessarily only one soldier or group.

	Units and categories are defined as classes, with unit classes contained inside a category class.

	The class name is not seen in game and is restricted to letters, numbers, and underscores. 

	A category has:
		- categoryName: The name of the category which you will see in-game.
		- gear: 		The faction code as used in the CAFE framework. For example, "blu_f" means the gear will be taken from the BLUFOR gearscript.
		- side:			This defines the side that soldiers spawned will bear allegiance to. Available options are: "west" (BLUFOR), "east" (OPFOR), "resistance", and "civilian".
		- Any number of unit classes.
	
	A unit has (at most):
		- unitName: 		The name that will be shown in-game on the zeus spawner UI.
		- units[]:			An array of soldiers to be spawned, given as gearscript loadout codes.
		- vehicle: 			The classname of a vehicle to be spawned. You can get it by right-clicking a vehicle in 3DEN and selecting "Log > Log classes to clipboard".
		- reinforcements[]:	An array of soldiers to be spawned in the vehicle's cargo space, given as gearscript loadout codes.
		- groups[]:			An array of units that will be spawned as separate groups, explained in detail below.
	
	The only field that must be present in all unit definitions is unitName. You can include whichever of the rest you wish, with some limitations explained below. 

	If a vehicle is defined, then units[] *must* also be defined. The units[] will be treated as the crew of that vehicle and will spawn inside. The first entry of units[] will always be the commander.

	If reinforcements[] is defined, then a vehicle and units[] *must* also be defined. The reinforcements will spawn in the cargo space of the vehicle.
		The vehicle gets a TR unload waypoint and a RTB waypoint (only if it's unarmed), the group a Move waypoint. The vehicle will also despawn on RTB. If the vehicle is a Heli, it will spawn flying and always RTB

	The groups[] array allows you to spawn many separate groups with one click. 
	The groups[] array can contain as many groups as you wish, which will be spawned alongside units[], vehicle, and reinforcements[], if they are defined.
	You can define a group "in-line" as an array of gearscript loadout codes, similarly to the units[] array. You may not reference other units in groups defined this way.
	You can reference other defined units by their class name (NOT their unitName). Definition order does not matter, and names are not case sensitive.
	Other units are referenced as Category_Class.Unit_Class (e.g. BLUFOR_Infantry.Rifleman). This means you can reference across categories, even including other sides if you wish.
	If you are referencing a unit in the same category, you can leave off the Category_Class (e.g. just Rifleman).
	Note that you can not directly reference a vehicle class name. It must be defined in a separate unit to be referenced in groups[].
	If you reference another unit, it will be spawned just like if you had clicked the spawn button for that unit.
*/




// Start editing below here
// ---------------------------------------------------------------------------------------------------------------------------------------

class CA_ZeusUI_Units
{

	// Category definition
	class BLUFOR_Infantry
	{
		categoryName = "BLUFOR Infantry"; // This is the name of the category which you will see in-game.
		gear = "blu_f";                   // This is the faction code as used in the CAFE framework. Here, "blu_f", means the gear will be taken from the BLUFOR gearscript (aka BLUFOR).
		side = "west";                    // "west" means the units will bear allegiance to the western side (aka BLUFOR). Available options are: "west", "east", "resistance" and "civilian".

		// Units definition
		class Rifleman
		{
			unitName = "BLUFOR Rifleman"; // This is the name of the squad which will be shown in-game.
			units[] = {"rif"};            // This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "BLUFOR Fireteam 4x";
			units[] = {"ftl", "ar", "lat", "rif"};
		};

		class Squad_6x
		{
			unitName = "BLUFOR Squad 6x";
			units[] = {"ftl", "ar", "aar", "lat", "rif", "mk"}; // This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "BLUFOR Section 9x";
			units[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};

		class LAT_Team
		{
			unitName = "BLUFOR LAT Team";
			units[] = {"rif", "lat"};
		};

		class AR_Team
		{
			unitName = "BLUFOR AR Team";
			units[] = {"aar", "ar"};
		};

		class MK_Team
		{
			unitName = "BLUFOR MK Team";
			units[] = {"rif", "mk"};
		};

	};



	class OPFOR_Infantry
	{
		categoryName = "OPFOR Infantry";
		gear = "opf_f";
		side = "east";

		// Units definition
		class Rifleman
		{
			unitName = "OPFOR Rifleman"; // This is the name of the squad which will be shown in-game.
			units[] = {"rif"};           // This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "OPFOR Fireteam 4x";
			units[] = {"ftl", "ar", "lat", "rif"};
		};

		class Squad_6x
		{
			unitName = "OPFOR Squad 6x";
			units[] = {"ftl", "ar", "aar", "lat", "rif", "mk"}; // This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "OPFOR Section 9x";
			units[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};

		class LAT_Team
		{
			unitName = "OPFOR LAT Team";
			units[] = {"rif", "lat"};
		};

		class AR_Team
		{
			unitName = "OPFOR AR Team";
			units[] = {"aar", "ar"};
		};

		class MK_Team
		{
			unitName = "OPFOR MK Team";
			units[] = {"rif", "mk"};
		};

	};

	class OPFOR_Vehicles
	{
		categoryName = "OPFOR Vehicles";
		gear = "opf_f";
		side = "east";

		class Technical
		{
			unitName = "Technical";
			vehicle = "CUP_I_Hilux_DSHKM_NAPA";
			units[] = {"rif", "rif"};
		};

		class Tempest_Reinforcements
		{
			unitName = "Ural + Section 9x";
			vehicle = "CUP_O_Ural_RU";
			units[] = {"rif", "rif"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};
	};


	//If you are in need of civilians being spawned, e.g. for story purposes, this is the category to define them in. 
	class Civilian_Units 
	{
		categoryName = "Civilian";
		gear = "civ_f";
		side = "civilian";

		// Units definition
		class IDAP_Medic
		{
			unitName = "IDAP Medic";  // This is the name of the unit which will be shown in-game.
			units[] = {"idap_medic"}; // Do not forget to actually define the gear in 'configuration\loadouts\gear_civilian.sqf' and the identity in 'configuration\identity\identity_assignment.sqf'.
		};
	};
};


