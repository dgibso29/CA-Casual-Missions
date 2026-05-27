
#define FACTION blufor

BEGIN_LOADOUTS;


/*

    Gearscript configuration - BLUFOR faction.

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

    PUT_GUN_IN_GUNBAG(UNIT_NAME,FULL ACE ARSENAL EXPORT);

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
    For examples on how to use the gearscript system, see below for a default "NATO 2035" loadout.  There are extra details in comments below to explain things.

*/



// Rifleman Loadout

_baseLoadout = [[["CUP_arifle_M16A2","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],[],[],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland",[["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",7,30],["CUP_HandGrenade_M67",3,1],["CUP_30Rnd_556x45_Stanag_Tracer_Red",2,30]]],[],"cwr3_b_headgear_pasgt_m81_woodland","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(rif,_baseLoadout);   // Riflemen will now have the loadout from the line above.

ADD_UNIFORM(rif,"cwr3_b_uniform_m81_woodland_gloves");  // Add a random uniform or t-shirt.
ADD_UNIFORM(rif,"cwr3_b_uniform_m81_woodland");  // Units are twice as likely to have a uniform than a t-shirt because this line has been copied.

ADD_HAT(rif,"cwr3_b_headgear_pasgt_m81_woodland"); // Add a random helmet to all riflemen.
ADD_HAT(rif,"cwr3_b_headgear_pasgt_m81_woodland_goggles"); // Add a random helmet to all riflemen.
ADD_HAT(rif,"cwr3_b_headgear_pasgt_m81_woodland"); // Add a random helmet to all riflemen.


// Commander Loadout

_baseLoadout = [[["CUP_arifle_Colt727","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],[],["CUP_hgun_M9","","","",["CUP_15Rnd_9x19_M9",15],[],""],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland_officer",[["SmokeShell",2,1],["CUP_HandGrenade_M67",3,1],["CUP_30Rnd_556x45_Stanag",3,30],["CUP_30Rnd_556x45_Stanag_Tracer_Red",4,30],["CUP_15Rnd_9x19_M9",3,15]]],[],"cwr3_b_headgear_pasgt_m81_woodland_2lt","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(co,_baseLoadout);

// XO Loadout

_baseLoadout = [[["CUP_arifle_Colt727","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],[],["CUP_hgun_M9","","","",["CUP_15Rnd_9x19_M9",15],[],""],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland_light",[["SmokeShell",2,1],["CUP_HandGrenade_M67",3,1],["CUP_30Rnd_556x45_Stanag",3,30],["CUP_30Rnd_556x45_Stanag_Tracer_Red",4,30],["CUP_15Rnd_9x19_M9",3,15]]],[],"cwr3_b_headgear_pasgt_m81_woodland_goggles","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(xo,_baseLoadout);


// Forward Air Controller Loadout

_baseLoadout = [[["CUP_arifle_Colt727_M203","","","",["CUP_30Rnd_556x45_Stanag",30],["CUP_1Rnd_HE_M203",1],""],[],[],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland_gl",[["SmokeShell",2,1],["CUP_HandGrenade_M67",3,1],["CUP_30Rnd_556x45_Stanag",3,30],["CUP_30Rnd_556x45_Stanag_Tracer_Red",6,30],["CUP_1Rnd_HE_M203",7,1],["CUP_1Rnd_HEDP_M203",4,1],["CUP_FlareRed_M203",2,1],["CUP_FlareGreen_M203",2,1],["CUP_1Rnd_SmokeRed_M203",4,1],["CUP_1Rnd_Smoke_M203",2,1],["CUP_1Rnd_SmokeGreen_M203",2,1]]],["cwr3_b_backpack_radio",[]],"cwr3_b_headgear_pasgt_m81_woodland_goggles_early","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(fac,_baseLoadout);

// Fireteam lead Loadout

_baseLoadout = [[["CUP_arifle_M16A2_GL","","","",["CUP_30Rnd_556x45_Stanag",30],["CUP_1Rnd_HE_M203",1],""],[],[],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland_gl",[["SmokeShell",2,1],["CUP_HandGrenade_M67",3,1],["CUP_30Rnd_556x45_Stanag",6,30],["CUP_30Rnd_556x45_Stanag_Tracer_Red",4,30],["CUP_1Rnd_HE_M203",10,1],["CUP_1Rnd_HEDP_M203",4,1],["CUP_1Rnd_SmokeRed_M203",2,1],["CUP_1Rnd_Smoke_M203",4,1],["CUP_FlareRed_M203",2,1],["CUP_FlareGreen_M203",2,1]]],[],"cwr3_b_headgear_pasgt_m81_woodland","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);   // FTLs will now get the random uniforms and hats from the Rifleman class.


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);   // SLs will be identical to FTLs.  Because FTLs get the random Rifleman stuff, SLs will get it too.

// Surgeon Loadout (Has PAK)

_baseLoadout = [[["CUP_arifle_M16A2","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],[],["CUP_hgun_M9","","","",["CUP_15Rnd_9x19_M9",17],[],""],["cwr3_b_uniform_m81_woodland",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland_medic",[["CUP_HandGrenade_M67",1,1],["SmokeShell",10,1],["CUP_30Rnd_556x45_Stanag_Tracer_Red",6,30],["CUP_30Rnd_556x45_Stanag_Tracer_Red",2,30],["CUP_15Rnd_9x19_M9",2,17]]],["cwr3_b_backpack_alice_medic",[["ACE_morphine",10],["ACE_epinephrine",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_adenosine",5],["ACE_splint",10],["ACE_tourniquet",8],["FSGm_ItemMedicBag",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1],["ACE_quikclot",5],["ACE_personalAidKit",1],["ACE_bloodIV",8],["ACE_bloodIV_500",8]]],"H_HelmetB_snakeskin","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[]];


CREATE_LOADOUT(sur,_baseLoadout);
COPY_ADDONS(sur,rif);

// Medic Loadout (No PAK)

_baseLoadout = [[["CUP_arifle_M16A2","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],[],["CUP_hgun_M9","","","",["CUP_15Rnd_9x19_M9",17],[],""],["cwr3_b_uniform_m81_woodland",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland_medic",[["CUP_HandGrenade_M67",1,1],["SmokeShell",10,1],["CUP_30Rnd_556x45_Stanag_Tracer_Red",6,30],["CUP_30Rnd_556x45_Stanag_Tracer_Red",2,30],["CUP_15Rnd_9x19_M9",2,17]]],["cwr3_b_backpack_alice_medic",[["ACE_morphine",8],["ACE_epinephrine",8],["ACE_packingBandage",15],["ACE_elasticBandage",25],["ACE_adenosine",5],["ACE_splint",6],["ACE_tourniquet",6],["FSGm_ItemMedicBag",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1],["ACE_quikclot",5],["ACE_salineIV",8],["ACE_salineIV_500",8],["ACE_fieldDressing",10],["SmokeShell",4,1]]],"H_HelmetB_snakeskin","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[]];


CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Combat Lifefacer Loadout

_baseLoadout = [[["CUP_arifle_M16A2","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],[],[],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland_medic",[["CUP_HandGrenade_M67",2,1],["CUP_30Rnd_556x45_Stanag",2,30],["CUP_30Rnd_556x45_Stanag",8,30],["SmokeShell",4,1]]],["cwr3_b_backpack_alice_medic",[["ACE_morphine",4],["ACE_epinephrine",4],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_adenosine",2],["ACE_splint",4],["ACE_tourniquet",4],["ACE_surgicalKit",1],["ACE_quikclot",5],["ACE_salineIV_500",4],["ACE_salineIV",4],["SmokeShell",4,1]]],"H_HelmetB_snakeskin","",[],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(cls,_baseLoadout);
COPY_ADDONS(cls,rif);


// Autorifleman Loadout

_baseLoadout = [[["CUP_lmg_M249_E2","","","",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",200],[],""],[],["CUP_hgun_M9","","","",["CUP_15Rnd_9x19_M9",15],[],""],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland_mg",[["CUP_HandGrenade_M67",2,1],["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",3,200],["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",1,200],["SmokeShell",2,1],["CUP_15Rnd_9x19_M9",2,15]]],[],"H_HelmetB_snakeskin","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [[["CUP_arifle_M16A2","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],[],[],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_alice_woodland",[["CUP_HandGrenade_M67",3,1],["CUP_30Rnd_556x45_Stanag",6,30],["CUP_30Rnd_556x45_Stanag",4,30],["SmokeShell",2,1]]],["CUP_B_AlicePack_OD",[["ACE_EntrenchingTool",1],["ACE_salineIV",1],["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",6,200],["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",3,200]]],"H_HelmetB_snakeskin","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);


// Light anti-tank Loadout

_baseLoadout = [[["CUP_arifle_M16A2","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],["cwr3_launch_m72a3_loaded","","","",["cwr3_m72a3_m",1],[],""],[],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["CUP_HandGrenade_M67",3,1],["CUP_30Rnd_556x45_Stanag",10,30],["SmokeShell",2,1]]],[],"H_HelmetB_snakeskin","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [[["CUP_srifle_M14","","","HLC_optic_Aimpoint5000",["CUP_20Rnd_762x51_DMR",30],[],"CUP_bipod_Harris_1A2_L_BLK"],[],["CUP_hgun_M9","","","",["CUP_15Rnd_9x19_M9",17],[],""],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["CUP_HandGrenade_M67",2,1],["SmokeShell",4,1],["CUP_20Rnd_762x51_DMR",6,30],["CUP_20Rnd_762x51_DMR",2,30],["CUP_15Rnd_9x19_M9",3,17]]],["B_AssaultPack_rgr",[["CUP_20Rnd_762x51_DMR",4,30]]],"H_HelmetB_snakeskin","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);

// Scout Loadout

_baseLoadout = [[["CUP_srifle_M14_DMR","","","HLC_optic_Aimpoint5000",["CUP_20Rnd_762x51_DMR",20],[],"CUP_bipod_Harris_1A2_L_BLK"],[],["CUP_hgun_M9","","","",["CUP_15Rnd_9x19_M9",15],[],""],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["cwr3_b_vest_pasgt_lbv_alice_woodland",[["CUP_HandGrenade_M67",2,1],["SmokeShell",4,1],["CUP_20Rnd_762x51_DMR",9,20],["CUP_15Rnd_9x19_M9",3,15]]],["CUP_B_AlicePack_OD",[["hlc_optic_LeupoldM3A",1],["CUP_20Rnd_762x51_DMR",4,20]]],"cwr3_b_headgear_boonie_m81_woodland","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(sct,_baseLoadout);
COPY_ADDONS(sct,rif);


// Crewman Loadout

_baseLoadout = [[["CUP_smg_MP5A5","","","",["CUP_30Rnd_9x19_MP5",25],[],""],[],[],["cwr3_b_uniform_tanksuit",[["ACE_elasticBandage",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_Chestrig_oli",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["SmokeShell",4,1],["CUP_30Rnd_9x19_MP5",6,25],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["SmokeShellGreen",2,1]]],["B_FieldPack_oli",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"CUP_H_CZ_Helmet05","G_Combat",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(crew,_baseLoadout);

// Pilot Loadout

_baseLoadout = [[["CUP_smg_MP5A5","","","",["CUP_30Rnd_9x19_MP5",30],[],""],[],[],["CUP_U_B_USArmy_PilotOverall",[["ACE_elasticBandage",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_Chestrig_oli",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["SmokeShell",4,1],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["SmokeShellGreen",2,1],["CUP_30Rnd_9x19_MP5",4,30]]],[],"cwr3_b_headgear_pilot","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(pilot,_baseLoadout);


// Engineer/logi Loadout

_baseLoadout = [[["CUP_arifle_M16A2","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],[],["CUP_hgun_M9","","","",["CUP_15Rnd_9x19_M9",17],[],""],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_30Rnd_556x45_Stanag",4,30],["CUP_30Rnd_556x45_Stanag",4,30],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["CUP_15Rnd_9x19_M9",1,17]]],["B_AssaultPack_khk",[["ToolKit",1],["ACE_EntrenchingTool",1],["ACE_Clacker",1],["MineDetector",1],["ACE_DefusalKit",1],["ACE_wirecutter",1]]],"H_HelmetB","G_Tactical_Clear",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(eng,_baseLoadout);


// Zeus

_baseLoadout = [[["CUP_srifle_M14","","","HLC_optic_Aimpoint5000",["CUP_20Rnd_762x51_DMR",20],[],"CUP_bipod_Harris_1A2_L_BLK"],[],["CUP_hgun_M9","","","",["CUP_15Rnd_9x19_M9",15],[],""],["cwr3_b_uniform_m81_woodland",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["CUP_HandGrenade_M67",2,1],["SmokeShell",4,1],["CUP_20Rnd_762x51_DMR",8,20],["CUP_15Rnd_9x19_M9",3,15]]],["B_AssaultPack_rgr",[["CUP_20Rnd_762x51_DMR",4,20]]],"cwr3_b_headgear_cap_m81_woodland_majgen","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]];

CREATE_LOADOUT(zeus,_baseLoadout);
COPY_ADDONS(zeus,rif);



// Small crate loadout
CREATE_CRATE(small);  // The name of this crate is "small".  You will need to use this name in all the commands below.
                      // INFO: the name of this crate in-game will be "crate_small".

ADD_RIFLE_TO_CRATE(small,rif,2);    // This crate now contains two of the Rifleman's rifles in it.
ADD_LAUNCHER_TO_CRATE(small,lat,2); // This crate now contains two of the LAT soldier's launchers in it.
ADD_PISTOL_TO_CRATE(small,rif,2);   // Two of the Rifleman's pistols.  If the Rifleman doesn't have a pistol, you can choose it from other units (for example, ftl or co).

ADD_RIFLE_AMMO_TO_CRATE(small,rif,30); // This crate now contains two rifle magazines in it, which the Rifleman can use.
ADD_PISTOL_AMMO_TO_CRATE(small,rif,6); // This crate now contains two of the Rifleman's pistol magazines in it.
ADD_RIFLE_AMMO_TO_CRATE(small,ar,6);   // These commands copy whatever magazine is loaded into the weapon in ACE Arsenal.
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2); // So if nothing appears, make sure your loadout has a magazine loaded into its gun.
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,4);  // Grenade launcher rounds work too!

ADD_ITEMS_TO_CRATE(small,"CUP_30Rnd_556x45_Stanag",10); // The Rifleman has normal bullets loaded into his gun.  To add Tracer rounds into this box, we can use this command.
ADD_ITEMS_TO_CRATE(small,"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",3);

ADD_ITEMS_TO_CRATE(small,"CUP_1Rnd_Smoke_M203",4); // The FTL has explosive grenades loaded by default, to add smoke rounds we can use this command.
ADD_ITEMS_TO_CRATE(small,"CUP_1Rnd_SmokeRed_M203",2); // If your gearscript uses different ammo, you can select it in ACE Arsenal and use CTRL+C to get the right Classname.
ADD_ITEMS_TO_CRATE(small,"CUP_1Rnd_SmokeGreen_M203",2); // Then you can use CTRL+V to paste into the quote-marks here.
ADD_ITEMS_TO_CRATE(small,"CUP_FlareGreen_M203",2); // Then you can use CTRL+V to paste into the quote-marks here.
ADD_ITEMS_TO_CRATE(small,"CUP_FlareRed_M203",2); // Then you can use CTRL+V to paste into the quote-marks here.

ADD_ITEMS_TO_CRATE(small,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(small,"CUP_HandGrenade_M67",6);
ADD_ITEMS_TO_CRATE(small,"ACE_SpareBarrel",1);  // to go into battle with a machinegun and not get it red-hot is blasphemous.

ADD_BANDAGES_TO_CRATE(small,40); // This will automatically add a mixture of different bandages into the crate.
ADD_SPLINTS_TO_CRATE(small,20);
ADD_MEDS_TO_CRATE(small,30); // This will automatically add a mixture of different auto-injectors into the crate.
ADD_BLOOD_TO_CRATE(small,15); // This will add eight 1000ml bags of blood.

ADD_BACKPACKS_TO_CRATE(small,aar,2);  // We can also add two of the Rifleman's backpacks in here, in case someone loses theirs or needs to carry extra things.

ADD_ITEMS_TO_CRATE(small,"ACRE_PRC343",6);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC152",2);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC148",2);
ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,rif,4);
ADD_LAUNCHER_TO_CRATE(med,lat,4);
ADD_PISTOL_TO_CRATE(med,rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,ar,15);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);
ADD_RIFLE_GRENADES_TO_CRATE(med,ftl,10);

ADD_ITEMS_TO_CRATE(med,"CUP_30Rnd_556x45_Stanag",20);
ADD_ITEMS_TO_CRATE(med,"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",10);

ADD_ITEMS_TO_CRATE(med,"CUP_1Rnd_Smoke_M203",10);
ADD_ITEMS_TO_CRATE(med,"CUP_1Rnd_SmokeRed_M203",5);
ADD_ITEMS_TO_CRATE(med,"CUP_1Rnd_SmokeGreen_M203",5);
ADD_ITEMS_TO_CRATE(med,"CUP_FlareGreen_M203",5);
ADD_ITEMS_TO_CRATE(med,"CUP_FlareRed_M203",5);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",15);

ADD_ITEMS_TO_CRATE(med,"CUP_HandGrenade_M67",15);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",2);

ADD_BANDAGES_TO_CRATE(med,80);
ADD_SPLINTS_TO_CRATE(med,40);
ADD_MEDS_TO_CRATE(med,50);
ADD_BLOOD_TO_CRATE(med,30);

ADD_BACKPACKS_TO_CRATE(med,aar,4);

ADD_ITEMS_TO_CRATE(med,"ACRE_PRC343",12);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC152",4);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC148",4);
ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);


// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,rif);
