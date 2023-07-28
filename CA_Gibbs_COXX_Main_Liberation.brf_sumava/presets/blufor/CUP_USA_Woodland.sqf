/*
    Needed Mods:
    - CUP Weapons
    - CUP Vehicles
    - CUP Units

    Optional Mods:
    - USAF Main Pack
    - USAF Fighters Pack
    - USAF Utility Pack
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V3_F";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "B_Truck_01_box_F";                                // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "CUP_B_HMMWV_Ambulance_USA";                   // This is the mobile respawn (and medical) truck.
huron_typename = "CUP_B_CH47F_USA";                                     // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "CUP_B_US_Crew";                                    // This defines the crew for vehicles.
pilot_classname = "CUP_B_US_Pilot";                                     // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "CUP_B_MH6M_USA";                 // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "B_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "CUP_B_MTVR_USA";                       // These are the trucks which are used in the logistic convoy system.
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
    ["CUP_B_US_Soldier",20,0,0],                                        // Rifleman
    ["CUP_B_US_Soldier_LAT",30,0,0],                                    // Rifleman (AT)
    ["CUP_B_US_Soldier_GL",25,0,0],                                     // Grenadier
    ["CUP_B_US_Soldier_AR",25,0,0],                                     // Automatic Rifleman
    ["CUP_B_US_Soldier_MG",35,0,0],                                     // Machinegunner
    ["CUP_B_US_Soldier_Marksman",30,0,0],                               // Marksman
    ["CUP_B_US_Soldier_AT",50,25,0],                                    // AT Specialist
    ["CUP_B_US_Soldier_HAT",50,10,0],                                   // AT Specialist (Javelin)
    ["CUP_B_US_Soldier_AA",50,10,0],                                    // AA Specialist
    ["CUP_B_US_Medic",30,0,0],                                          // Medic
    ["CUP_B_US_Engineer",30,0,0],                                       // Engineer
    ["CUP_B_US_SpecOps_MG",30,0,0],                                     // Machinegunner
    ["CUP_B_US_SpecOps",20,0,0],                                        // Operator
    ["CUP_B_US_SpecOps_M",30,0,0],                                      // Marksman
    ["CUP_B_US_SpecOps_TL",40,0,0],                                     // Team Leader
    ["CUP_B_US_SpecOps_Medic",30,0,0],                                  // Medic
    ["CUP_B_US_Sniper",70,5,0],                                         // Sniper
    ["CUP_B_US_Sniper_M107",70,5,0],                                    // Sniper (M107)
    ["CUP_B_US_Spotter",20,0,0],                                        // Spotter
    ["CUP_B_US_Crew",10,0,0],                                           // Crewman
    ["CUP_B_US_Pilot",10,0,0],                                          // Pilot
    ["CUP_B_BAF_Soldier_RiflemanLite_DPM",15,0,0],                      // Rifleman (Light)
    ["CUP_B_BAF_Soldier_Rifleman_DPM",20,0,0],                          // Rifleman
    ["CUP_B_BAF_Soldier_RiflemanAT_DPM",30,0,0],                        // Rifleman (AT)
    ["CUP_B_BAF_Soldier_Grenadier_DPM",25,0,0],                         // Grenadier
    ["CUP_B_BAF_Soldier_AutoRifleman_DPM",25,0,0],                      // Autorifleman
    ["CUP_B_BAF_Soldier_HeavyGunner_DPM",35,0,0],                       // Heavygunner
    ["CUP_B_BAF_Soldier_Marksman_DPM",30,0,0],                          // Marksman
    ["CUP_B_BAF_Soldier_SharpShooter_DPM",40,0,0],                      // Sharpshooter
    ["CUP_B_BAF_Soldier_AT_DPM",50,10,0],                               // AT Specialist
    ["CUP_B_BAF_Soldier_AA_DPM",50,10,0],                               // AA Specialist
    ["CUP_B_BAF_Soldier_Medic_DPM",30,0,0],                             // Combat Life Saver
    ["CUP_B_BAF_Soldier_Engineer_DPM",30,0,0],                          // Engineer
    ["CUP_B_BAF_Soldier_Explosive_DPM",30,0,0],                         // Explosives Specialist
    ["CUP_B_BAF_Soldier_Rifleman_MTP",20,0,0],                          // Recon Scout
    ["CUP_B_BAF_Soldier_RiflemanAT_MTP",30,0,0],                        // Recon Scout (AT)
    ["CUP_B_BAF_Soldier_Marksman_MTP",30,0,0],                          // Recon Marksman
    ["CUP_B_BAF_Soldier_SharpShooter_MTP",40,0,0],                      // Recon Sharpshooter
    ["CUP_B_BAF_Soldier_Medic_MTP",30,0,0],                             // Recon Paramedic
    ["CUP_B_BAF_Soldier_Explosive_MTP",30,0,0],                         // Recon Demolition Expert
    ["CUP_B_BAF_Sniper_AS50_TWS_DPM",70,5,0],                           // Sniper
    ["CUP_B_BAF_Sniper_AS50_DPM",70,5,0],                               // Sniper (Arid)
    ["CUP_B_BAF_Sniper_DPM",70,5,0],                                    // Sniper (Lush)
    ["CUP_B_BAF_Spotter_DPM",20,0,0],                                   // Spotter
    ["CUP_B_BAF_Soldier_Crew_DPM",10,0,0],                              // Crewman
    ["CUP_B_BAF_Soldier_Paratrooper_DPM",20,0,0],                       // Para Trooper
    ["CUP_B_BAF_Soldier_Helicrew_DPM",10,0,0],                          // Helicopter Crew
    ["CUP_B_BAF_Soldier_Helipilot_DPM",10,0,0],                         // Helicopter Pilot
    ["CUP_B_BAF_Soldier_Pilot_DPM",10,0,0],                             // Pilot
    ["CUP_B_GER_BW_Fleck_Soldier",20,0,0],                             // Rifleman
    ["CUP_B_GER_BW_Fleck_Soldier_GL",25,0,0],                          // Grenadier
    ["CUP_B_GER_BW_Fleck_Soldier_MG3",35,0,0],                          // Machinegunner
    ["CUP_B_GER_BW_Fleck_Soldier_Marksman",30,0,0],                    // Designated Marksman
    ["CUP_B_GER_BW_Fleck_Soldier_AT",50,25,0],                        // AT Specialist (Javelin)
    ["CUP_B_GER_BW_Fleck_Soldier_AAT",50,10,0],                         // AT Specialist (SMAW)
    ["CUP_B_GER_BW_Fleck_Soldier_AA",50,10,0],                         // AA Specialist (Stinger)
    ["CUP_B_GER_BW_Fleck_Soldier_AAA",50,10,0],                         // AA Specialist (Stinger)
    ["CUP_B_GER_BW_Fleck_Medic",30,0,0],                       // Corpsman
    ["CUP_B_GER_BW_Fleck_Soldier_Engineer",30,0,0],                    // Engineer
    ["CUP_B_GER_Fleck_Soldier_Scout",30,0,0],                                // Force Recon Demolitions Specialist
    ["CUP_B_GER_Fleck_Operator_EXP",20,0,0],                                // Force Recon Assault Rifleman
    ["CUP_B_GER_Fleck_Operator",30,0,0],                           // Force Recon Marksman
    ["CUP_B_GER_Fleck_Operator_TL",40,0,0],                                     // Force Recon Team Leader
    ["CUP_B_GER_Fleck_Medic",30,0,0],                                      // Force Recon Corpsman
    ["CUP_B_GER_Fleck_Crew",10,0,0],                             // Crewman
    ["CUP_B_GER_Fleck_HPilot",10,0,0]                                        // Pilot
];

light_vehicles = [
    ["CUP_B_HMMWV_Unarmed_USA",75,0,50],                                // HMMWV (Unarmed)
    ["CUP_B_HMMWV_M2_USA",75,60,50],                                    // HMMWV M2
    ["CUP_B_HMMWV_MK19_USA",75,80,50],                                  // HMMWV MK19
    ["CUP_B_HMMWV_TOW_USA",75,100,50],                                  // HMMWV TOW
    ["CUP_B_HMMWV_SOV_M2_USA",100,80,50],                               // HMMWV SOV (M2)
    ["CUP_B_HMMWV_SOV_USA",100,100,50],                                 // HMMWV SOV (Mk19)
    ["CUP_B_HMMWV_Avenger_USA",200,350,125],                            // HMMWV Avenger
    ["CUP_B_RG31_M2_OD_USA",150,75,100],                                // RG-31 Nyala M2
    ["CUP_B_RG31_M2_OD_GC_USA",225,75,100],                             // RG-31 Nyala M2 GC
    ["CUP_B_RG31E_M2_OD_USA",200,75,100],                               // RG-31 Mk5E M2
    ["CUP_B_RG31_Mk19_OD_USA",150,100,100],                             // RG-31 Mk.19
    ["CUP_B_MTVR_USA",125,0,75],                                        // MTVR
    ["B_Truck_01_flatbed_F",125,0,75],                                  // HEMTT Flatbed
    ["B_T_Truck_01_flatbed_F",125,0,75],                                // HEMTT Flatbed
    ["boxloader_tractor_fork",100,0,50],                                // Forklift Tractor
    ["boxloader_pallet_jack",25,0,0],                                // Pallet Jack
    ["CUP_B_LR_Transport_GB_W",75,0,50],                                // Land Rover 110 (Transport) Woodland
    ["CUP_B_LR_Ambulance_GB_W",75,0,50],                                // Land Rover 110 (Ambulance) Woodland
    ["CUP_B_LR_MG_GB_W",75,50,50],                                      // Land Rover 110 (M2) Woodland
    ["CUP_B_LR_Special_M2_GB_W",100,80,50],                             // Land Rover 110 (M2 Special) Woodland
    ["CUP_B_LR_Special_GMG_GB_W",100,100,50],                           // Land Rover 110 (GMG Special) Woodland
    ["CUP_B_BAF_Coyote_L2A1_W",200,40,50],                              // Coyote L2A1 Woodland
    ["CUP_B_BAF_Coyote_GMG_W",200,60,50],                               // Coyote GMG Woodland
    ["CUP_B_Mastiff_LMG_GB_W",250,20,150],                              // Mastiff PPV LMG Woodland
    ["CUP_B_Mastiff_HMG_GB_W",250,40,150],                              // Mastiff PPV HMG Woodland
    ["CUP_B_Mastiff_GMG_GB_W",250,60,150],                              // Mastiff PPV GMG Woodland
    ["CUP_B_Wolfhound_LMG_GB_W",275,20,150],                            // Wolfhound TSV LMG Woodland
    ["CUP_B_Wolfhound_HMG_GB_W",275,40,150],                            // Wolfhound TSV HMG Woodland
    ["CUP_B_Wolfhound_GMG_GB_W",275,60,150],                            // Wolfhound TSV GMG Woodland
    ["CUP_B_MTVR_BAF_WOOD",125,0,75],                                    // MTVR Transport    
    ["B_Quadbike_01_F",50,0,25],                                            // Quad Bike
    ["B_LSV_01_unarmed_F",75,0,50],                                         // Prowler
    ["B_LSV_01_armed_F",75,40,50],                                          // Prowler (HMG)
    ["UK3CB_BAF_LandRover_Soft_FFR_Green_A_MTP",75,0,50],                   // Land Rover SoftTop
    ["UK3CB_BAF_LandRover_Hard_FFR_Green_A_MTP",75,0,50],                   // Land Rover HardTop
    ["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_A_MTP",100,40,50],             // Land Rover WMIK (HMG)
    ["UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_A_MTP",100,60,50],             // Land Rover WMIK (GMG)
    ["UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_A_MTP",100,100,50],          // Land Rover WMIK (Milan)
    ["UK3CB_BAF_Jackal2_L2A1_W_MTP",100,80,50],                             // Jackal 2 (HMG)
    ["UK3CB_BAF_Jackal2_GMG_W_MTP",100,100,50],                             // Jackal 2 (GMG)
    ["UK3CB_BAF_Coyote_Passenger_L111A1_W_MTP",100,80,50],                  // Coyote Passenger (HMG)
    ["UK3CB_BAF_Coyote_Passenger_L134A1_W_MTP",100,100,50],                 // Coyote Passenger (GMG)
    ["UK3CB_BAF_Coyote_Logistics_L111A1_W_MTP",100,80,50],                  // Coyote Logistics (HMG)
    ["UK3CB_BAF_Coyote_Logistics_L134A1_W_MTP",100,100,50],                 // Coyote Logistics (GMG)
    ["rhsusf_M1230a1_usarmy_wd",120,0,60],                                  // M1230A1 (MEDEVAC)
    ["rhsusf_M1237_M2_usarmy_wd",125,40,75],                                // M1237 (HMG)
    ["rhsusf_M1237_MK19_usarmy_wd",125,60,75],                              // M1237 (GMG)
    ["rhsusf_M1083A1P2_WD_flatbed_fmtv_usarmy",100,0,50],                   // M1083A1P2
    ["rhsusf_M977A4_BKIT_usarmy_wd",125,0,75],                              // M977A4 BKIT
    ["rhsusf_M977A4_BKIT_M2_usarmy_wd",125,40,75],                          // M977A4 BKIT (HMG)
    ["B_UGV_01_F",150,0,50],                                                // UGV Stomper
    ["B_UGV_01_rcws_F",150,40,50],                                          // UGV Stomper (RCWS)
    ["B_Boat_Transport_01_F",100,0,25],                                     // Assault Boat
    ["B_Boat_Armed_01_minigun_F",200,80,75],                                // Speedboat Minigun
    ["rhsusf_mkvsoc",250,200,100],                                          // Mk.V SOCOM
    ["B_SDV_01_F",150,0,50]                                                 // SDV
];

heavy_vehicles = [
    ["Cre8ive_PandurII_W",200,175,125],                                  // LAV-25A1 (Olive) 
    ["CUP_B_M1126_ICV_M2_Woodland_Slat",200,150,125],                   // M1126 ICV M2 CROWS (Woodland - Slat)
    ["CUP_B_M1126_ICV_MK19_Woodland_Slat",200,200,125],                 // M1126 ICV MK19 CROWS (Woodland - Slat)
    ["CUP_B_M1128_MGS_Woodland_Slat",200,500,125],                      // M1128 MGS (Woodland - Slat)
    ["CUP_B_M1135_ATGMV_Woodland_Slat",200,300,125],                    // M1135 ATGMV (Woodland - Slat)
    ["CUP_B_M163_USA",250,600,200],                                     // M163A1 VADS
    ["CUP_B_M6LineBacker_USA_W",350,450,150],                           // M6 Linebacker (Woodland)
    ["CUP_B_M7Bradley_USA_W",300,300,150],                              // M7 Bradley (Woodland)
    ["CUP_B_M2Bradley_USA_W",300,400,150],                              // M2A2 Bradley IFV (Woodland)
    ["CUP_B_M2A3Bradley_USA_W",400,400,150],                            // M2A3 ERA Bradley IFV (Woodland)
    ["CUP_B_M1A1_Woodland_US_Army",500,500,200],                        // M1A1 Abrams (Woodland)
    ["CUP_B_M1A2_TUSK_MG_US_Army",600,550,225],                         // M1A2 Abrams TUSK (Woodland)
    ["CUP_B_M1129_MC_MK19_Woodland_Slat",600,800,400],                  // M1129 MC MK19 CROWS (Woodland - Slat)
    ["CUP_B_M270_HE_USA",600,1250,300],                                 // M270 MLRS (HE)
    ["CUP_B_M270_DPICM_USA",800,1750,400],                              // M270 MLRS (DPICM)
    ["CUP_B_FV432_Bulldog_GB_W",300,100,150],                           // FV432 Bulldog M240 [Woodland]
    ["CUP_B_FV432_Bulldog_GB_W_RWS",300,250,150],                       // FV432 Bulldog M2 RWS [Woodland]
    ["CUP_B_FV432_Mortar",350,500,150],                                 // FV432 Mortar
    ["CUP_B_MCV80_GB_W",300,450,275],                                   // MCV-80 Warrior (Woodland)
    ["CUP_B_MCV80_GB_W_SLAT",400,450,275],                              // MCV-80 Warrior (SLAT - Woodland)
    ["CUP_B_FV510_GB_W",350,550,275],                                   // FV510 Warrior (Woodland)
    ["CUP_B_FV510_GB_W_SLAT",450,550,275],                              // FV510 Warrior (SLAT - Woodland)
    ["CUP_B_Challenger2_Woodland_BAF",500,800,450],                     // FV4034 Challenger 2 (Woodland)
    ["CUP_B_Challenger2_2CW_BAF",500,800,450],                           // FV4034 Challenger 2 (Two-Color Woodland)
    ["CUP_B_Leopard2A6_GER",500,800,450],                          // FV4034 Challenger 2 (Two-Color Woodland)
    ["RHS_M2A2_BUSKI_WD",300,200,150],                                      // M2A2ODS (Busk I)
    ["RHS_M2A3_BUSKIII_wd",300,250,175],                                    // M2A3 (Busk III)
    ["RHS_M6_wd",300,250,175],                                              // M6A2
    ["rhsusf_m1a1aim_tuski_wd",400,350,225],                                // M1A1SA (Tusk I)
    ["rhsusf_m1a2sep1tuskiiwd_usarmy",500,400,250],                         // M1A2SEPv1 (Tusk II)
    ["rhsusf_m109_usarmy",600,1250,300]                                     // M109A6
];

air_vehicles = [
    ["CUP_B_UH60M_Unarmed_FFV_MEV_US",300,0,200],                       // UH-60M MEDVAC (Unarmed/FFV)
    ["CUP_B_UH60M_US",300,25,200],                                      // UH-60M
    ["CUP_B_UH60M_FFV_US",300,50,200],                                  // UH-60M (FFV)
    ["USAF_C130J",200,0,250],                                           // C-130J Super Hercules
    ["USAF_C130J_Cargo",200,0,250],                                     // C-130J Super Hercules (Cargo)
    ["USAF_C17",500,0,400],                                             // C-17 Globemaster III
    ["usaf_kc135",600,0,2500],                                          // KC-135 Stratotanker
    ["CUP_B_AH6M_USA",200,100,100],                                     // AH-6M
    ["CUP_B_MH60L_DAP_2x_US",400,250,225],                              // MH-60L DAP (2 Stores)
    ["CUP_B_MH60L_DAP_4x_US",400,500,225],                              // MH-60L DAP (4 Stores)
    ["CUP_B_AH64_DL_USA",500,600,300],                                  // AH-64
    ["CUP_B_AH64D_DL_USA",700,600,200],                                 // AH-64D
    ["CUP_B_AH6X_USA",300,0,100],                                       // AH-6X Littlebird ULB
    ["USAF_RQ4A",500,0,200],                                            // RQ-4A Global Hawk
    ["USAF_MQ9",500,750,200],                                           // MQ-9 Reaper
    ["CUP_B_AC47_Spooky_USA",600,300,400],                              // AC-47D Spooky
    ["CUP_B_A10_DYN_USA",1000,800,400],                                 // A-10A Thunderbolt II
    ["USAF_A10",1500,1000,400],                                         // A-10C Thunderbolt II
    ["USAF_F22",1800,2000,500],                                         // F-22A Raptor
    ["USAF_F22_EWP_AA",1800,2100,500],                                  // F-22A Raptor (EWP-AA)
    ["USAF_F22_EWP_AG",1800,2100,500],                                  // F-22A Raptor (EWP-AG)
    ["USAF_F22_Heavy",1800,2250,500],                                   // F-22A Raptor (Heavy)
    ["USAF_F35A_STEALTH",2250,2000,750],                                // F-35A Lightning II
    ["USAF_F35A",2250,2250,750],                                        // F-35A Lightning II (Heavy)
    ["CUP_B_AH6X_USA",300,0,100],                                       // AH-6X Littlebird ULB
    ["CUP_B_AW159_Unarmed_RN_Blackcat",225,0,125],                      // AW159 Wildcat (Black Cat, Unarmed)
    ["CUP_B_AW159_Unarmed_GB",225,0,125],                               // AW159 Wildcat (Green, Unarmed)
    ["CUP_B_AW159_Unarmed_RN_Grey",225,0,125],                          // AW159 Wildcat (Grey, Unarmed)
    ["CUP_B_AW159_RN_Blackcat",350,400,125],                            // AW159 Wildcat (Black Cat)
    ["CUP_B_AW159_GB",350,400,125],                                     // AW159 Wildcat (Green)
    ["CUP_B_AW159_RN_Grey",350,400,125],                                // AW159 Wildcat (Grey)
    ["CUP_B_AH1_DL_BAF",750,600,325],                                   // AH1
    ["CUP_B_GR9_DYN_GB",1000,1200,600],                                 // Harrier GR.9
    ["CUP_B_F35B_BAF",1500,1750,450],                                   // F-35B Lightning II
    ["CUP_B_F35B_Stealth_BAF",1500,1750,450],                           // F-35B Lightning II (Stealth)
    ["B_UAV_01_F",75,0,25],                                                 // AR-2 Darter
    ["B_UAV_06_F",80,0,30],                                                 // AL-6 Pelican (Cargo)
    ["UK3CB_BAF_Wildcat_AH1_TRN_8A_MTP",225,0,125],                         // Wildcat AH1 8 Transport (Unarmed)
    ["UK3CB_BAF_Wildcat_HMA2_TRN_8A_MTP",250,0,125],                        // Wildcat HMA2 8 Transport (Unarmed)
    ["UK3CB_BAF_Wildcat_AH1_CAS_6C_MTP",275,200,150],                       // Wildcat AH1 6 (CAS/AT)
    ["UK3CB_BAF_Wildcat_AH1_CAS_8C_MTP",275,200,150],                       // Wildcat AH1 8 (CAS/AT)
    ["UK3CB_BAF_Apache_AH1_MTP",500,500,200],                               // Apache AH 1 (Multi-Role)
    ["RHS_AH64D_wd",750,750,250],                                           // AH-64D (Multi-Role)
    ["RHS_UH60M2",250,0,150],                                               // UH-60M (Unarmed)
    ["RHS_UH60M",250,80,150],                                               // UH-60M
    ["RHS_UH60M_MEV2",300,0,150],                                           // UH-60M MEV2
    ["RHS_CH_47F_10",275,80,175],                                           // CH-47 Chinook (Armed)
    ["UK3CB_BAF_Merlin_HC3_32_MTP",300,0,175],                              // Merlin HC3 32
    ["UK3CB_BAF_Merlin_HC3_CSAR_MTP",300,80,175],                           // Merlin HC3 CSAR (Armed)
    ["B_UAV_02_dynamicLoadout_F",400,300,200],                              // MQ-4A Greyhawk
    ["B_T_UAV_03_dynamicLoadout_F",450,500,250],                            // MQ-12 Falcon
    ["B_UAV_05_F",500,500,200],                                             // UCAV Sentinel
    ["RHS_A10",1000,1000,400],                                              // A-10A (CAS)
    ["FIR_F15C",1250,1250,450],                                             // F-15C Eagle
    ["FIR_F15D",1250,1250,450],                                             // F-15D Eagle
    ["FIR_F15E",1250,1500,450],                                             // F-15E Strike Eagle
    ["JS_JC_FA18E",1500,1750,450],                                          // F/A-18 E Super Hornet
    ["JS_JC_FA18F",1500,1750,450],                                          // F/A-18 F Super Hornet
    ["B_Plane_Fighter_01_F",1500,1750,450],                                 // F/A-181 Black Wasp II
    ["B_Plane_Fighter_01_Stealth_F",1500,1750,450],                         // F/A-181 Black Wasp II (Stealth)
    ["B_T_VTOL_01_armed_F",750,1500,500],                                   // V-44 X Blackfish (Armed)
    ["B_T_VTOL_01_infantry_F",750,0,500],                                   // V-44 X Blackfish (Infantry)
    ["B_T_VTOL_01_vehicle_F",750,0,500]                                     // V-44 X Blackfish (Vehicle)
];

static_vehicles = [
    ["CUP_B_M2StaticMG_US",25,40,0],                                    // M2 Machine Gun
    ["CUP_B_M2StaticMG_MiniTripod_US",25,40,0],                         // M2 Minitripod
    ["CUP_B_TOW_TriPod_US",50,100,0],                                   // TOW Tripod
    ["CUP_WV_B_CRAM",500,500,0],                                        // C-RAM
    ["CUP_WV_B_SS_Launcher",750,500,0],                                 // Mk-29 GMLS
    ["CUP_WV_B_RAM_Launcher",750,750,0],                                // Mk-49 GMLS
    ["B_Mortar_01_F",80,150,0],                                         // Mk6 Mortar
    ["CUP_B_M252_US",80,150,0],                                         // M252 81mm Mortar
    ["CUP_B_M119_US",100,200,0],                                        // M119
    ["CUP_B_L111A1_BAF_DPM",25,40,0],                                   // L111A1 Machine Gun
    ["CUP_B_L111A1_MiniTripod_BAF_DPM",25,40,0],                        // L111A1 Minitripod
    ["CUP_WV_B_CRAM",500,500,0],                                        // C-RAM
    ["CUP_WV_B_SS_Launcher",750,500,0],                                 // Mk-29 GMLS
    ["CUP_WV_B_RAM_Launcher",750,750,0],                                // Mk-49 GMLS
    ["B_Mortar_01_F",80,150,0],                                         // Mk6 Mortar
    ["CUP_B_L16A2_BAF_DPM",80,150,0],                                   // L16A2 81mm Mortar
    ["UK3CB_BAF_Static_L7A2_Deployed_Low_MTP",25,25,0],                     // L7A2 LMG (Low)
    ["UK3CB_BAF_Static_L7A2_Deployed_Mid_MTP",25,25,0],                     // L7A2 LMG (Mid)
    ["UK3CB_BAF_Static_L7A2_Deployed_High_MTP",25,25,0],                    // L7A2 LMG (High)
    ["UK3CB_BAF_Static_L111A1_Deployed_Low_MTP",25,40,0],                   // L111A1 HMG (Low)
    ["UK3CB_BAF_Static_L111A1_Deployed_Mid_MTP",25,40,0],                   // L111A1 HMG (Mid)
    ["UK3CB_BAF_Static_L111A1_Deployed_High_MTP",25,40,0],                  // L111A1 HMG (High)
    ["UK3CB_BAF_Static_L134A1_Deployed_Low_MTP",25,60,0],                   // L134A1 GMG (Low)
    ["UK3CB_BAF_Static_L134A1_Deployed_Mid_MTP",25,60,0],                   // L134A1 GMG (Med)
    ["UK3CB_BAF_Static_L134A1_Deployed_High_MTP",25,60,0],                  // L134A1 GMG (High)
    ["RHS_TOW_TriPod_WD",50,100,0],                                         // TOW (AT)
    ["RHS_Stinger_AA_pod_WD",50,100,0],                                     // Stinger (AA)
    ["UK3CB_BAF_Static_L16_Deployed_MTP",80,150,0],                         // Mk6 Mortar
    ["RHS_M119_WD",100,200,0]                                               // M119A2
];

buildings = [
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["Flag_US_F",0,0,0],
    ["FlagCarrierUSArmy_EP1",0,0,0],
    ["Flag_White_F",0,0,0],
    ["Land_Medevac_house_V1_F",0,0,0],
    ["Land_Medevac_HQ_V1_F",0,0,0],
    ["Flag_RedCrystal_F",0,0,0],
    ["CamoNet_BLUFOR_F",0,0,0],
    ["CamoNet_BLUFOR_open_F",0,0,0],
    ["CamoNet_BLUFOR_big_F",0,0,0],
    ["Land_PortableLight_single_F",0,0,0],
    ["Land_PortableLight_double_F",0,0,0],
    ["Land_LampSolar_F",0,0,0],
    ["Land_LampHalogen_F",0,0,0],
    ["Land_LampStreet_small_F",0,0,0],
    ["Land_LampAirport_F",0,0,0],
    ["Land_HelipadCircle_F",0,0,0],                                     // Strictly aesthetic - as in it does not increase helicopter cap!
    ["Land_HelipadRescue_F",0,0,0],                                     // Strictly aesthetic - as in it does not increase helicopter cap!
    ["PortableHelipadLight_01_blue_F",0,0,0],
    ["PortableHelipadLight_01_green_F",0,0,0],
    ["PortableHelipadLight_01_red_F",0,0,0],
    ["Land_CampingChair_V1_F",0,0,0],
    ["Land_CampingChair_V2_F",0,0,0],
    ["Land_CampingTable_F",0,0,0],
    ["MapBoard_altis_F",0,0,0],
    ["MapBoard_stratis_F",0,0,0],
    ["MapBoard_seismic_F",0,0,0],
    ["Land_Pallet_MilBoxes_F",0,0,0],
    ["Land_PaperBox_open_empty_F",0,0,0],
    ["Land_PaperBox_open_full_F",0,0,0],
    ["Land_PaperBox_closed_F",0,0,0],
    ["Land_DieselGroundPowerUnit_01_F",0,0,0],
    ["Land_ToolTrolley_02_F",0,0,0],
    ["Land_WeldingTrolley_01_F",0,0,0],
    ["Land_Workbench_01_F",0,0,0],
    ["Land_GasTank_01_blue_F",0,0,0],
    ["Land_GasTank_01_khaki_F",0,0,0],
    ["Land_GasTank_01_yellow_F",0,0,0],
    ["Land_GasTank_02_F",0,0,0],
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
    ["Land_BagBunker_Tower_F",0,0,0],
    ["Land_HBarrier_1_F",0,0,0],
    ["Land_HBarrier_3_F",0,0,0],
    ["Land_HBarrier_5_F",0,0,0],
    ["Land_HBarrier_Big_F",0,0,0],
    ["Land_HBarrierWall4_F",0,0,0],
    ["Land_HBarrierWall6_F",0,0,0],
    ["Land_HBarrierWall_corner_F",0,0,0],
    ["Land_HBarrierWall_corridor_F",0,0,0],
    ["Land_HBarrierTower_F",0,0,0],
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
    ["Land_ClutterCutter_large_F",0,0,0],
    ["Land_Boxloader_Pallet_5_Net",0,0,0]
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
    ["USAF_missileCart_W_AGM114",50,150,0],                             // Missile Cart (AGM-114)
    ["USAF_missileCart_AGMMix",50,150,0],                               // Missile Cart (AGM-65 Mix)
    ["USAF_missileCart_AGM1",50,150,0],                                 // Missile Cart (AGM-65D)
    ["USAF_missileCart_AGM2",50,150,0],                                 // Missile Cart (AGM-65E)
    ["USAF_missileCart_AGM3",50,150,0],                                 // Missile Cart (AGM-65K)
    ["USAF_missileCart_AA1",50,150,0],                                  // Missile Cart (AIM-9M/AIM-120)
    ["USAF_missileCart_AA2",50,150,0],                                  // Missile Cart (AIM-9X/AIM-120)
    ["USAF_missileCart_GBU12_green",50,150,0],                          // Missile Cart (GBU12 Green)
    ["USAF_missileCart_GBU12_maritime",50,150,0],                       // Missile Cart (GBU12 Maritime)
    ["USAF_missileCart_GBU12",50,150,0],                                // Missile Cart (GBU12)
    ["USAF_missileCart_Gbu31",50,150,0],                                // Missile Cart (GBU31)
    ["USAF_missileCart_GBU39",50,150,0],                                // Missile Cart (GBU39)
    ["USAF_missileCart_Mk82",50,150,0],                                 // Missile Cart (Mk82)
    ["CUP_B_TowingTractor_USA",50,0,75],                                // Towing Tractor
    ["CUP_B_MTVR_Repair_USMC",425,0,75],                                // MTVR Repair
    ["CUP_B_MTVR_Refuel_USMC",125,0,375],                               // MTVR Refuel
    ["CUP_B_MTVR_Ammo_USMC",125,300,75],                                // MTVR Ammo
    ["B_Slingload_01_Repair_F",375,0,0],                                // Huron Repair
    ["B_Slingload_01_Fuel_F",75,0,300],                                 // Huron Fuel
    ["B_Slingload_01_Ammo_F",75,300,0],                                 // Huron Ammo
    ["CUP_B_MK10_GB",100,0,50],                                         // LCU Mk.10
    ["CUP_B_TowingTractor_GB",50,0,25],                                 // Towing Tractor
    ["CUP_B_MTVR_Repair_BAF_WOOD",425,0,75],                            // MTVR Repair
    ["CUP_B_MTVR_Refuel_BAF_WOOD",125,0,375],                           // MTVR Refuel
    ["CUP_B_MTVR_Ammo_BAF_WOOD",125,300,75],                            // MTVR Ammo
    ["UK3CB_BAF_Box_WpsStatic",300,300,0],
    ["UK3CB_BAF_Box_L16_Ammo",0,0,0],
    ["UK3CB_BAF_Box_M6_Ammo",0,0,0],
    ["B_APC_Tracked_01_CRV_F",500,250,350],                                 // CRV-6e Bobcat
    ["rhsusf_M977A4_REPAIR_BKIT_usarmy_wd",325,0,75],                       // M977A4 Repair
    ["rhsusf_M978A4_BKIT_usarmy_wd",125,0,275],                             // M978A4 Fuel
    ["rhsusf_M977A4_AMMO_BKIT_usarmy_wd",125,200,75]                       // M977A4 Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "CUP_B_US_Soldier_SL",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier_LAT",
    "CUP_B_US_Soldier_GL",
    "CUP_B_US_Soldier_AR",
    "CUP_B_US_Soldier_AR",
    "CUP_B_US_Soldier_Marksman",
    "CUP_B_US_Medic",
    "CUP_B_US_Engineer"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "CUP_B_US_Soldier_SL",
    "CUP_B_US_Soldier_LAT",
    "CUP_B_US_Soldier_LAT",
    "CUP_B_US_Soldier_GL",
    "CUP_B_US_Soldier_AR",
    "CUP_B_US_Soldier_AR",
    "CUP_B_US_Soldier_MG",
    "CUP_B_US_Soldier_Marksman",
    "CUP_B_US_Medic",
    "CUP_B_US_Engineer"
];

// AT specialists squad.
blufor_squad_at = [
    "CUP_B_US_Soldier_SL",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier_HAT",
    "CUP_B_US_Soldier_AT",
    "CUP_B_US_Soldier_AT",
    "CUP_B_US_Medic",
    "CUP_B_US_Soldier"
];

// AA specialists squad.
blufor_squad_aa = [
    "CUP_B_US_Soldier_SL",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier_AA",
    "CUP_B_US_Soldier_AA",
    "CUP_B_US_Soldier_AA",
    "CUP_B_US_Medic",
    "CUP_B_US_Soldier"
];

// Force recon squad.
blufor_squad_recon = [
    "CUP_B_US_SpecOps_TL",
    "CUP_B_US_SpecOps",
    "CUP_B_US_SpecOps_Assault",
    "CUP_B_US_SpecOps_MG",
    "CUP_B_US_SpecOps_JTAC",
    "CUP_B_US_SpecOps_M14",
    "CUP_B_US_SpecOps_M",
    "CUP_B_US_SpecOps_M",
    "CUP_B_US_SpecOps_Medic",
    "CUP_B_US_SpecOps_UAV"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier",
    "CUP_B_US_Soldier"
];


// Light infantry squad.
german_squad_inf_light = [
    "CUP_B_GER_BW_Fleck_Soldier_TL",
    "CUP_B_GER_BW_Fleck_Soldier_GL",
    "CUP_B_GER_BW_Fleck_Medic",
    "CUP_B_GER_BW_Fleck_Soldier_MG3",
    "CUP_B_GER_BW_Fleck_Soldier_AT",
    "CUP_B_GER_BW_Fleck_Soldier_AAT",
    "CUP_B_GER_BW_Fleck_Soldier_Marksman",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier_Ammo"
];

// Heavy infantry squad.
german_squad_inf = [
    "CUP_B_GER_BW_Fleck_Soldier_TL",
    "CUP_B_GER_BW_Fleck_Soldier_MG3",
    "CUP_B_GER_BW_Fleck_Soldier_TL",
    "CUP_B_GER_BW_Fleck_Soldier_AT",
    "CUP_B_GER_BW_Fleck_Soldier_GL",
    "CUP_B_GER_BW_Fleck_Soldier_Ammo",
    "CUP_B_GER_BW_Fleck_Soldier_AAT",
    "CUP_B_GER_BW_Fleck_Soldier_Ammo",
    "CUP_B_GER_BW_Fleck_Soldier_MG3",
    "CUP_B_GER_BW_Fleck_Medic",
    "CUP_B_GER_BW_Fleck_Soldier_GL"

];
// AT specialists squad.
german_squad_at = [
    "CUP_B_GER_BW_Fleck_Soldier_TL",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Medic",
    "CUP_B_GER_BW_Fleck_Soldier_AT",
    "CUP_B_GER_BW_Fleck_Soldier_AAT",
    "CUP_B_GER_BW_Fleck_Soldier_AT",
    "CUP_B_GER_BW_Fleck_Soldier_AAT"
];

// AA specialists squad.
german_squad_aa = [
    "CUP_B_GER_BW_Fleck_Soldier_TL",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Medic",
    "CUP_B_GER_BW_Fleck_Soldier_AA",
    "CUP_B_GER_BW_Fleck_Soldier_AAA",
    "CUP_B_GER_BW_Fleck_Soldier_AA",
    "CUP_B_GER_BW_Fleck_Soldier_AAA"
];

// Force recon squad.
german_squad_recon = [
    "CUP_B_GER_Fleck_Operator_TL",
    "CUP_B_GER_Fleck_Operator_GL",
    "CUP_B_GER_Fleck_Operator_Medic",
    "CUP_B_GER_Fleck_Operator_EXP",
    "CUP_B_GER_Fleck_Operator_GL",
    "CUP_B_GER_Fleck_Operator_EXP",
    "CUP_B_GER_Fleck_Operator",
    "CUP_B_GER_Fleck_Operator"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
german_squad_para = [
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier",
    "CUP_B_GER_BW_Fleck_Soldier"
];

// Light infantry squad.
british_squad_inf_light = [
    "CUP_B_BAF_Soldier_TeamLeader_DPM",
    "CUP_B_BAF_Soldier_Rifleman_DPM",
    "CUP_B_BAF_Soldier_Rifleman_DPM",
    "CUP_B_BAF_Soldier_RiflemanLAT_DPM",
    "CUP_B_BAF_Soldier_Grenadier_DPM",
    "CUP_B_BAF_Soldier_AutoRifleman_DPM",
    "CUP_B_BAF_Soldier_AutoRifleman_DPM",
    "CUP_B_BAF_Soldier_Marksman_DPM",
    "CUP_B_BAF_Soldier_Medic_DPM",
    "CUP_B_BAF_Soldier_Engineer_DPM"
];

// Heavy infantry squad.
british_squad_inf = [
    "CUP_B_BAF_Soldier_TeamLeader_DPM",
    "CUP_B_BAF_Soldier_RiflemanLAT_DPM",
    "CUP_B_BAF_Soldier_RiflemanLAT_DPM",
    "CUP_B_BAF_Soldier_Grenadier_DPM",
    "CUP_B_BAF_Soldier_AutoRifleman_DPM",
    "CUP_B_BAF_Soldier_AutoRifleman_DPM",
    "CUP_B_BAF_Soldier_HeavyGunner_DPM",
    "CUP_B_BAF_Soldier_SharpShooter_DPM",
    "CUP_B_BAF_Soldier_Medic_DPM",
    "CUP_B_BAF_Soldier_Engineer_DPM"
];

// AT specialists squad.
british_squad_at = [
    "CUP_B_BAF_Soldier_TeamLeader_DPM",
    "CUP_B_BAF_Soldier_Rifleman_DPM",
    "CUP_B_BAF_Soldier_Rifleman_DPM",
    "CUP_B_BAF_Soldier_AT_DPM",
    "CUP_B_BAF_Soldier_AT_DPM",
    "CUP_B_BAF_Soldier_AT_DPM",
    "CUP_B_BAF_Soldier_Medic_DPM",
    "CUP_B_BAF_Soldier_Rifleman_DPM"
];

// AA specialists squad.
british_squad_aa = [
    "CUP_B_BAF_Soldier_TeamLeader_DPM",
    "CUP_B_BAF_Soldier_Rifleman_DPM",
    "CUP_B_BAF_Soldier_Rifleman_DPM",
    "CUP_B_BAF_Soldier_AA_DPM",
    "CUP_B_BAF_Soldier_AA_DPM",
    "CUP_B_BAF_Soldier_AA_DPM",
    "CUP_B_BAF_Soldier_Medic_DPM",
    "CUP_B_BAF_Soldier_Rifleman_DPM"
];

// Force recon squad.
british_squad_recon = [
    "CUP_B_BAF_Soldier_TeamLeader_MTP",
    "CUP_B_BAF_Soldier_Rifleman_MTP",
    "CUP_B_BAF_Soldier_Rifleman_MTP",
    "CUP_B_BAF_Soldier_RiflemanLAT_MTP",
    "CUP_B_BAF_Soldier_Marksman_MTP",
    "CUP_B_BAF_Soldier_Marksman_MTP",
    "CUP_B_BAF_Soldier_SharpShooter_MTP",
    "CUP_B_BAF_Soldier_SharpShooter_MTP",
    "CUP_B_BAF_Soldier_Medic_MTP",
    "CUP_B_BAF_Soldier_Explosive_MTP"
];

// Paratroopers squad.
british_squad_para = [
    "CUP_B_BAF_Soldier_Paratrooper_DPM",
    "CUP_B_BAF_Soldier_Paratrooper_DPM",
    "CUP_B_BAF_Soldier_Paratrooper_DPM",
    "CUP_B_BAF_Soldier_Paratrooper_DPM",
    "CUP_B_BAF_Soldier_Paratrooper_DPM",
    "CUP_B_BAF_Soldier_Paratrooper_DPM",
    "CUP_B_BAF_Soldier_Paratrooper_DPM",
    "CUP_B_BAF_Soldier_Paratrooper_DPM",
    "CUP_B_BAF_Soldier_Paratrooper_DPM",
    "CUP_B_BAF_Soldier_Paratrooper_DPM"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "CUP_WV_B_CRAM",                                                    // C-RAM
    "CUP_WV_B_SS_Launcher",                                             // Mk-29 GMLS
    "CUP_WV_B_RAM_Launcher",                                            // Mk-49 GMLS
    "CUP_B_A10_DYN_USA",                                                // A-10A Thunderbolt II
    "USAF_MQ9",                                                         // MQ-9 Reaper
    "USAF_A10",                                                         // A-10C Thunderbolt II
    "USAF_F22",                                                         // F-22A Raptor
    "USAF_F22_EWP_AA",                                                  // F-22A Raptor (EWP-AA)
    "USAF_F22_EWP_AG",                                                  // F-22A Raptor (EWP-AG)
    "USAF_F22_Heavy",                                                   // F-22A Raptor (Heavy)
    "USAF_F35A_STEALTH",                                                // F-35A Lightning II
    "USAF_F35A",                                                        // F-35A Lightning II (Heavy)
    "CUP_B_AH64D_DL_USA",                                               // AH-64D
    "CUP_B_MH60L_DAP_2x_US",                                            // MH-60L DAP (2 Stores)
    "CUP_B_MH60L_DAP_4x_US",                                            // MH-60L DAP (4 Stores)
    "CUP_B_M1A1_Woodland_US_Army",                                      // M1A1 Abrams (Woodland)
    "CUP_B_M1A2_TUSK_MG_US_Army",                                       // M1A2 Abrams TUSK (Woodland)
    "CUP_B_M270_HE_USA",                                                // M270 MLRS (HE)
    "CUP_B_M270_DPICM_USA",                                             // M270 MLRS (DPICM)
    "CUP_B_M6LineBacker_USA_W",                                         // M6 Linebacker (Woodland)
    "CUP_B_M163_USA",                                                   // M163A1 VADS
    "CUP_B_M1128_MGS_Woodland_Slat",                                    // M1128 MGS (Woodland - Slat)
    "CUP_B_M1135_ATGMV_Woodland_Slat",                                  // M1135 ATGMV (Woodland - Slat)
    "CUP_B_M1129_MC_MK19_Woodland_Slat",                                // M1129 MC MK19 CROWS (Woodland - Slat)
    "CUP_B_M2A3Bradley_USA_W",                                          // M2A3 ERA Bradley IFV (Woodland)
    "CUP_B_M119_US",                                                    // M119
    "CUP_B_RG31E_M2_USA",                                               // RG-31 Mk5E M2
    "CUP_B_RG31_Mk19_USA",                                              // RG-31 Mk.19
    "CUP_B_MCV80_GB_W_SLAT",                                            // MCV-80 Warrior (SLAT - Woodland)
    "CUP_B_FV432_Mortar",                                               // FV432 Mortar
    "CUP_B_FV510_GB_W",                                                 // FV510 Warrior (Woodland)
    "CUP_B_FV510_GB_W_SLAT",                                            // FV510 Warrior (SLAT - Woodland)
    "CUP_B_Challenger2_Woodland_BAF",                                   // FV4034 Challenger 2 (Woodland)
    "CUP_B_Challenger2_2CW_BAF",                                        // FV4034 Challenger 2 (Two-Color Woodland)
    "CUP_B_AH1_DL_BAF",                                                 // AH1
    "CUP_B_F35B_BAF",                                                   // F-35B Lightning II
    "CUP_B_F35B_Stealth_BAF",                                           // F-35B Lightning II (Stealth)
    "CUP_WV_B_CRAM",                                                    // C-RAM
    "CUP_WV_B_SS_Launcher",                                             // Mk-29 GMLS
    "CUP_WV_B_RAM_Launcher",                                             // Mk-49 GMLS,
    "CUP_B_Leopard2A6_GER",
    "Cre8ive_PandurII_W"
];
