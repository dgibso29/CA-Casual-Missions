/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "UK3CB_ANA_B_OFF";                                          // Officer
opfor_squad_leader = "UK3CB_ANA_B_SL";                                  // Squad Leader
opfor_team_leader = "UK3CB_ANA_B_TL";                                   // Team Leader
opfor_sentry = "UK3CB_ANA_B_RIF_1";                                      // Rifleman (Lite)
opfor_rifleman = "UK3CB_ANA_B_RIF_2";                                         // Rifleman
opfor_rpg = "UK3CB_ANA_B_LAT";                                          // Rifleman (LAT)
opfor_grenadier = "UK3CB_ANA_B_GL";                                     // Grenadier
opfor_machinegunner = "UK3CB_ANA_B_AR";                                 // Autorifleman
opfor_heavygunner = "UK3CB_ANA_B_MG";                                  // Heavy Gunner
opfor_marksman = "UK3CB_ANA_B_MK";                                       // Marksman
opfor_sharpshooter = "UK3CB_ANA_B_MK";                                // Sharpshooter
opfor_sniper = "UK3CB_ANA_B_SNI";                                            // Sniper
opfor_at = "UK3CB_ANA_B_AT";                                            // AT Specialist
opfor_aa = "UK3CB_ANA_B_AA";                                            // AA Specialist
opfor_medic = "UK3CB_ANA_B_MD";                                              // Combat Life Saver
opfor_engineer = "UK3CB_ANA_B_ENG";                                        // Engineer
opfor_paratrooper = "UK3CB_ANA_B_RIF_2";                                   // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "UK3CB_ANA_B_M1025";                                             // Ifrit
opfor_mrap_armed = "UK3CB_ANA_B_M1025_M2";                                   // Ifrit (HMG)
opfor_transport_helo = "UK3CB_ANA_B_B_UH60M";                   // Mi-290 Taru (Bench)
opfor_transport_truck = "UK3CB_ANA_B_Ural";                         // Tempest Transport (Covered)
opfor_ammobox_transport = "O_Truck_03_transport_F";                     // Tempest Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "UK3CB_ANA_B_Ural_Fuel";                                 // Tempest Fuel
opfor_ammo_truck = "UK3CB_ANA_B_Ural_Ammo";                                 // Tempest Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             // Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             // Taru Ammo Pod
opfor_flag = "Flag_AFG_13";                                             // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
"UK3CB_ABP_B_RIF_1",
"UK3CB_ABP_B_RIF_2",
"UK3CB_ABP_B_AT",
"UK3CB_ABP_B_AR",
"UK3CB_ABP_B_MK",
"UK3CB_ABP_B_MD",
"UK3CB_ABP_B_ENG",
"UK3CB_ANP_B_RIF_1",
"UK3CB_ANP_B_RIF_2",
"UK3CB_ANP_B_AR",
"UK3CB_ANP_B_AT",
"UK3CB_ANP_B_MD",
"UK3CB_ANP_B_MK",
"UK3CB_ANP_B_ENG" 
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
"UK3CB_ABP_B_M1025_M2",
"UK3CB_ABP_B_M1025",
"UK3CB_ANP_B_Datsun_Pickup_PKM",
"UK3CB_ANP_B_Datsun_Pickup",
"UK3CB_ANP_B_UAZ_Closed",
"UK3CB_ANP_B_UAZ_Open",
"UK3CB_ANP_B_YAVA_ANP",
"UK3CB_ANP_B_Hilux_Open",
"UK3CB_ANP_B_Hilux_Closed"
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
"UK3CB_ANA_B_M1025_M2",
"UK3CB_ANA_B_Ural_Zu23",
"UK3CB_ANA_B_M1117",
"UK3CB_ANA_B_M113_M2",
"UK3CB_ANA_B_BMP1",
"UK3CB_ANA_B_AH9",
"UK3CB_ANA_B_UH1H_M240",
"UK3CB_ANA_B_MaxxPro_M2",
"UK3CB_ANA_B_MaxxPro_MK19",
"UK3CB_ANA_B_BMP2",
"UK3CB_ANA_B_M113_MK19",
"UK3CB_ANA_B_T55",
"UK3CB_ANA_B_L39_AA",
"UK3CB_ANA_B_L39_CAS",
"UK3CB_ANA_B_Mi_24V",
"UK3CB_ANA_B_B_UH60M"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
"UK3CB_ANA_B_Hilux_Spg9",
"UK3CB_ANA_B_Hilux_Zu23",
"UK3CB_ANA_B_Hilux_Pkm",
"UK3CB_ANA_B_Hilux_Dshkm",
"UK3CB_ANA_B_Hilux_Open",
"UK3CB_ANA_B_M1025_M2",
"UK3CB_ANA_B_M1025",
"UK3CB_ANA_B_M998_2DR",
"UK3CB_ANA_B_M998_4DR",
"UK3CB_ANA_B_Ural_Zu23",
"UK3CB_ANA_B_M1117",
"UK3CB_ANA_B_M113_M2",
"UK3CB_ANA_B_BMP1",
"UK3CB_ANA_B_AH9",
"UK3CB_ANA_B_UH1H_M240"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
"UK3CB_ANA_B_M1117",
"UK3CB_ANA_B_M113_M2",
"UK3CB_ANA_B_AH9",
"UK3CB_ANA_B_UH1H_M240",
"UK3CB_ANA_B_MaxxPro_M2",
"UK3CB_ANA_B_MaxxPro_MK19",
"UK3CB_ANA_B_BMP2",
"UK3CB_ANA_B_M113_MK19",
"UK3CB_ANA_B_T55",
"UK3CB_ANA_B_L39_AA",
"UK3CB_ANA_B_L39_CAS",
"UK3CB_ANA_B_Mi_24V",
"UK3CB_ANA_B_B_UH60M",
"UK3CB_ANA_B_BMP2K",
"UK3CB_ANA_B_T72A",
"UK3CB_ANA_B_T72B",
"UK3CB_ANA_B_T72BM",
"UK3CB_ANA_B_ZsuTank",
"UK3CB_ANA_B_Mi_24P",
"UK3CB_ANA_B_Mi8AMTSh",
"UK3CB_ANA_B_UH1H_GUNSHIP",
"rhs_mig29sm_vvsc",
"RHS_Su25SM_vvs",
"RHS_T50_vvs_blueonblue",
"RHS_Ka52_vvs"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
"RHS_Su25SM_vvs",
"UK3CB_ANA_B_M1117",
"UK3CB_ANA_B_M113_M2",
"UK3CB_ANA_B_AH9",
"UK3CB_ANA_B_UH1H_M240",
"UK3CB_ANA_B_MaxxPro_M2",
"UK3CB_ANA_B_MaxxPro_MK19",
"UK3CB_ANA_B_BMP2",
"UK3CB_ANA_B_M113_MK19",
"UK3CB_ANA_B_T55",
"UK3CB_ANA_B_L39_AA",
"UK3CB_ANA_B_L39_CAS",
"UK3CB_ANA_B_Mi_24V",
"UK3CB_ANA_B_B_UH60M",
"UK3CB_ANA_B_BMP2K",
"UK3CB_ANA_B_T72A",
"UK3CB_ANA_B_ZsuTank",
"UK3CB_ANA_B_Mi_24P",
"UK3CB_ANA_B_Mi8AMTSh",
"UK3CB_ANA_B_UH1H_GUNSHIP",
"rhs_mig29sm_vvsc"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
"UK3CB_ANA_B_Benches_MH9",
"UK3CB_ANA_B_UH1H_M240",
"UK3CB_ANA_B_UH1H",
"UK3CB_ANA_B_Mi8AMTSh",
"UK3CB_ANA_B_Mi8",
"UK3CB_ANA_B_B_UH60M2",
"UK3CB_ANA_B_B_UH60M",
"UK3CB_ANA_B_Ural",
"UK3CB_ANA_B_Ural_Open"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
"UK3CB_ANA_B_AH9",
"UK3CB_ANA_B_Mi8AMTSh",
"UK3CB_ANA_B_Mi_24V",
"UK3CB_ANA_B_Mi_24P",
"UK3CB_ANA_B_B_UH60M",
"UK3CB_ANA_B_UH1H_GUNSHIP",
"UK3CB_ANA_B_UH1H_M240",
"RHS_Ka52_vvs"
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
"UK3CB_ANA_B_L39_AA",
"UK3CB_ANA_B_L39_CAS",
"RHS_Su25SM_vvs",
"rhs_mig29sm_vvs",
"RHS_T50_vvs_blueonblue"
];
