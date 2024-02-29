/*
    Needed Mods:
    - Spearhead 1944 CDLC

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "SPE_GER_lieutenant";                                          // Officer
opfor_squad_leader = "SPE_GER_SquadLead";                                  // Squad Leader
opfor_team_leader = "SPE_GER_SquadLead";                                   // Team Leader
opfor_sentry = "SPE_GER_rifleman_lite";                                      // Rifleman (Lite)
opfor_rifleman = "SPE_GER_rifleman_2";                                         // Rifleman
opfor_rpg = "SPE_GER_LAT_Klein_Rifleman";                                          // Rifleman (LAT)
opfor_grenadier = "SPE_GER_ober_grenadier";                                     // Grenadier
opfor_machinegunner = "SPE_GER_mgunner2";                                 // Autorifleman
opfor_heavygunner = "SPE_GER_mgunner";                                  // Heavy Gunner
opfor_marksman = "SPE_GER_ober_rifleman";                                       // Marksman
opfor_sharpshooter = "SPE_GER_scout_sniper";                                // Sharpshooter
opfor_sniper = "SPE_GER_scout_sniper";                                            // Sniper
opfor_at = "SPE_GER_LAT_Rifleman";                                            // AT Specialist
opfor_aa = "SPE_GER_LAT_30m_Rifleman";                                            // AA Specialist
opfor_medic = "SPE_GER_medic";                                              // Combat Life Saver
opfor_engineer = "SPE_GER_sapper";                                        // Engineer
opfor_paratrooper = "SPE_GER_stggunner";                                   // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "SPE_OpelBlitz_Open";                                             // Ifrit
opfor_mrap_armed = "SPE_SdKfz250_1";                                   // Ifrit (HMG)
opfor_transport_helo = "SPE_OpelBlitz";                   // Mi-290 Taru (Bench)
opfor_transport_truck = "SPE_OpelBlitz";                         // Tempest Transport (Covered)
opfor_ammobox_transport = "SPE_OpelBlitz_Open";                     // Tempest Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "SPE_OpelBlitz_Fuel";                                 // Tempest Fuel
opfor_ammo_truck = "SPE_OpelBlitz_Ammo";                                 // Tempest Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             // Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             // Taru Ammo Pod
opfor_flag = "SPE_FlagCarrier_GER";                                             // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "SPE_GER_SquadLead",                                                     // Rifleman (Lite)
    "SPE_GER_rifleman_lite",                                                     // Rifleman (Lite)
    "SPE_GER_rifleman_2",                                                     // Rifleman
    "SPE_GER_LAT_Klein_Rifleman",                                                 // Rifleman (AT)
    "SPE_GER_mgunner2",                                                  // Autorifleman
    "SPE_GER_ober_rifleman",                                                   // Marksman
    "SPE_GER_medic",                                               // Medic
    "SPE_GER_sapper"                                                    // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "SPE_SdKfz250_1",                                                  // Qilin (armed)
    "SPE_SdKfz250_1",                                                  // Qilin (armed)
    "SPE_SdKfz250_1"                                                  // Qilin (armed)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "SPE_SdKfz250_1",                                                  // Ifrit (HMG)
    "SPE_SdKfz250_1",                                                  // Ifrit (GMG)
    "SPE_SdKfz250_1",                                                  // Ifrit (GMG)
    "SPE_OpelBlitz_Flak38",                                            // ZSU-39 Tigris
    "SPE_OpelBlitz_Flak38",                                            // ZSU-39 Tigris
    "SPE_PzKpfwIII_N",                                                // T-100 Varsuk
    "SPE_PzKpfwIV_G",                                                // T-100 Varsuk
    "SPE_Nashorn",                                                // T-140 Angara
    "SPE_PzKpfwVI_H1"                                                // T-140K Angara
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "SPE_SdKfz250_1",                                                  // Ifrit (HMG)
    "SPE_SdKfz250_1",                                                  // Ifrit (HMG)
    "SPE_SdKfz250_1",                                                  // Ifrit (HMG)
    "SPE_OpelBlitz_Flak38",                                                    // Qilin (AT)
    "SPE_PzKpfwIII_J",                                          // MSE-3 Marid
    "SPE_PzKpfwIII_M",                                          // MSE-3 Marid
    "SPE_PzKpfwIII_L"                                         // BTR-K Kamysh
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "SPE_SdKfz250_1",                                                  // Ifrit (GMG)
    "SPE_OpelBlitz_Flak38",                                            // ZSU-39 Tigris
    "SPE_PzKpfwIII_N",                                                // T-100 Varsuk
    "SPE_PzKpfwIV_G",                                                // T-100 Varsuk
    "SPE_PzKpfwIII_J",                                          // MSE-3 Marid
    "SPE_PzKpfwIII_M",                                          // MSE-3 Marid
    "SPE_PzKpfwIII_L",                                         // BTR-K Kamysh
    "SPE_Nashorn",                                                // T-140 Angara
    "SPE_PzKpfwVI_H1",                                                // T-140K Angara
    "SPE_FW190F8",                                              // To-201 Shikra
    "SPE_FW190F8",                                              // To-201 Shikra
    "SPE_FW190F8",                                              // To-201 Shikra
    "SPE_OpelBlitz",                                      // Mi-290 Taru (Bench)
    "SPE_OpelBlitz",                                      // Mi-290 Taru (Bench)
    "SPE_OpelBlitz",                                      // Mi-290 Taru (Bench)
    "SPE_OpelBlitz_Open",                                      // Mi-290 Taru (Bench)
    "SPE_OpelBlitz_Open"                                 // Mi-48 Kajman
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "SPE_SdKfz250_1",                                                  // Ifrit (GMG)
    "SPE_OpelBlitz_Flak38",                                            // ZSU-39 Tigris
    "SPE_PzKpfwIII_N",                                                // T-100 Varsuk
    "SPE_PzKpfwIV_G",                                                // T-100 Varsuk
    "SPE_PzKpfwIII_J",                                          // MSE-3 Marid
    "SPE_PzKpfwIII_M",                                          // MSE-3 Marid
    "SPE_PzKpfwIII_L",                                         // BTR-K Kamysh
    "SPE_FW190F8",                                              // To-201 Shikra
    "SPE_OpelBlitz",                                      // Mi-290 Taru (Bench)
    "SPE_OpelBlitz",                                      // Mi-290 Taru (Bench)
    "SPE_OpelBlitz",                                      // Mi-290 Taru (Bench)
    "SPE_OpelBlitz_Open",                                      // Mi-290 Taru (Bench)
    "SPE_OpelBlitz_Open"                                 // Mi-48 Kajman
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "SPE_OpelBlitz",                                      // Mi-290 Taru (Bench)
    "SPE_OpelBlitz_Open"                                      // Mi-290 Taru (Bench)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [

];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "SPE_FW190F8"                                              // To-201 Shikra
];
