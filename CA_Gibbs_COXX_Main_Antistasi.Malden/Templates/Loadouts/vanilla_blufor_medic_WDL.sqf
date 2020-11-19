[//Loadout
	[//Primary Weapon
		"arifle_MX_Black_F",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"optic_Holosight",							//Sight
		["30Rnd_65x39_caseless_black_mag",30],						//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Launcher
		"",													//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		[],													//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Secondary Weapon
		"hgun_P07_F",									//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		selectRandom										//Uniform
		["U_B_CombatUniform_mcam_wdl_f", "U_B_CombatUniform_tshirt_mcam_wdL_f", "U_B_CombatUniform_vest_mcam_wdl_f"],
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		selectRandom										//Vest
		["V_PlateCarrier1_wdl", "V_PlateCarrier2_wdl"],
		[//Inventory
			["NVGoggles_INDEP",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",2,17],
			["30Rnd_65x39_caseless_black_mag",4,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
		"B_AssaultPack_wdl_F",								//Backpack
		[] + _medicSupplies
	],

		selectRandom										//Headgear
		["H_Booniehat_wdl", "H_MilCap_wdl", "H_HelmetB_plain_wdl", "H_HelmetB_light_wdl", "H_HelmetSpecB_wdl", "H_Cap_usblack"],
		"",													//Facewear

	[//Binocular
		"Binocular",										//Binocular
		"",
		"",
		"",
		[],
		[],
		""
	],

	[//Item
		"ItemMap",											//Map
		"ItemGPS",											//Terminal
		["TF_ANPRC152"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		"ItemWatch",										//Watch
		""													//Goggles
	]
];
