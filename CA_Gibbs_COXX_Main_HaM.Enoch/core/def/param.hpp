class Params {
    class btc_p_time_title { // << Time options >>
        title = $STR_BTC_HAM_PARAM_TIME_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_time { // Set the start time:
        title = __EVAL(format ["      %1", localize "STR_A3_CFGVEHICLES_MODULEDATE_F_ARGUMENTS_HOUR_0"]);
        values[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
        texts[]={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"};
        default = 12;
    };
    class btc_p_acctime { // Acceleration time multiplier:
        title = __EVAL(format ["      %1", localize "STR_USRACT_TIME_INC"]);
        values[]={1,2,3,4,5,6,7,8,9,10,11,12};
        texts[]={"1","2","3","4","5","6","7","8","9","10","11","12"};
        default = 5;
    };
    class btc_p_load { // Load the savegame (if available)
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_DB_LOAD"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_auto_db { // Auto savegame when all players disconnected
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_DB_ASAVE"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED}; // texts[]={"Off","On"};
        default = 0;
    };
    class btc_p_db_autoRestart { // Auto restart/shutdown server (Must define in server.cfg: serverCommandPassword = "btc_password")
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_DB_ARESTART"]);
        values[]={0,1,2,3,4};
        texts[]={$STR_DISABLED,$STR_DISP_MP_DS_RESTART,$STR_BTC_HAM_PARAM_DB_SHUTDOWN,$STR_BTC_HAM_PARAM_DB_SAVERESTART, $STR_BTC_HAM_PARAM_DB_SAVESHUTDOWN}; // texts[]={"Off","Restart", "Shutdown","Save and restart", "Save and shutdown"};
        default = 0;
    };
    class btc_p_db_autoRestartTime { // Time before auto restart/shutdown server
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_DB_ARESTARTTIME"]);
        values[]={1,2,3,4,5,6,7,8,9,10,11,12,24,48,72};
        texts[]={"1h","2h","3h","4h","5h","6h","7h","8h","9h","10h","11h","12h","24h","48h","72h"};
        default = 72;
    };
    class btc_p_respawn_title { // << Respawn options >>
        title = $STR_BTC_HAM_RESP_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_respawn_location { // Respawn locations available:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_RESP_LOCATION"]);
        values[]={0,1,2,3,4};
        texts[]={$STR_BTC_HAM_RESP_FOBRALLY, $STR_BTC_HAM_RESP_FOBRALLYHELO, $STR_BTC_HAM_RESP_FOBRALLYHELI, $STR_BTC_HAM_RESP_FOBRALLYHELIVEHI, $STR_BTC_HAM_RESP_FOBRALLYHELIVEHILEADER};
        default = 4;
    };
    class btc_p_respawn_fromFOBToBase { // Allow respawn from FOB to base:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_RESP_FOBTOBASE"]);
        values[]={0,1};
        texts[]={$STR_DISABLED, $STR_ENABLED};
        default = 0;
    };
    class btc_p_rallypointTimer { // Time before rallypoint self-destruction:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_RESP_RALLYTIMER"]);
        values[]={0,5,10,30,60};
        texts[]={$STR_DISABLED,"5 min","10 min","30 min","60 min"};
        default = 30;
    };
    class btc_p_respawn_arsenal { // ACE Arsenal available on respawn after been killed:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_RESP_ENABLEARSENAL"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_type_title { // << Faction options >>
        title = $STR_BTC_HAM_PARAM_FAC_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_en { // Enemy type:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_ETYPE"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140};
        texts[]={"0 - Bohemia Interactive: NATO (Arid) (Side: WEST)","1 - Bohemia Interactive: NATO (Desert) (Side: WEST)","2 - Bohemia Interactive: NATO (Woodland) (Side: WEST)","3 - Bohemia Interactive: 2035 FIA (Side: WEST)","4 - Bohemia Interactive: 2035 Syndikat (Side: GUER)","5 - Bohemia Interactive: LDF (Side: GUER)","6 - Bohemia Interactive: 2035 AAF (Side: GUER)","7 - Bohemia Interactive: 2035 FIA (Side: GUER)","8 - Bohemia Interactive: Looters (Side: GUER)","9 - Bohemia Interactive: 2035 FIA (Side: EAST)","10 - Ryan: Zombies (Side: GUER)","11 - Ryan: Zombies (Side: EAST)","12 - Bohemia Interactive: USAF (Side: WEST)","13 -CFP Drew: Afghan Police (Side: WEST)","14 -CFP CFP: Chadian Armed Forces (Side: WEST)","15 -CFP Tupolov: Army of the Czech Rep. (Jungle / Woodland) (Side: WEST)","16 -CFP CFP: Israeli Defense Force (Side: WEST)","17 -CFP Drew: Iraqi Army (Side: WEST)","18 -CFP Drew: Iraqi Police (Side: WEST)","19 -CFP Drew: Kenyan Defense Force (Side: WEST)","20 -CFP Drew: Malian Government Forces (Side: WEST)","21 -CFP CFP: Nigerian Army (Side: WEST)","22 -CFP Drew: Peshmerga (Side: WEST)","23 -CFP Drew: Uganda People's Defense Force (Side: WEST)","24 -CFP Drew: US 75th Rangers (Jungle/Woodland) (Side: WEST)","25 -CFP Drew: US Navy Seals (Arid / Desert) (Side: WEST)","26 -CFP Drew: US Navy Seals (Jungle / Woodland) (Side: WEST)","27 -CFP Drew: YPG (Side: WEST)","28 -CFP Drew: al-Nusra Front (Side: GUER)","29 -CFP Drew: Islamic State (Side: GUER)","30 -CFP Drew: Sudan People's Liberation Movement North (Side: GUER)","31 -CFP Drew: Sudan Revolutionary Front (Side: GUER)","32 -CFP Drew: South Sudan People's Defense Force (Side: GUER)","33 -CFP Drew: Tuareg Rebels (Side: GUER)","34 -CFP Tupolov: Western Ultranationalists (Side: GUER)","35 -CFP Drew: Abu Sayyaf Group (Side: EAST)","36 -CFP Drew: Al Qaeda (Side: EAST)","37 -CFP Drew: Al-Shabaab (Side: EAST)","38 -CFP Tupolov: Ansar Allah (Houthis) (Side: EAST)","39 -CFP Drew: Boko Haram (Side: EAST)","40 -CFP Drew: Central African Rebels (Side: EAST)","41 -CFP Drew: Hamas Al Qassam Brigades (Side: EAST)","42 -CFP Drew: Hezbollah (Side: EAST)","43 -CFP CFP: Iraqi Army (Hussein Regime) (Side: EAST)","44 -CFP Drew: Islamic Republic of Iran Army (Side: EAST)","45 -CFP Drew: Islamic State (Side: EAST)","46 -CFP Drew: Sudanese Armed Forces (Side: EAST)","47 -CFP CFP: Sudan Rapid Support Forces / Janjaweed (Side: EAST)","48 -CFP Drew: Somali Rebels (Side: EAST)","49 -CFP Drew: Sudan People's Liberation Movement In Opposition (Side: EAST)","50 -CFP Drew: Syrian Arab Army (Side: EAST)","51 -CFP Drew: Taliban Insurgents (Side: EAST)","52 -CRE8IVE Cre8or: Bundeswehr (Desert) (Side: WEST)","53 -CRE8IVE Cre8or: Bundeswehr (Woodland) (Side: WEST)","54 -CUP Community Upgrade Project: Chernarus Defense Forces (Side: WEST)","55 -CUP Community Upgrade Project: Army of the Czech Rep. (Arid / Desert) (Side: WEST)","56 -CUP Community Upgrade Project: British Army (Arid / Desert) (Side: WEST)","57 -CUP Community Upgrade Project: Horizon Islands Legion (Side: WEST)","58 -CUP Community Upgrade Project: Royal New Zealand Navy (Side: WEST)","59 -CUP Community Upgrade Project: US Army (Arid / Desert) (Side: WEST)","60 -CUP Community Upgrade Project: US Marine Corps (Jungle / Woodland) (Side: WEST)","61 -CUP Community Upgrade Project: National Party of Chernarus (Side: GUER)","62 -CUP Community Upgrade Project: Royal Army Corps of Sahrani (Side: GUER)","63 -CUP Community Upgrade Project: United Nations (Side: GUER)","64 -CUP Community Upgrade Project: Chernarussian Movement of the Red Star (Side: EAST)","65 -CUP Community Upgrade Project: Russian Ground Forces (Jungle / Woodland) (Side: EAST)","66 -CUP Community Upgrade Project: Sahrani Liberation Army (Side: EAST)","67 -CUP Community Upgrade Project: Takistani Army (Side: EAST)","68 -CUP Community Upgrade Project: Takistani Militia (Side: EAST)","69 -CUP Community Upgrade Project: CUP Static Ships (Side: WEST)","70 -CUP_Units Drew: Chernarus Defense Forces [Winter] (Side: WEST)","71 -CUP_Units Community Upgrade Project: Bundeswehr (Jungle / Woodland) (Side: WEST)","72 -CUP_Units Community Upgrade Project: British Army (Jungle / Woodland) (Side: WEST)","73 -CUP_Units Drew: US Army 1991 [Arid/Desert] (Side: WEST)","74 -CUP_Units Drew: US Army 1991 [Woodland] (Side: WEST)","75 -CUP_Units Drew: US Army 2003 [Arid/Desert] (Side: WEST)","76 -CUP_Units Drew: US Army 2003 [Woodland] (Side: WEST)","77 -CUP_Units Tupolov: US CIA (Middle East) (Side: WEST)","78 -CUP_Units Community Upgrade Project: US Marine Corps (Arid / Desert) (Side: WEST)","79 -CUP_Units Drew: PMC Wagner (Arid / Desert) (Side: GUER)","80 -CUP_Units Drew: PMC Wagner (Woodland) (Side: GUER)","81 -CUP_Units Drew: PMC Wagner (Winter) (Side: GUER)","82 -CUP_Units Community Upgrade Project: Russian Ground Forces (Arid / Desert) (Side: EAST)","83 -CUP_Units Tupolov: Russian National Guard (Side: EAST)","84 -CUP_Units Drew: PMC Wagner (Arid / Desert) (Side: EAST)","85 -CUP_Units Drew: PMC Wagner (Woodland) (Side: EAST)","86 -CUP_Units Drew: PMC Wagner (Winter) (Side: EAST)","87 -CUP_Units Community Upgrade Project: Bundeswehr (Arid / Desert) (Side: WEST)","88 -CUP_Units Community Upgrade Project: ION PMC (Side: GUER)","89 -CUP_Units Community Upgrade Project: Takistani Locals (Side: GUER)","90 -CUP_Vehicles Drew: Afghan Army (Side: WEST)","91 -CUP_Vehicles Community Upgrade Project: US Army (Jungle / Woodland) (Side: WEST)","92 -CUP_Vehicles Drew: Chernarussian Movement of the Red Star [Winter] (Side: EAST)","93 -Enoch Bohemia Interactive: LDF (Desert) (Side: WEST)","94 -Enoch Bohemia Interactive: LDF (Desert) (Side: GUER)","95 -Enoch Bohemia Interactive: Spetsnaz (Side: EAST)","96 -Expansion Bohemia Interactive: 2035 CTRG (Side: WEST)","97 -Expansion Bohemia Interactive: 2035 Gendarmerie (Side: WEST)","98 -Expansion Bohemia Interactive: 2035 NATO (Pacific) (Side: WEST)","99 -Expansion Drew: Korean People's Army (Side: EAST)","100 -Expansion Bohemia Interactive: 2035 Gendarmerie (Side: EAST)","101 -FRANCE AMF Team: France (Side: WEST)","102 -Jets Bravo Zero One Studios: 2035 NATO (Side: WEST)","103 -Jets Bravo Zero One Studios: 2035 CSAT (Side: EAST)","104 -Mark Blackburne: France faction (Side: WEST)","105 -Mark Bohemia Interactive: NATO (Woodland) (Side: WEST)","106 -OPF Phantom hawk: CSAT (Arctic) (Side: EAST)","107 -OPF Phantom hawk: CSAT (Night) (Side: EAST)","108 -OPF Phantom hawk: CSAT (Desert) (Side: EAST)","109 -OPF Phantom hawk: CSAT (Uban) (Side: EAST)","110 -OPF Phantom hawk: CSAT (Woodland) (Side: EAST)","111 -OPF Community Upgrade Project: 2035 CSAT (Pacific) (Side: EAST)","112 -RKSL RKSL Studios: UK Armed Forces (Side: WEST)","113 -SIMC smicdaro: USMC (65) (Side: WEST)","114 -SIMC smicdaro: USMC (67) (Side: WEST)","115 -SIMC smicdaro: USMC (69) (Side: WEST)","116 -SIMC smicdaro: PAVN (69) (Side: EAST)","117 -SIMC smicdaro: US Army (65) (Side: WEST)","118 -SIMC smicdaro: US Army (67) (Side: WEST)","119 -SIMC smicdaro: US Army (69) (Side: WEST)","120 -SOUP Starvolt: SOUP (BLUFOR) (Side: WEST)","121 -SOUP Starvolt: SOUP (INDFOR) (Side: WEST)","122 -SOUP Starvolt: SOUP (OPFOR) (Side: WEST)","123 -UK3CB www.3commandobrigade.com: BAF-3CB, AirForce Arctic (Side: WEST)","124 -UK3CB www.3commandobrigade.com: BAF-3CB, AirForce Desert (Side: WEST)","125 -UK3CB www.3commandobrigade.com: BAF-3CB, AirForce MTP (Side: WEST)","126 -UK3CB www.3commandobrigade.com: BAF-3CB, AirForce Temperate (Side: WEST)","127 -UK3CB www.3commandobrigade.com: BAF-3CB, AirForce Tropical (Side: WEST)","128 -UK3CB www.3commandobrigade.com: BAF-3CB, AirForce Woodland (Side: WEST)","129 -UK3CB www.3commandobrigade.com: BAF-3CB, Army Arctic (Side: WEST)","130 -UK3CB www.3commandobrigade.com: BAF-3CB, Army Desert (Side: WEST)","131 -UK3CB www.3commandobrigade.com: BAF-3CB, Army MTP (Side: WEST)","132 -UK3CB www.3commandobrigade.com: BAF-3CB, Army Temperate (Side: WEST)","133 -UK3CB www.3commandobrigade.com: BAF-3CB, Army Tropical (Side: WEST)","134 -UK3CB www.3commandobrigade.com: BAF-3CB, Army Woodland (Side: WEST)","135 -UK3CB www.3commandobrigade.com: BAF-3CB, Navy Arctic (Side: WEST)","136 -UK3CB www.3commandobrigade.com: BAF-3CB, Navy Desert (Side: WEST)","137 -UK3CB www.3commandobrigade.com: BAF-3CB, Navy MTP (Side: WEST)","138 -UK3CB www.3commandobrigade.com: BAF-3CB, Navy Temperate (Side: WEST)","139 -UK3CB www.3commandobrigade.com: BAF-3CB, Navy Tropical (Side: WEST)","140 -UK3CB www.3commandobrigade.com: BAF-3CB, Navy Woodland (Side: WEST)"};
        default = 6;
    };
    class btc_p_AA { // Anti-Air infantry:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_EAA"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_tank { // Enemy uses Tank:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_ETANK"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_civ { // Civil type:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_CTYPE"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26};
        texts[]={"0 - EricJ: Afghan Civilians (Side: CIV)","1 - Bohemia Interactive: Civils (Side: CIV)","2 - Bohemia Interactive: Autre (Side: CIV)","3 -CFP Drew: Civilians (Afghanistan) (Side: CIV)","4 -CFP Drew: Civilians (African Christian) (Side: CIV)","5 -CFP Drew: Civilians (African Islamic) (Side: CIV)","6 -CFP Drew: Civilians (Asian) (Side: CIV)","7 -CFP Drew: Civilians (Chernarus Winter) (Side: CIV)","8 -CFP Drew: Civilians (Malden) (Side: CIV)","9 -CFP Drew: Civilians (Middle Eastern) (Side: CIV)","10 -CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","11 -CUP_Vehicles $CUP_AUTHOR_STRING: Civilians (Chernarus) (Side: CIV)","12 -CUP_Vehicles $CUP_AUTHOR_STRING: Civilians (Sahrani) (Side: CIV)","13 -CUP_Vehicles $CUP_AUTHOR_STRING: Civilians (Takistan) (Side: CIV)","14 -gm Global Mobilization: East Germany (Side: CIV)","15 -gm Global Mobilization: West Germany (Side: CIV)","16 -LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","17 -LOP_LeightsOPFOR Project OPFOR: Civilians (African) (Side: CIV)","18 -LOP_LeightsOPFOR Project OPFOR: Civilians (Eastern European) (Side: CIV)","19 -LOP_LeightsOPFOR Project OPFOR: Civilians (Middle Eastern) (Side: CIV)","20 -OPTRE Article 2 Studios: IDAP (Side: CIV)","21 -OPTRE Article 2 Studios: Civilians (UEG) (Side: CIV)","22 -RDS_CIV_PACK RDS (BIS A2 Port): Russians (Side: CIV)","23 -UK3CB_Factions www.3commandobrigade.com: 3CB African Desert Civilians (Side: CIV)","24 -UK3CB_Factions www.3commandobrigade.com: 3CB Chernarus Civilians (Side: CIV)","25 -UK3CB_Factions www.3commandobrigade.com: 3CB Takistan Civilians (Side: CIV)","26 -UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
        default = 1;
    };
    class btc_p_civ_veh { // Civil vehicle type:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_CTYPEVEH"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26};
        texts[]={"0 - EricJ: Afghan Civilians (Side: CIV)","1 - Bohemia Interactive: Civils (Side: CIV)","2 - Bohemia Interactive: Autre (Side: CIV)","3 -CFP Drew: Civilians (Afghanistan) (Side: CIV)","4 -CFP Drew: Civilians (African Christian) (Side: CIV)","5 -CFP Drew: Civilians (African Islamic) (Side: CIV)","6 -CFP Drew: Civilians (Asian) (Side: CIV)","7 -CFP Drew: Civilians (Chernarus Winter) (Side: CIV)","8 -CFP Drew: Civilians (Malden) (Side: CIV)","9 -CFP Drew: Civilians (Middle Eastern) (Side: CIV)","10 -CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","11 -CUP_Vehicles $CUP_AUTHOR_STRING: Civilians (Chernarus) (Side: CIV)","12 -CUP_Vehicles $CUP_AUTHOR_STRING: Civilians (Sahrani) (Side: CIV)","13 -CUP_Vehicles $CUP_AUTHOR_STRING: Civilians (Takistan) (Side: CIV)","14 -gm Global Mobilization: East Germany (Side: CIV)","15 -gm Global Mobilization: West Germany (Side: CIV)","16 -LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","17 -LOP_LeightsOPFOR Project OPFOR: Civilians (African) (Side: CIV)","18 -LOP_LeightsOPFOR Project OPFOR: Civilians (Eastern European) (Side: CIV)","19 -LOP_LeightsOPFOR Project OPFOR: Civilians (Middle Eastern) (Side: CIV)","20 -OPTRE Article 2 Studios: IDAP (Side: CIV)","21 -OPTRE Article 2 Studios: Civilians (UEG) (Side: CIV)","22 -RDS_CIV_PACK RDS (BIS A2 Port): Russians (Side: CIV)","23 -UK3CB_Factions www.3commandobrigade.com: 3CB African Desert Civilians (Side: CIV)","24 -UK3CB_Factions www.3commandobrigade.com: 3CB Chernarus Civilians (Side: CIV)","25 -UK3CB_Factions www.3commandobrigade.com: 3CB Takistan Civilians (Side: CIV)","26 -UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
        default = 1;
    };
    class btc_p_spawn_title { // << Spawn options >>
        title = $STR_BTC_HAM_PARAM_SPAWN_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_is_free_prob { // Probability for a city to be free:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_ISFREE_PROB"]);
        values[]={0,10,20,30,40,45,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","45%","50%","60%","70%","80%","90%","100%"};
        default = 45;
    };
    class btc_p_mil_group_ratio { // Enemy density:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_ENEMY_DENSITY"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
        default = 100;
    };
    class btc_p_mil_static_group_ratio { // Enemy static density:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_ENEMY_STATIC_DENSITY"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
        default = 100;
    };
    class btc_p_civ_group_ratio { // Civilian density:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_CIVILIAN_DENSITY"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
        default = 100;
    };
    class btc_p_animals_group_ratio { // Animal density:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_ANIMALS_DENSITY"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
        default = 100;
    };
    class btc_p_wp_house_probability { // Density of military in house:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_MIL_INHOUSE_DENSITY"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
        default = 30;
    };
    class btc_p_veh_armed_ho { // Add armed vehicles in Hideout:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPAWN_ARMEDHIDEOUT"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_veh_armed_spawn_more { // Add armed vehicles in Side mission/Cache:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPAWN_ARMEDOTHER"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_patrol_max { // Maximum number of military patrol:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_PATROL_MAX"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"1","2","3","4","5","6","7","8","9","10"};
        default = 8;
    };
    class btc_p_civ_max_veh { // Maximum number of civilian patrol:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_CIV_MAX_VEH"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"1","2","3","4","5","6","7","8","9","10"};
        default = 10;
    };
    class btc_p_IED_title { // << IED options >>
        title = $STR_BTC_HAM_PARAM_IED_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_ied { // IEDs ratio:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_IED_RATIO"]);
        values[]={0, 1, 2, 3};
        texts[]={$STR_DISABLED,$STR_A3_TIME_TRIALS_MISCTT_ROF_25,$STR_3DEN_ATTRIBUTES_SPEEDMODE_NORMAL,$STR_A3_TIME_TRIALS_MISCTT_ROF_21}; //texts[]={"Off","Low","Normal","High"};
        default = 2;
    };
    class btc_p_ied_spot { // IEDs spotting difficulty:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_IED_SPOT"]);
        values[]={0, 1, 2};
        texts[]={$STR_BTC_HAM_PARAM_IED_SPOT_VERYEASY,$STR_BTC_HAM_PARAM_IED_SPOT_EASY,$STR_3DEN_ATTRIBUTES_SPEEDMODE_NORMAL}; //texts[]={"Very easy","Easy","Normal"};
        default = 2;
    };
    class btc_p_ied_placement { // IEDs type of placement:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_IED_PLACEMENT"]);
        values[]={2, -1, 3};
        texts[]={$STR_BTC_HAM_PARAM_IED_PLACEMENT_ROADSIDE,$STR_BTC_HAM_PARAM_IED_PLACEMENT_MIDDLE,$STR_3DEN_ATTRIBUTES_OBJECTTEXTURE_RANDOM_TEXT}; //texts[]={"Roadside", "Middle", "Random"};
        default = 3;
    };
    class btc_p_ied_drone { // Drone bomber:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_IED_DRONE"]);
        values[]={0, 1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_hideout_cache_title { // << Hideout/Cache options >>
        title = $STR_BTC_HAM_PARAM_HIDE_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_hideout_n { // Hideout numbers:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_HIDE_NUMBERS"]);
        values[]={99,1,2,3,4,5};
        texts[]={$STR_3DEN_ATTRIBUTES_OBJECTTEXTURE_RANDOM_TEXT,"1","2","3","4","5"}; //texts[]={"Random","1","2","3","4","5"};
        default = 5;
    };
    class btc_p_cache_info_def { // Info cache distance:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_CACHE_DISTANCE"]);
        values[]={500,1000,1500,2000,2500,3000,3500,4000,5000};
        texts[]={"500 m","1000 m","1500 m","2000 m","2500 m","3000 m","3500 m","4000 m","5000 m"};
        default = 1000;
    };
    class btc_p_cache_info_ratio { //Cache info ratio:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_CACHE_RATIO"]);
        values[]={50,100};
        texts[]={"50 m","100 m"};
        default = 100;
    };
    class btc_p_info_chance { // Intel from dead bodies chance:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_CACHE_DEADINFO"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"100 %","90 %","80 %","70 %","60 %","50 %","40 %","30 %","20 %","10 %","0 %"};
        default = 70;
    };
    class btc_p_skill_title { // << A3 Skill options >>
        title = $STR_BTC_HAM_PARAM_SKILL_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_set_skill { // Set skill?
        title = __EVAL(format ["      %1?", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_set_skill_general { // Set skill, general
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_3DEN_SCENARIO_TEXTSINGULAR"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 0;
    };
    class btc_p_set_skill_aimingAccuracy { // Set skill, aimingAccuracy
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_AIMACC"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 1;
    };
    class btc_p_set_skill_aimingShake { // Set skill, aimingShake
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_AIMSKILL"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 4;
    };
    class btc_p_set_skill_aimingSpeed { // Set skill, aimingSpeed
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_AIMSPEED"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 3;
    };
    class btc_p_set_skill_endurance { // Set skill, endurance
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_A3_VR_STAMINA"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 5;
    };
    class btc_p_set_skill_spotDistance { // Set skill, spotDistance
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_SPOTDIST"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 9;
    };
    class btc_p_set_skill_spotTime { // Set skill, spotTime
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_SPOTTIME"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 7;
    };
    class btc_p_set_skill_courage { // Set skill, courage
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_COURAGE"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 2;
    };
    class btc_p_set_skill_reloadSpeed { // Set skill, reloadSpeed
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_RELOAD"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 10;
    };
    class btc_p_set_skill_commanding { // Set skill, commanding
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_A3_CFGHINTS0"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 7;
    };
    class btc_p_gameplay_title { // << Gameplay options >>
        title = $STR_BTC_HAM_PARAM_GAMEPLAY_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_sea { // Extend battlefield to sea:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_GAMEPLAY_SEA"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_chem { // Chemical warfare
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_GAMEPLAY_CHEM"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_spect { // Spectrum devices
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_GAMEPLAY_SPECT"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_side_mission_cycle { // Side mission cycle:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_GAMEPLAY_SIDEM"]);
        values[] = {0,1,2,3,4};
        texts[] = {$STR_DISABLED,1,2,3,4};
        default = 0;
    };
    class btc_p_arsenal_title { // << Arsenal options >>
        title = $STR_BTC_HAM_PARAM_ARSENAL_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_arsenal_Type { // Type of the arsenal:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE"]);
        values[]={0,1,2,3,4};
        texts[]={$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_BIS,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_BA,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_BA_PLUS,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_ACE,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_ACE_PLUS}; //texts[]={"BIS - Vanilla","BIS - Vanilla and ACE 3","BIS - Vanilla and ACE 3 (scroll wheel action)","ACE 3","ACE 3 (scroll wheel action)"};
        default = 4;
    };
    class btc_p_arsenal_Restrict { // Restricted arsenal (See /define_mod.sqf):
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_ARSENAL_ARSENALRESTR"]);
        values[]={0,1,2,3};
        texts[] = {$STR_DISABLED,$STR_3DEN_ATTRIBUTES_SPEEDMODE_FULL,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALRESTR_REMOVEONLY,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALRESTR_FILTER}; //texts[]={"Off","Full","Remove only (works only with ACE3-Arsenal)","Filter on player role (works only with ACE3-Arsenal)"};
        default = 3;
    };
    class btc_p_autoloadout { // loadout:
        title = __EVAL(format ["      %1:", localize "STR_ACE_Interaction_Equipment"]);
        values[]={0,1,2};
        texts[]={$STR_DISABLED,$STR_BTC_HAM_PARAM_ARSENAL_AUTOLOADOUT, $STR_BTC_HAM_PARAM_ARSENAL_RMVWEAPONS};
        default = 1;
    };
    class btc_p_garage { // Activate garage for admin:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_ARSENAL_GARAGEADMIN"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_main_title { // << Other options >>
        title = $STR_BTC_HAM_PARAM_OTHER_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_rep { // Reputation at start:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_REPSTART"]);
        values[]={0, 200, 500, 750};
        texts[]={$STR_ACE_ViewDistance_object_verylow,$STR_A3_TIME_TRIALS_MISCTT_ROF_25,$STR_3DEN_ATTRIBUTES_SPEEDMODE_NORMAL,$STR_A3_TIME_TRIALS_MISCTT_ROF_21}; //texts[]={"Very Low","Low","Normal","High"};
        default = 200;
    };
    class btc_p_rep_notify { // Show reputation change:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_SHOWREP"]);
        values[]={0, 1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_city_radius { // Spawn city radius offset:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_SPAWNRAD"]);
        values[]={0,1,2,3,4,5,6,7,8};
        texts[]={"0 m","100 m","200 m",$STR_BTC_HAM_PARAM_OTHER_SPAWNRAD_DEF,"400 m","500 m (Takistan)","600 m","700 m","800 m"}; // texts[]={"0 m","100 m","200 m","300 m","400 m","500 m (Takistan)","600 m","700 m","800 m"};
        default = 3;
    };
    class btc_p_trigger { // Disable city activation when a plane or helicopter (>190Km/h) is flying above:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_DISABLESPAWN"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_auto_headless { // Autodetect Headless client:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_AUTOHEADLESS"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_debug { // Debug:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_DEBUG"]);
        values[]={0,1,2};
        texts[]={$STR_DISABLED,$STR_ENABLED, $STR_BTC_HAM_PARAM_OTHER_DEBUG_LOGONLY}; // texts[]={"Off","On","Log only"};
        default = 0;
    };
};
