
#define FACTION opfor

BEGIN_LOADOUTS;


/*

    Gearscript configuration - OPFOR faction.

    Instructions on how to use this file can be found in the "gearscript_readme.txt" file.
    Commands are described in the "gearscript_readme.txt" file.  They are repeated here without the descriptions for your convenience.

    -------------------------------------------------

    Available commands FOR UNIT LOADOUTS:

    CREATE_LOADOUT(UNIT_NAME,<ACE Arsenal code> OR <unit class-name>);
    COPY_LOADOUT(TO,FROM);

    ADD_HAT(UNIT_NAME,"Hat Classname");
    ADD_UNIFORM(UNIT_NAME,"Uniform Classname");
    ADD_VEST(UNIT_NAME,"Vest Classname");
    ADD_BACKPACK(UNIT_NAME,"Backpack Classname");

    COPY_ADDONS(TO,FROM);

    CLEAR_HATS(UNIT_NAME);
    CLEAR_UNIFORM(UNIT_NAME);
    CLEAR_VEST(UNIT_NAME);
    CLEAR_BACKPACK(UNIT_NAME);

    CLEAR_ADDONS(UNIT_NAME);

    ADD_VARIANT(UNIT_NAME,<ACE Arsenal code> OR <unit class-name>);

    -------------------------------------------------

    Available commands for editing UNIT LOADOUTS:
    (These commands can cause OVERLOADED LOADOUTS)

    ADD_ITEM_TO_UNIFORM(UNIT_NAME,"Item Name");
    ADD_ITEMS_TO_UNIFORM(UNIT_NAME,"Item Name",AMOUNT);

    ADD_ITEM_TO_VEST(UNIT_NAME,"Item Name");
    ADD_ITEMS_TO_VEST(UNIT_NAME,"Item Name",AMOUNT);

    ADD_ITEM_TO_BACKPACK(UNIT_NAME,"Item Name");
    ADD_ITEMS_TO_BACKPACK(UNIT_NAME,"Item Name",AMOUNT);

    REMOVE_ITEM_FROM_LOADOUT(UNIT_NAME,"Item Name");

    ADD_MAP(UNIT_NAME);
    REMOVE_MAP(UNIT_NAME);

    ADD_GPS(UNIT_NAME);
    ADD_TERMINAL(UNIT_NAME,"Item Name");
    REMOVE_TERMINAL(UNIT_NAME);

    ADD_COMPASS(UNIT_NAME);
    REMOVE_COMPASS(UNIT_NAME);

    ADD_WATCH(UNIT_NAME);
    ADD_WATCH_ITEM(UNIT_NAME,"Item Name");
    REMOVE_WATCH(UNIT_NAME);

    ADD_NVG(UNIT_NAME,"Item Name");
    REMOVE_NVG(UNIT_NAME);
    
    -------------------------------------------------

    Available commands FOR RE-SUPPLY CRATES:

    CREATE_CRATE(NAME);

    ADD_ITEMS_TO_CRATE(CRATE,"Item Name",AMOUNT);

    ADD_RIFLE_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_RIFLE_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_RIFLE_GRENADES_TO_CRATE(CRATE,NAME,AMOUNT);

    ADD_PISTOL_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_PISTOL_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);

    ADD_LAUNCHER_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_LAUNCHER_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);

    ADD_BANDAGES_TO_CRATE(CRATE,AMOUNT);
    ADD_SPLINTS_TO_CRATE(CRATE,AMOUNT);
    ADD_MEDS_TO_CRATE(CRATE,AMOUNT);
    ADD_BLOOD_TO_CRATE(CRATE,AMOUNT);

    ADD_BACKPACKS_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);

    FINALIZE_CRATE(NAME);

    -------------------------------------------------

    INFO: All lines should end with a semi-colon (;).  When copy-pasting and adding new commands, make sure you do not accidentally delete or forget to add semi-colons.
    For examples on how to use the gearscript system, see the "gear_blufor.sqf" file for a default "NATO 2035" loadout.  There are extra details in that file to explain things.

*/


// Rifleman Loadout

_baseLoadout = [[["CUP_arifle_AKM_Early","","","",["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",30],[],""],[],[],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",8,30],["CUP_HandGrenade_RGD5",4,1],["SmokeShell",2,1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",2,30]]],[],"CUP_H_RUS_SSH68_green","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(rif,_baseLoadout);

ADD_UNIFORM(rif,"U_I_C_Soldier_Para_3_F");  
ADD_UNIFORM(rif,"U_I_C_Soldier_Para_5_F");  // Add a random uniform or t-shirt.
ADD_UNIFORM(rif,"U_I_C_Soldier_Para_4_F");  // Add a random uniform or t-shirt.
ADD_UNIFORM(rif,"U_I_C_Soldier_Para_2_F");  // Units are twice as likely to have a uniform than a t-shirt because this line has been copied.

ADD_HAT(rif,""); // Add a random helmet to all riflemen.
ADD_HAT(rif,"CUP_H_RUS_SSH68_olive"); // Add a random helmet to all riflemen.
ADD_HAT(rif,"cwr3_i_headgear_beanie_od");
ADD_HAT(rif,"cwr3_i_headgear_beanie_khaki");
ADD_HAT(rif,""); // Add a random helmet to all riflemen.
ADD_HAT(rif,""); // Add a random helmet to all riflemen.
ADD_HAT(rif,"CUP_H_RUS_SSH68_olive"); // Add a random helmet to all riflemen.


// Commander Loadout

_baseLoadout = [[["CUP_arifle_AKM_Early","","","",["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",30],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",17],[],""],["CUP_U_O_RUS_Flora_3",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["SmokeShell",2,1],["SmokeShellBlue",1,1],["SmokeShellRed",1,1],["CUP_8Rnd_9x18_Makarov_M",3,17],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",2,30],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",4,30]]],["CUP_B_HikingPack_Civ",[["",1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",2,30],["CUP_HandGrenade_RGD5",2,1]]],"H_MilCap_ocamo","G_Aviator",["Rangefinder","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [[["CUP_arifle_AKM_Early","","","CUP_optic_Kobra",["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",30],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["CUP_HandGrenade_RGD5",1,1],["1Rnd_HE_Grenade_shell",6,1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",6,30],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",2,30]]],[],"CUP_H_RUS_SSH68_green","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);

// Surgeon Loadout (Has PAK)

_baseLoadout = [[["CUP_arifle_AKM_Early","","","",["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",30],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",17],[],""],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["CUP_HandGrenade_RGD5",1,1],["SmokeShell",10,1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",6,30],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",2,30],["CUP_8Rnd_9x18_Makarov_M",2,17]]],["CUP_B_HikingPack_Civ",[["ACE_morphine",10],["ACE_epinephrine",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_adenosine",5],["ACE_splint",10],["ACE_tourniquet",8],["FSGm_ItemMedicBag",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1],["ACE_quikclot",5],["ACE_personalAidKit",1],["ACE_bloodIV",8],["ACE_bloodIV_500",8]]],"CUP_H_RUS_SSH68_green","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(sur,_baseLoadout);
COPY_ADDONS(sur,rif);

// Medic Loadout (No PAK)

_baseLoadout = [[["CUP_arifle_AKM_Early","","","",["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",30],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",17],[],""],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",6,1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",6,30],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",2,30],["CUP_8Rnd_9x18_Makarov_M",2,17]]],["CUP_B_HikingPack_Civ",[["ACE_morphine",8],["ACE_epinephrine",8],["ACE_fieldDressing",10],["ACE_packingBandage",15],["ACE_elasticBandage",25],["ACE_adenosine",5],["ACE_splint",6],["ACE_tourniquet",6],["FSGm_ItemMedicBag",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1],["ACE_salineIV",8],["ACE_salineIV_500",8],["ACE_quikclot",5]]],"CUP_H_RUS_SSH68_green","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];
CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Combat Lifeasser Loadout

_baseLoadout = [[["CUP_arifle_AKM_Early","","","",["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",30],[],""],[],[],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",6,1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",8,30],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",2,30]]],["CUP_B_HikingPack_Civ",[["ACE_morphine",4],["ACE_epinephrine",4],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_splint",4],["ACE_tourniquet",4],["ACE_adenosine",2],["ACE_salineIV",4],["ACE_salineIV_500",4],["ACE_quikclot",5]]],"CUP_H_RUS_SSH68_green","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(cls,_baseLoadout);
COPY_ADDONS(cls,rif);


// Autorifleman Loadout

_baseLoadout = [[["CUP_lmg_Pecheneg","","","",["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",150],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",17],[],""],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",2,150]]],["CUP_B_HikingPack_Civ",[["ACE_SpareBarrel",1,1],["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",2,150],["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",1,150]]],"CUP_H_RUS_SSH68_green","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [[["CUP_arifle_AKM_Early","","","",["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",30],[],""],[],[],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["ACE_salineIV",1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",6,30],["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",6,30]]],["CUP_B_HikingPack_Civ",[["ACE_EntrenchingTool",1],["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",1,150],["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",3,150]]],"CUP_H_RUS_SSH68_green","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);


// Light anti-tank Loadout

_baseLoadout = [[["CUP_arifle_AKM_Early","","","",["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",30],[],""],["launch_RPG7_F","","","",["RPG7_F",1],[],""],[],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["ACE_salineIV",1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",8,30],["CUP_HandGrenade_RGD5",2,1],["SmokeShell",2,1],["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",2,30]]],["CUP_B_RPGPack_Khaki",[["CUP_PG7V_M",3,1]]],"CUP_H_RUS_SSH68_green","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [[["CUP_srifle_SVD","","","CUP_optic_PSO_1",["CUP_10Rnd_762x54_SVD_M",10],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",8],[],""],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_uk_vest_58webbing_belt",[["CUP_HandGrenade_RGD5",2,1],["SmokeShell",4,1],["CUP_10Rnd_762x54_SVD_M",12,10],["CUP_8Rnd_9x18_Makarov_M",2,8]]],[],"CUP_H_RUS_SSH68_green","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Crewman Loadout

_baseLoadout = [["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK74_plum_M",30],[],""],[],[],["U_I_C_Soldier_Para_3_F",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["CUP_V_RUS_6B3_3",[["SmokeShell",4,1],["SmokeShellBlue",1,1],["SmokeShellRed",1,1],["30Rnd_9x21_Mag",4,30]]],["CUP_B_HikingPack_Civ",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"CUP_H_RUS_TSH_4_Brown","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(crew,_baseLoadout);


// Engineer/logi Loadout

_baseLoadout = [[["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK74_plum_M",30],[],""],[],["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M",17],[],""],["CUP_U_O_RUS_Flora_2_VDV",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["CUP_V_RUS_6B3_3",[["CUP_HandGrenade_RGD5",4,1],["SmokeShell",4,1],["CUP_30Rnd_545x39_AK74_plum_M",5,30],["CUP_30Rnd_TE1_Green_Tracer_545x39_AK74_plum_M",2,30],["CUP_8Rnd_9x18_Makarov_M",1,17],["ACE_M14",2,1]]],["CUP_B_HikingPack_Civ",[["ToolKit",1],["ACE_EntrenchingTool",1],["ACE_Clacker",1],["MineDetector",1],["ACE_DefusalKit",1],["ACE_wirecutter",1]]],"CUP_H_RUS_SSH68_green","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(eng,_baseLoadout);

// Zeus

_baseLoadout = [[["srifle_GM6_F","","","optic_LRPS",["5Rnd_127x108_APDS_Mag",5],[],""],[],["hgun_Pistol_heavy_02_F","","acc_flashlight_pistol","ef_optic_microsight",["6Rnd_45ACP_Cylinder",6],[],""],["U_O_CombatUniform_oucamo",[["ACRE_PRC148",1],["ACRE_PRC152",1],["ACE_Banana",1]]],["V_PlateCarrier1_blk",[["ACE_Banana",1],["ACE_CableTie",10],["5Rnd_127x108_APDS_Mag",5,5],["5Rnd_127x108_Mag",2,5],["6Rnd_45ACP_Cylinder",5,6]]],["B_FieldPack_oucamo",[["ACE_Banana",1],["ACE_UAVBattery",1],["ACE_EntrenchingTool",1],["ACE_DefusalKit",1],["ToolKit",1],["ACE_wirecutter",1],["CUP_HandGrenade_RGD5",4,1]]],"H_HelmetO_oucamo","G_Lowprofile",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles_INDEP"]],[]];

CREATE_LOADOUT(zeus,_baseLoadout);
COPY_ADDONS(zeus,rif);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,rif,2);
ADD_LAUNCHER_AMMO_TO_CRATE(small,lat,2);
ADD_PISTOL_TO_CRATE(small,rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,rif,8);
ADD_RIFLE_AMMO_TO_CRATE(small,rif,40);
ADD_RIFLE_AMMO_TO_CRATE(small,ar,8);
ADD_RIFLE_AMMO_TO_CRATE(small,mk,12);
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2);
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,15);

ADD_ITEMS_TO_CRATE(small,"CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",15);
ADD_ITEMS_TO_CRATE(small,"ACE_10Rnd_762x54_Tracer_mag",12);
ADD_ITEMS_TO_CRATE(small,"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",4);

ADD_ITEMS_TO_CRATE(small,"1Rnd_HE_Grenade_shell",15);
ADD_ITEMS_TO_CRATE(small,"1Rnd_Smoke_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(small,"1Rnd_SmokeRed_Grenade_shell",5);
ADD_ITEMS_TO_CRATE(small,"1Rnd_SmokeBlue_Grenade_shell",5);

ADD_ITEMS_TO_CRATE(small,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(small,"CUP_HandGrenade_RGD5",8);
ADD_ITEMS_TO_CRATE(small,"ACE_SpareBarrel",1);

ADD_BANDAGES_TO_CRATE(small,40);
ADD_SPLINTS_TO_CRATE(small,30);
ADD_MEDS_TO_CRATE(small,30);
ADD_BLOOD_TO_CRATE(small,15);

ADD_BACKPACKS_TO_CRATE(small,rif,2);

ADD_ITEMS_TO_CRATE(small,"ACRE_PRC343",6);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC152",2);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC148",2);
ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,rif,4);
ADD_LAUNCHER_TO_CRATE(med,lat,1);
ADD_LAUNCHER_AMMO_TO_CRATE(med,lat,4);
ADD_PISTOL_TO_CRATE(med,rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,ar,12);
ADD_RIFLE_AMMO_TO_CRATE(med,mk,24);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);
ADD_RIFLE_GRENADES_TO_CRATE(med,ftl,30);

ADD_ITEMS_TO_CRATE(med,"CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",20);
ADD_ITEMS_TO_CRATE(med,"ACE_10Rnd_762x54_Tracer_mag",24);
ADD_ITEMS_TO_CRATE(med,"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",6);

ADD_ITEMS_TO_CRATE(med,"1Rnd_Smoke_Grenade_shell",20);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeRed_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeBlue_Grenade_shell",10);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",15);

ADD_ITEMS_TO_CRATE(med,"CUP_HandGrenade_RGD5",15);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",25);

ADD_BANDAGES_TO_CRATE(med,80);
ADD_SPLINTS_TO_CRATE(med,40);
ADD_MEDS_TO_CRATE(med,50);
ADD_BLOOD_TO_CRATE(med,30);

ADD_BACKPACKS_TO_CRATE(med,rif,4);

ADD_ITEMS_TO_CRATE(med,"ACRE_PRC343",12);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC152",4);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC148",4);
ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);


// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,rif);
