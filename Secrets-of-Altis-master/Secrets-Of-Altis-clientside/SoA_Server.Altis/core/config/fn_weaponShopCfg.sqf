/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/

private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.
_return = [];

switch(_shop) do
{
//---------------------------AHW---------------------------------------

	case "med_basic":
	{
		if (playerSide != independent) exitWith {"Du bist kein AHW-Mitarbeiter"};

		_return = [
		    "Rettungsfachhandel",
		    ["ItemGPS",nil],
			["ItemMap","Reiseführer"],
			["ItemCompass",nil],
			["Rangefinder",nil],
			["ToolKit",nil],
			["Medikit",nil],
			["FirstAidKit",nil],
			["NVGoggles_OPFOR","NS-Brille"]
		];
	};

//---------------------------Polizei---------------------------------------	
	
	case "cop_misc":
	{
		if (playerSide != west) exitWith {"Du bist kein Polizist!"};

		_return = [
		    "Zubehör",
			["ItemGPS",nil],
			["ItemMap","Reiseführer"],
			["ItemCompass",nil],
			["B_UAVTerminal","UAV-Terminal"],
			["Rangefinder",nil],
			["ToolKit",nil],
			["FirstAidKit",nil],
			["NVGoggles_OPFOR","NS-Brille"]
		];
	};
	
	case "cop_attachments":
	{
		if (playerSide != west) exitWith {"Du bist kein Polizist!"};

		if(call life_coplevel >= 1) then
		{
			_return = [
				"Waffenaufsätze",
				["acc_flashlight",nil],
				["acc_pointer_IR",nil],
				["optic_Aco_smg",nil],
				["optic_ACO_grn_smg",nil],
				["optic_Holosight","Holosight"],
				["bipod_01_F_blk",nil],
				["muzzle_snds_L",nil],
				["muzzle_snds_H",nil]
			];
		};

		if(call life_coplevel >= 2) then
		{
			_return pushback ["optic_Hamr",nil];
			_return pushback ["optic_NVS",nil];
			_return pushback ["optic_MRCO",nil];
		};

		if(call life_coplevel >= 3) then
		{
			_return pushback ["muzzle_snds_M",nil];
			_return pushback ["muzzle_snds_B",nil];
			_return pushBack ["optic_ERCO_blk_F",nil];
			_return pushBack ["optic_Arco_blk_F",nil];
			_return pushBack ["optic_Arco",nil];
		};

		if(call life_coplevel >= 6) then
		{
			_return pushback ["optic_DMS",nil];
			_return pushback ["optic_KHS_blk",nil];
			_return pushback ["optic_SOS",nil];
		};

		if(call life_coplevel >= 7) then
		{
			_return pushback["optic_LRPS",nil];		
		};
		if(call life_coplevel >= 8) then
		{
			_return pushback["muzzle_snds_H_MG_blk_F",nil];
			_return pushback["muzzle_snds_H_MG",nil];		
		};
	};

	case "cop_magazine":
	{
		if (playerSide != west) exitWith {"Du bist kein Polizist!"};
		
		_return = [
			"Magazine",
			["16Rnd_9x21_Mag","Tasermagazin"],
			["20Rnd_556x45_UW_mag","Gummigeschoss"],
			["30Rnd_556x45_Stanag","5,56 mm 30-Schuss-Magazin"],
			["30Rnd_65x39_caseless_mag","6,5 mm 30-Schuss-Magazin"],
			["20Rnd_762x51_Mag",nil],
			["100Rnd_65x39_caseless_mag","6,5 mm 100-Schuss-Magazin"],
			["30Rnd_9x21_Mag_SMG_02",nil],
			["150Rnd_556x45_Drum_Mag_F",nil]
		];
	};
	
	case "cop_gear":
	{
		if (playerSide != west) exitWith {"Du bist kein Polizist!"};

		if (call life_coplevel >= 1) then
		{
			_return = [
				"Sonstige Ausrüstung",
				["3Rnd_Smoke_Grenade_shell","Rauchgranaten (3)"],
				["1Rnd_Smoke_Grenade_shell","Rauchgranate (1)"],
				["3Rnd_UGL_FlareWhite_F","Leuchtgeschosse (3)"],
				["UGL_FlareWhite_F","Leuchtgeschoss (1)"],
				["SmokeShellYellow","Sanitäter-Signalrauch"]					
			];
		};
		
		if (call life_coplevel >= 5) then
		{	
			_return pushback ["SmokeShellGreen","Reizgas"];				
		};
			
		if (call life_coplevel >= 6) then
		{	
			_return pushback ["HandGrenade_Stone","Blendgranate"];
			_return pushback ["SatchelCharge_Remote_Mag","Rucksackladung"];
		};
	};
	
	case "cop_weapon_krawall":
	{	
		if (playerSide != west) exitWith {"Du bist kein Polizist!"};

		if (call life_coplevel >= 1) then
		{
			_return = [
				"Krawallwaffen",
				["arifle_MX_GL_Black_F",nil]
			];
		};
		
		if (call life_coplevel >= 4) then
		{
			_return pushBack ["arifle_SPAR_02_blk_F",nil];	
		};

		if (call life_coplevel >= 5) then
		{
			_return pushback ["srifle_DMR_03_F",nil];
		};

		if (call life_coplevel >= 7) then
		{
			_return pushBack ["arifle_SPAR_03_blk_F",nil];	
		};
	};

	case "cop_weapon":
	{	
		if (playerSide != west) exitWith {"Du bist kein Polizist!"};
		
		if (call life_coplevel >= 1) then
		{
			_return = [
				"Polizeiwaffen",
				["hgun_P07_snds_F","Taser"]
			];
		};
		
		if (call life_coplevel >= 2) then
		{
			_return pushBack ["arifle_SDAR_F","Gummigewehr"];
			_return pushBack ["SMG_05_F",nil];
		};
		
		if (call life_coplevel >= 3) then
		{
			_return pushBack ["arifle_SPAR_01_blk_F",nil];
			_return pushBack ["arifle_Mk20C_plain_F",nil];
		};
		
		if (call life_coplevel >= 4) then
		{
			_return pushBack ["arifle_MXC_Black_F",nil];
		};
		
		if (call life_coplevel >= 6) then
		{
			_return pushback ["arifle_MX_Black_F",nil];
		};
		
		if (call life_coplevel >= 7) then
		{
			_return pushback ["arifle_MXM_Black_F",nil];
		};
		
		if (call life_coplevel >= 8) then
		{
			_return pushback ["arifle_MX_SW_Black_F",nil];
		};
	};

//---------------------------ZIVIL---------------------------------------

	case "rebel":
	{
		if (playerSide != civilian) exitWith {"Du bist kein Zivilist!"};
		if (life_level < 5) exitWith {"Du musst Level 5 erreicht haben um im Rebellenwaffenladen kaufen zu können!"};
		if (!license_civ_rebel) exitWith {"Du besitzt keine Rebellenausbildung!"};
		
		if (life_level >= 5) then
		{
			_return = [
				"Rebellenlager",
				["hgun_Pistol_heavy_02_F",nil],
				["hgun_PDW2000_F",nil],
				["SMG_01_F",nil],
				["SMG_02_F",nil],
				["hgun_Pistol_01_F",nil],
				["hgun_Rook40_F",nil],
				["hgun_ACPC2_F",nil]
			]
		};
		
		if (life_level >= 6) then
		{
			_return pushback ["arifle_SDAR_F",nil];
			_return pushback ["arifle_TRG20_F",nil];
			_return pushBack ["arifle_TRG21_F",nil];
			_return pushback ["arifle_Katiba_C_F",nil];
			_return pushback ["arifle_Katiba_F",nil];
			_return pushBack ["arifle_AKS_F",nil]; //Apex DLC
			_return pushBack ["arifle_CTAR_blk_F",nil]; //Apex DLC
		};
		
		if (life_level >= 7) then
		{
			_return pushback ["arifle_Mk20C_F",nil];
			_return pushback ["arifle_Mk20C_plain_F",nil];
			_return pushback ["arifle_Mk20_F",nil];
			_return pushback ["arifle_Mk20_plain_F",nil];
			_return pushback ["arifle_ARX_blk_F",nil]; //Apex DLC
		};
			
		if (life_level >= 8) then
		{
			_return pushback ["srifle_DMR_01_F",nil];
			_return pushback ["srifle_DMR_06_camo_F","Mk14 7.62 mm"]; //MM DLC
		};
		
		if (life_level >= 9) then
		{	
			_return pushback ["arifle_MX_SW_F",nil];
			_return pushback ["srifle_EBR_F",nil];
			_return pushback ["srifle_DMR_03_F","Mk-1 EMR 7.62 mm"]; //MM DLC					
		};
		if (life_level >= 10) then
		{	
			_return pushback ["arifle_AKM_F",nil];
			_return pushback ["srifle_DMR_07_blk_F",nil];		
		};
		if (life_level >= 11) then
		{	
			_return pushback ["LMG_03_F",nil];		
		};
	};
	
	case "rebelmag":
	{
		if (playerSide != civilian) exitWith {"Du bist kein Zivilist!"};
		if (life_level < 5) exitWith {"Du musst Level 5 erreicht haben um im Rebellenwaffenladen kaufen zu können!"};
		if (!license_civ_rebel) exitWith {"Du besitzt keine Rebellenausbildung!"};

		if (life_level >= 5) then
		{
			_return = [
				"Rebellenlager",
				["16Rnd_9x21_Mag",nil],
				["6Rnd_45ACP_Cylinder",nil],
				["9Rnd_45ACP_Mag",nil],
				["30Rnd_45ACP_Mag_SMG_01",nil],
				["30Rnd_9x21_Mag",nil],
				["acc_flashlight",nil],
				["acc_pointer_IR",nil],
				["optic_Aco",nil],
				["optic_ACO_grn",nil],
				["optic_Aco_smg",nil],
				["optic_ACO_grn_smg",nil],
				["optic_Holosight",nil],
				["optic_Yorris",nil],		
				["optic_Holosight_smg",nil],
				["optic_SOS",nil],
				["optic_Hamr",nil],
				["optic_MRCO",nil],
				["optic_Arco",nil],
				["optic_KHS_blk",nil],
				["optic_KHS_hex",nil],
				["optic_KHS_old",nil],
				["optic_KHS_tan",nil],
				["optic_ERCO_blk_F",nil],
				["muzzle_snds_L",nil],
				["muzzle_snds_acp",nil],
				["muzzle_snds_M",nil],
				["muzzle_snds_H",nil],
				["muzzle_snds_B",nil],
				["muzzle_snds_58_wdm_F",nil],
				["muzzle_snds_H_MG_blk_F",nil],
				["muzzle_snds_H_MG",nil],				
				["bipod_01_F_snd",nil],
				["bipod_01_F_blk",nil],
				["bipod_01_F_mtp",nil],
				["bipod_02_F_blk",nil],
				["bipod_02_F_tan",nil],
				["bipod_02_F_hex",nil],
				["bipod_03_F_blk",nil],
				["bipod_03_F_oli",nil],
				["ItemGPS",nil],
				["ItemMap","Reiseführer"],
				["ItemCompass",nil],
				["ToolKit",nil],
				["Rangefinder",nil],
				["FirstAidKit",nil],
				["NVGoggles_OPFOR",nil]
			];
		};
		
		if (life_level >= 6) then
		{
			_return pushback ["20Rnd_556x45_UW_mag",nil];
			_return pushback ["30Rnd_556x45_Stanag",nil];
			_return pushback ["30Rnd_545x39_Mag_F",nil];
			_return pushback ["30Rnd_580x42_Mag_F",nil];
			_return pushback ["30Rnd_65x39_caseless_green",nil];
		};

		if (life_level >= 8) then
		{
			_return pushback ["10Rnd_762x54_Mag",nil];
			_return pushback ["20Rnd_762x51_Mag",nil];
		};
		if (life_level >= 9) then
		{
			_return pushback ["100Rnd_65x39_caseless_mag",nil];
			_return pushback ["20Rnd_762x51_Mag",nil];
			_return pushback ["100Rnd_65x39_caseless_mag","6,5 mm 100-Schuss-Magazin"];
			_return pushback ["30Rnd_65x39_caseless_green",nil];
		};
		if (life_level >= 10) then
		{
			_return pushback ["30Rnd_762x39_Mag_F",nil];
			_return pushback ["20Rnd_650x39_Cased_Mag_F",nil];
		};
		if (life_level >= 11) then
		{
			_return pushback ["200Rnd_556x45_Box_F",nil];
		};
	};
	
	
	case "gun":
	{
		if (playerSide != civilian) exitWith {"Du bist kein Zivilist!"};
		if (life_level < 3) exitWith {"Du musst Level 3 erreicht haben um im Waffenladen kaufen zu können!"};
		if (!license_civ_gun) exitWith {"Du besitzt keine Waffenlizenz!"};

		if (life_level >= 3) then
		{
			_return = [
				"Waffenladen",
				["hgun_Rook40_F",nil],
				["hgun_Pistol_01_F",nil],
				["optic_ACO_grn_smg",nil],
				["16Rnd_9x21_Mag",nil]
			];
		};
		if (life_level >= 4) then
		{
			_return pushback ["hgun_ACPC2_F",nil];
			_return pushback ["hgun_Pistol_heavy_02_F",nil];
			_return pushback ["9Rnd_45ACP_Mag",nil];
			_return pushback ["6Rnd_45ACP_Cylinder",nil];
		};
		if (life_level >= 5) then
		{
			_return pushback ["hgun_PDW2000_F",nil];
			_return pushback ["SMG_01_F",nil];
			_return pushback ["30Rnd_9x21_Mag",nil];
			_return pushback ["30Rnd_45ACP_Mag_SMG_01",nil];
		};
	};

	case "genstore":
	{
		if (life_level < 1) exitWith {"Du musst Level 1 erreicht haben um im Zubehörladen kaufen zu können!"};
		
		if (life_level >= 1) then
		{
			_return = [
				"Zubehörladen",
				["ItemGPS",nil],
				["ItemMap","Reiseführer"],
				["ItemCompass",nil],
				["ItemWatch",nil],
				["Binocular",nil],
				["ToolKit",nil],
				["FirstAidKit",nil],
				["NVGoggles_OPFOR",nil]
			];
		};
	};
	
	case "party":
	{
		if (life_level < 1) exitWith {"Du musst Level 1 erreicht haben um Partylichter kaufen zu können!"};
		
		if (life_level >= 1) then
		{
			_return = [
				"Partylichter",
				["Chemlight_red",nil],
				["Chemlight_yellow",nil],
				["Chemlight_green",nil],
				["Chemlight_blue",nil]
			];
		};
	};

	case "presse":
	{
		if (!license_civ_presse) exitWith {"Du bist kein Reporter"};

		_return = [
			"Elektronikgroßhandel",
			["launch_B_Titan_short_F","Fernsehkamera"]
		];
	};
	
	case "jagd":
	{
		if (playerSide != civilian) exitWith {"Du bist kein Zivilist!"};
		if (life_level < 4) exitWith {"Du musst Level 4 erreicht haben um im Jagdhandel Waffen kaufen zu können!"};
		if (!license_civ_hunter) exitWith {"Du besitzt keinen Jagdschein!"};
		if (!license_civ_gun) exitWith {"Du besitzt keine Waffenlizenz!"};


		if (life_level >= 4) then
		{
			_return = [
				"Jagdwaffen",
				["srifle_DMR_01_SOS_F",nil],
				["srifle_DMR_06_camo_khs_F","Mk14 7.62 mm (DLC)"],
				["10Rnd_762x54_Mag",nil],
				["20Rnd_762x51_Mag",nil],
				["bipod_02_F_tan",nil],
				["ItemCompass",nil],
				["Binocular",nil],
				["ItemGPS",nil],
				["NVGoggles_OPFOR",nil]
			];
		};
	};
};

_return;