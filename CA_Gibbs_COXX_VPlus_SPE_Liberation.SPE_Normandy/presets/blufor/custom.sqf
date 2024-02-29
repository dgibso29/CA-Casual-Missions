/*
    Needed Mods:
    - Spearhead 1944 CDLC

    Optional Mods:

*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_SPE_Tent_03";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "SPE_US_M3_Halftrack_Unarmed";                                // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "SPE_US_M3_Halftrack_Ambulance";                        // This is the mobile respawn (and medical) truck.
huron_typename = "SPE_US_M3_Halftrack_Ambulance";                       // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "SPE_US_Tank_Crew";                                         // This defines the crew for vehicles.
pilot_classname = "SPE_US_Pilot";                                      // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "SPE_P47";              // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "B_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "SPE_US_M3_Halftrack_Unarmed_Open";               // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_tan_F";           // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "B_Radar_System_01_F";             // The building defined to unlock FOB air vehicle functionality.
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";              // The helipad used to increase the GLOBAL rotary-wing cap.
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";             // The hangar used to increase the GLOBAL fixed-wing cap.
KP_liberation_supply_crate = "CargoNet_01_box_F";                       // This defines the supply crates, as in resources.
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";                      // This defines the ammunition crates.
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";                     // This defines the fuel crates.

/*
    --- Friendly classnames ---
    Each array below represents one of the 7 pages within the build menu.
    Format: ["vehicle_classname",supplies,ammunition,fuel],
    Example: ["B_APC_Tracked_01_AA_F",300,150,150],
    The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.
    IMPORTANT: The last element inside each array must have no comma at the end!
*/
infantry_units = [
    ["SPE_US_Rifleman",20,0,0],                                             // Rifleman
    ["SPE_US_Driver",15,0,0],                                        // Sharpshooter
    ["SPE_US_Grenadier",25,0,0],                                          // Grenadier
    ["SPE_US_Autorifleman",25,0,0],                                          // Autorifleman
    ["SPE_US_HMGunner",35,0,0],                                         // Heavygunner
    ["SPE_US_Radioman",25,0,0],                                           // Marksman
    ["SPE_US_AT_Soldier",50,10,0],                                         // AT Specialist
    ["SPE_US_Medic",30,0,0],                                               // Combat Life Saver
    ["SPE_US_Engineer",30,0,0],                                            // Engineer
    ["SPE_US_SquadLead",30,0,0],                                            // Engineer
    ["SPE_US_Second_Lieutenant",30,0,0],                                            // Engineer
    ["SPE_US_First_Lieutenant",30,0,0],                                            // Engineer
    ["SPE_US_Captain",30,0,0],                                            // Engineer
    ["SPE_US_Flamethrower_Operator",30,0,0],                                         // Explosives Specialist
    ["SPE_US_Sniper",70,5,0],                                              // Sniper
    ["SPE_US_Tank_Crew",10,0,0],                                                // Crewman
    ["SPE_US_Pilot",10,0,0]                                                // Pilot
];

light_vehicles = [
    ["SPE_US_M3_Halftrack_Unarmed_Open",75,0,50],                                     // Prowler
    ["SPE_US_M3_Halftrack",75,60,50],                                         // Prowler (AT)
    ["SPE_US_M16_Halftrack",75,250,50],                                         // Prowler (AT)
    ["SPE_US_M3_Halftrack_Ambulance",250,250,50],                                         // Prowler (AT)
    ["SPE_US_M3_Halftrack_Unarmed",500,500,500]                                         // Prowler (AT)
];

heavy_vehicles = [
    ["SPE_M4A0_75_Early",300,400,250],                            // M1A1SA (Tusk I)
    ["SPE_M4A0_75",300,400,250],                                    // M2A4 Slammer UP
    ["SPE_M4A1_75",300,400,250],                     // M1A2SEPv1 (Tusk II)
    ["SPE_M4A1_76",300,600,300],                                // MBT Leopard 2A6M
    ["SPE_M18_Hellcat",350,700,350],                          // Rhino MGS
    ["SPE_M10",350,750,250],                       // Rhino MGS UP
    ["SPE_M4A1_T34_Calliope_Direct",600,1250,400],                                   // M4 Scorcher
    ["SPE_M4A1_T34_Calliope",600,1250,400]                                // M109A6
];

air_vehicles = [
    ["SPE_P47",400,800,500]                                 // V-44 X Blackfish (Vehicle)
];

static_vehicles = [
    ["SPE_M1919_M2",25,40,0],                                             // Mk30A HMG .50
    ["SPE_M1919_M2_Trench_Deployed",25,40,0],                                        // Mk30 HMG .50 (Raised)
    ["SPE_M1919A6_Bipod",25,40,0],                                           // Mk30 HMG .50 (Autonomous)
    ["SPE_57mm_M1",50,100,0],                                         // Static Titan Launcher (AT)
    ["SPE_M45_Quadmount",50,100,0],                                         // Static Titan Launcher (AA)
    ["SPE_M1_81",80,150,0]                                         // Mk6 Mortar
];

buildings = [
    ["Flag_US_F",0,0,0],
    ["Flag_UK_F",0,0,0],
    ["Flag_White_F",0,0,0],
    ["Flag_RedCrystal_F",0,0,0],
    ["CamoNet_BLUFOR_F",0,0,0],
    ["CamoNet_BLUFOR_open_F",0,0,0],
    ["CamoNet_BLUFOR_big_F",0,0,0],
    ["Land_PortableLight_single_F",0,0,0],
    ["Land_PortableLight_double_F",0,0,0],
    ["Land_LampHalogen_F",0,0,0],
    ["Land_LampStreet_small_F",0,0,0],
    ["Land_LampAirport_F",0,0,0],
    ["Land_PaperBox_open_empty_F",0,0,0],
    ["Land_PaperBox_open_full_F",0,0,0],
    ["Land_PaperBox_closed_F",0,0,0],
    ["Land_ToolTrolley_02_F",0,0,0],
    ["Land_ToolTrolley_01_F",0,0,0],
    ["Land_BarrelWater_F",0,0,0],
    ["Land_BarrelWater_grey_F",0,0,0],
    ["Land_WaterBarrel_F",0,0,0],
    ["Land_WaterTank_F",0,0,0],
    ["Land_BagFence_Round_F",0,0,0],
    ["Land_BagFence_Short_F",0,0,0],
    ["Land_BagFence_Long_F",0,0,0],
    ["Land_BagFence_Corner_F",0,0,0],
    ["Land_BagFence_End_F",0,0,0],
    ["Land_BagBunker_Small_F",0,0,0],
    ["Land_BagBunker_Large_F",0,0,0],
    ["Land_CncBarrierMedium_F",0,0,0],
    ["Land_CncBarrierMedium4_F",0,0,0],
    ["Land_Concrete_SmallWall_4m_F",0,0,0],
    ["Land_Concrete_SmallWall_8m_F",0,0,0],
    ["Land_CncShelter_F",0,0,0],
    ["Land_CncWall1_F",0,0,0],
    ["Land_CncWall4_F",0,0,0],
    ["Land_Sign_WarningMilitaryArea_F",0,0,0],
    ["Land_Sign_WarningMilAreaSmall_F",0,0,0],
    ["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
    ["Land_Razorwire_F",0,0,0],
    ["Land_SPE_BarbedWire_04",0,0,0],
    ["Land_SPE_BarbedWire_03",0,0,0],
    ["Land_SPE_BarbedWire_02",0,0,0],
    ["Land_SPE_BarbedWire_01",0,0,0],
    ["Land_SPE_BarbedWire_Posts",0,0,0],
    ["Land_SPE_BarbedWire_End",0,0,0],
    ["Land_SPE_Netting_01",0,0,0],
    ["Land_SPE_Netting_02",0,0,0],
    ["Land_SPE_Dugout_3m",0,0,0],
    ["Land_SPE_Dugout_3m_sandbags",0,0,0],
    ["Land_SPE_Dugout_6m",0,0,0],
    ["Land_SPE_Dugout_6m315",0,0,0],
    ["Land_SPE_Dugout_6m315_sandbags",0,0,0],
    ["Land_SPE_Dugout_6m45",0,0,0],
    ["Land_SPE_Dugout_6m45_sandbags",0,0,0],
    ["Land_SPE_Dugout_6m_sandbags",0,0,0],
    ["Land_SPE_Dugout_Cover",0,0,0],
    ["Land_SPE_Dugout_Pile_01",0,0,0],
    ["Land_SPE_Dugout_Pile_02",0,0,0],
    ["Land_SPE_Guardbox",0,0,0],
    ["Land_SPE_HedgeHog",0,0,0],
    ["Land_SPE_US_Tent",0,0,0],
    ["Land_SPE_Sandbag_Curve",0,0,0],
    ["Land_SPE_Sandbag_Gun_Hole",0,0,0],
    ["Land_SPE_Sandbag_Long",0,0,0],
    ["Land_SPE_Sandbag_Long_Line",0,0,0],
    ["Land_SPE_Sandbag_Long_Thick",0,0,0],
    ["Land_SPE_Sandbag_Nest",0,0,0],
    ["Land_SPE_Sandbag_Short",0,0,0],
    ["Land_SPE_Sandbag_Short_Low",0,0,0],
    ["Land_SPE_Sandbag_Single",0,0,0],
    ["Land_SPE_Tent_02",0,0,0],
    ["Land_SPE_Tent_01",0,0,0],
    ["Land_ClutterCutter_large_F",0,0,0]
];

support_vehicles = [
    [Arsenal_typename,100,200,0],
    [Respawn_truck_typename,200,0,100],
    [FOB_box_typename,300,500,0],
    [FOB_truck_typename,300,500,75],
    [KP_liberation_small_storage_building,0,0,0],
    [KP_liberation_large_storage_building,0,0,0],
    [KP_liberation_recycle_building,250,0,0],
    [KP_liberation_air_vehicle_building,1000,0,0],
    [KP_liberation_heli_slot_building,250,0,0],
    [KP_liberation_plane_slot_building,500,0,0],
    ["ACE_medicalSupplyCrate_advanced",50,0,0],
    ["ACE_Box_82mm_Mo_HE",50,40,0],
    ["ACE_Box_82mm_Mo_Smoke",50,10,0],
    ["ACE_Box_82mm_Mo_Illum",50,10,0],
    ["ACE_Wheel",10,0,0],
    ["ACE_Track",10,0,0],
    ["SPE_US_M3_Halftrack_Repair",325,0,75],                                   // HEMTT Repair
    ["SPE_US_M3_Halftrack_Fuel",125,0,275],                                    // HEMTT Fuel
    ["SPE_US_M3_Halftrack_Ammo",125,200,75],                                   // HEMTT Ammo
    ["B_Slingload_01_Repair_F",275,0,0],                                // Huron Repair
    ["B_Slingload_01_Fuel_F",75,0,200],                                 // Huron Fuel
    ["B_Slingload_01_Ammo_F",75,200,0]                                  // Huron Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "SPE_US_SquadLead",
    "SPE_US_Rifleman",
    "SPE_US_Rifleman",
    "SPE_US_AT_Soldier",
    "SPE_US_Grenadier",
    "SPE_US_Autorifleman",
    "SPE_US_Autorifleman",
    "SPE_US_Radioman",
    "SPE_US_Medic",
    "SPE_US_Engineer"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "SPE_US_SquadLead",
    "SPE_US_Radioman",
    "SPE_US_AT_Soldier",
    "SPE_US_Grenadier",
    "SPE_US_Autorifleman",
    "SPE_US_Autorifleman",
    "SPE_US_HMGunner",
    "SPE_US_Sniper",
    "SPE_US_Medic",
    "SPE_US_Engineer"
];

// AT specialists squad.
blufor_squad_at = [
    "SPE_US_SquadLead",
    "SPE_US_Rifleman",
    "SPE_US_Rifleman",
    "SPE_US_AT_Soldier",
    "SPE_US_AT_Soldier",
    "SPE_US_AT_Soldier",
    "SPE_US_Medic",
    "SPE_US_Rifleman"
];

// AA specialists squad.
blufor_squad_aa = [
    "SPE_US_SquadLead",
    "SPE_US_Rifleman",
    "SPE_US_Rifleman",
    "SPE_US_AT_Soldier",
    "SPE_US_AT_Soldier",
    "SPE_US_AT_Soldier",
    "SPE_US_Medic",
    "SPE_US_Rifleman"
];

// Force recon squad.
blufor_squad_recon = [
    "SPE_US_Captain",
    "SPE_US_Flamethrower_Operator",
    "SPE_US_Flamethrower_Operator",
    "SPE_US_AT_Soldier",
    "SPE_US_HMGunner",
    "SPE_US_Autorifleman",
    "SPE_US_Flamethrower_Operator",
    "SPE_US_Sniper",
    "SPE_US_Medic",
    "SPE_US_Engineer"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "SPE_US_Driver",
    "SPE_US_Driver",
    "SPE_US_Driver",
    "SPE_US_Driver",
    "SPE_US_Driver",
    "SPE_US_Driver",
    "SPE_US_Driver",
    "SPE_US_Driver",
    "SPE_US_Driver",
    "SPE_US_Driver"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "SPE_M4A0_75_Early",                                   // M1A2SEPv1 (Tusk II)
    "SPE_M4A0_75",                                              // MBT Leopard 2A6M
    "SPE_M4A1_75",                                                  // M4 Scorcher
    "SPE_M4A1_76",                                               // M109A6
    "SPE_M18_Hellcat",                                                      // F/A-18 E Super Hornet
    "SPE_M10",                                                      // F/A-18 F Super Hornet
    "SPE_M4A1_T34_Calliope_Direct",                                             // F/A-181 Black Wasp II
    "SPE_M4A1_T34_Calliope",                                     // F/A-181 Black Wasp II (Stealth)
    "SPE_P47"                                               // V-44 X Blackfish (Armed)
];
