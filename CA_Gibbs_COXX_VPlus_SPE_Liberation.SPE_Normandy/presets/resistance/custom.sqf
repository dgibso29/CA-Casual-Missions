/*
    Needed Mods:
    - Spearhead 1944 CDLC

    Optional Mods:
    - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
    "O_officer_F",
    "O_Soldier_F",
    "O_Soldier_F",
    "O_medic_F",
    "O_Soldier_GL_F",
    "O_Soldier_LAT_F",
    "O_Soldier_F",
    "O_Soldier_SL_F"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
    "SPE_FFI_SdKfz250_1",
	"SPE_FFI_SdKfz250_1"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 = [
    ["SPE_Fusil_Mle_208_12_Sawedoff","SPE_2Rnd_12x65_Pellets",12,"",""],
    ["SPE_Fusil_Mle_208_12","SPE_2Rnd_12x65_Pellets",12,"",""],
    ["SPE_K98","SPE_5Rnd_792x57",5,"",""],
    ["SPE_K98","SPE_5Rnd_792x57",5,"",""],
    ["SPE_Sten_Mk2","SPE_32Rnd_9x19_Sten",4,"",""],
    ["SPE_MP40","SPE_32Rnd_9x19",4,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["SPE_K98","SPE_5Rnd_792x57",6,"",""],
    ["SPE_K98","SPE_5Rnd_792x57",6,"",""],
    ["SPE_Sten_Mk2","SPE_32Rnd_9x19_Sten",5,"",""],
    ["SPE_MP40","SPE_32Rnd_9x19",5,"",""],
    ["SPE_FM_24_M29","SPE_25Rnd_75x54",5,"",""]
];

KP_liberation_guerilla_weapons_3 = [
    ["SPE_K98","SPE_5Rnd_792x57",8,"",""],
    ["SPE_K98","SPE_5Rnd_792x57",8,"",""],
    ["SPE_MP40","SPE_32Rnd_9x19",6,"",""],
    ["SPE_MG34","SPE_50Rnd_792x57",5,"",""],
    ["SPE_MG42","SPE_50Rnd_792x57",5,"",""],
    ["SPE_K98ZF39","SPE_5Rnd_792x57",5,"",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
    "U_SPE_FFI_Casual_1",
    "U_SPE_FFI_Casual_2",
    "U_SPE_FFI_Casual_3",
    "U_SPE_FFI_Casual_4",
    "U_SPE_FFI_Casual_5",
    "U_SPE_FFI_Casual_6",
    "U_SPE_FFI_Casual_7",
    "U_SPE_FFI_Casual_1_trop",
    "U_SPE_FFI_Casual_2_trop",
    "U_SPE_FFI_Casual_3_trop",
    "U_SPE_FFI_Casual_4_trop",
    "U_SPE_FFI_Casual_5_trop",
    "U_SPE_FFI_Casual_6_trop",
    "U_SPE_FFI_Casual_7_trop",
    "U_SPE_FFI_Worker_1",
    "U_SPE_FFI_Worker_2",
    "U_SPE_FFI_Worker_3",
    "U_SPE_FFI_Worker_4",
    "U_SPE_FFI_Jacket_bruin",
    "U_SPE_FFI_Jacket_grijs",
    "U_SPE_FFI_Jacket_zwart_swetr"
];

KP_liberation_guerilla_uniforms_2 = [
    "U_SPE_FFI_Casual_1",
    "U_SPE_FFI_Casual_2",
    "U_SPE_FFI_Casual_3",
    "U_SPE_FFI_Casual_4",
    "U_SPE_FFI_Casual_5",
    "U_SPE_FFI_Casual_6",
    "U_SPE_FFI_Casual_7",
    "U_SPE_FFI_Casual_1_trop",
    "U_SPE_FFI_Casual_2_trop",
    "U_SPE_FFI_Casual_3_trop",
    "U_SPE_FFI_Casual_4_trop",
    "U_SPE_FFI_Casual_5_trop",
    "U_SPE_FFI_Casual_6_trop",
    "U_SPE_FFI_Casual_7_trop",
    "U_SPE_FFI_Worker_1",
    "U_SPE_FFI_Worker_2",
    "U_SPE_FFI_Worker_3",
    "U_SPE_FFI_Worker_4",
    "U_SPE_FFI_Jacket_bruin",
    "U_SPE_FFI_Jacket_grijs",
    "U_SPE_FFI_Jacket_zwart_swetr"
];

KP_liberation_guerilla_uniforms_3 = [
    "U_SPE_FR_Tank_Crew",
    "U_SPE_FR_Tank_Crew3",
    "U_SPE_FR_HBT_Uniform",
    "U_SPE_FR_HBT_Uniform_Trop",
    "U_SPE_FR_Tank_Crew2"
];

// Vests
KP_liberation_guerilla_vests_1 = [
    "V_SPE_FFI_Vest_Pouch",
    "V_SPE_FFI_Vest_Pouch_frag",
    "V_SPE_FFI_Vest_rifle",
    "V_SPE_FFI_Vest_rifle_frag",
    "V_SPE_FFI_Vest_rifle_pouch",
    "V_SPE_FFI_Vest_SMG",
    "V_SPE_FFI_Vest_SMG_frag",
    "V_SPE_FFI_Vest_SMG_pouch"
];

KP_liberation_guerilla_vests_2 = [
    "V_SPE_FFI_Vest_Pouch",
    "V_SPE_FFI_Vest_Pouch_frag",
    "V_SPE_FFI_Vest_rifle",
    "V_SPE_FFI_Vest_rifle_frag",
    "V_SPE_FFI_Vest_rifle_pouch",
    "V_SPE_FFI_Vest_SMG",
    "V_SPE_FFI_Vest_SMG_frag",
    "V_SPE_FFI_Vest_SMG_pouch"
];

KP_liberation_guerilla_vests_3 = [
    "V_SPE_FFI_Vest_rifle",
    "V_SPE_FFI_Vest_rifle_frag",
    "V_SPE_FFI_Vest_rifle_pouch",
    "V_SPE_FFI_Vest_SMG",
    "V_SPE_FFI_Vest_SMG_frag",
    "V_SPE_FFI_Vest_SMG_pouch"
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
    "H_SPE_CIV_Fedora_Cap_1",
    "H_SPE_CIV_Fedora_Cap_2",
    "H_SPE_CIV_Fedora_Cap_3",
    "H_SPE_CIV_Fedora_Cap_4",
    "H_SPE_CIV_Fedora_Cap_5",
    "H_SPE_CIV_Fedora_Cap_6",
    "H_SPE_CIV_Worker_Cap_1",
    "H_SPE_CIV_Worker_Cap_2",
    "H_SPE_CIV_Worker_Cap_3",
    "",
    "",
    "",
    "",
    "",
    ""
];

KP_liberation_guerilla_headgear_2 = [
    "H_SPE_CIV_Fedora_Cap_1",
    "H_SPE_CIV_Fedora_Cap_2",
    "H_SPE_CIV_Fedora_Cap_3",
    "H_SPE_CIV_Fedora_Cap_4",
    "H_SPE_CIV_Fedora_Cap_5",
    "H_SPE_CIV_Fedora_Cap_6",
    "H_SPE_CIV_Worker_Cap_1",
    "H_SPE_CIV_Worker_Cap_2",
    "H_SPE_CIV_Worker_Cap_3",
    "H_SPE_FR_Adrian",
    "H_SPE_FR_Adrian_ns",
    "",
    "",
    "",
    ""
];

KP_liberation_guerilla_headgear_3 = [
    "H_SPE_FR_Adrian",
    "H_SPE_FR_Adrian_ns",
    "H_SPE_FR_Adrian",
    "H_SPE_FR_Adrian_ns",
    "H_SPE_FR_Adrian_Medic",
    "H_SPE_FR_Adrian_Medic_ns"
];

// Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
    "H_SPE_FR_Adrian",
    "H_SPE_FR_Adrian_ns",
    "H_SPE_FR_Adrian",
    "H_SPE_FR_Adrian_ns",
    "H_SPE_FR_Adrian_Medic",
    "H_SPE_FR_Adrian_Medic_ns",
    "H_SPE_FR_US_Helmet_ns",
    "H_SPE_FR_US_Helmet_os"
];
