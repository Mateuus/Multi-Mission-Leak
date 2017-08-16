private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],
				//Pistolen schwierigkeit: 1
				["hgun_Rook40_F", ["copper_ingot",7,"iron_ingot",4]],
				["hgun_Pistol_heavy_02_F", ["copper_ingot",10,"iron_ingot",7]],
				["hgun_ACPC2_F", ["copper_ingot",8,"iron_ingot",5]],
				["hgun_Pistol_heavy_01_F", ["copper_ingot",9,"iron_ingot",6]],
				//Mps schwierigkeit: 2
				["hgun_PDW2000_F", ["copper_ingot",20,"iron_ingot",17,"zinc_ingot",14]],
				["SMG_01_F", ["copper_ingot",25,"iron_ingot",22,"zinc_ingot",19]],
				//Rifle Legal  	schwierigkeit: 3
				["arifle_SDAR_F", ["copper_ingot",30,"iron_ingot",27,"zinc_ingot",19]],
				["arifle_TRG20_F", ["copper_ingot",35,"iron_ingot",32,"zinc_ingot",29]],
				//Rifle Illegal schwierigkeit:4
				["arifle_TRG21_F", ["copper_ingot",40,"iron_ingot",37,"zinc_ingot",34]],
				//Rifle Legal schwierigkeit:5
				["arifle_Mk20_F", ["copper_ingot",20,"iron_ingot",17,"zinc_ingot",14,"mercury",20]],
				//Rifle Illegal KATIBA REIHE schwierigkeit:5,5
				["arifle_Katiba_F", ["copper_ingot",20,"iron_ingot",17,"zinc_ingot",14,"mercury",20]],
				["arifle_Katiba_GL_F", ["copper_ingot",30,"iron_ingot",27,"zinc_ingot",24,"mercury",30]],
				//Rifle Illegal MX REIHE schwierigkeit:6
				["arifle_MX_F", ["copper_ingot",20,"iron_ingot",17,"zinc_ingot",14,"mercury",20,"didymium",10]],
				["arifle_MXM_F", ["copper_ingot",21,"iron_ingot",18,"zinc_ingot",15,"mercury",21,"didymium",11]],
				["arifle_MX_SW_F", ["copper_ingot",22,"iron_ingot",19,"zinc_ingot",16,"mercury",22,"didymium",15]],
				//Rifle Illegal schwierigkeit:6,5
				["srifle_DMR_01_F", ["copper_ingot",23,"iron_ingot",20,"zinc_ingot",17,"mercury",23,"didymium",20]],
				//Rifle Illegal schwierigkeit:7
				["LMG_Mk200_F", ["copper_ingot",30,"iron_ingot",27,"zinc_ingot",24,"mercury",25,"didymium",10,"lead_ingot",20,"aluminium_ingot",10]],
				//Rifle Illegal schwierigkeit:8
				["srifle_EBR_F", ["copper_ingot",35,"iron_ingot",32,"zinc_ingot",29,"mercury",30,"didymium",15,"lead_ingot",25,"aluminium_ingot",15]],
				//Rifle Illegal MK1 ALLE TARNUNGEN schwierigkeit:9
				["srifle_DMR_03_F", ["copper_ingot",40,"iron_ingot",37,"zinc_ingot",34,"mercury",35,"didymium",20,"lead_ingot",25,"aluminium_ingot",20]],
				["srifle_DMR_03_khaki_F", ["copper_ingot",41,"iron_ingot",38,"zinc_ingot",35,"mercury",36,"didymium",21,"lead_ingot",26,"aluminium_ingot",21]],
				["srifle_DMR_03_tan_F", ["copper_ingot",42,"iron_ingot",39,"zinc_ingot",36,"mercury",37,"didymium",22,"lead_ingot",27,"aluminium_ingot",22]],
				["srifle_DMR_03_multicam_F", ["copper_ingot",43,"iron_ingot",40,"zinc_ingot",37,"mercury",38,"didymium",23,"lead_ingot",28,"aluminium_ingot",23]],
				["srifle_DMR_03_woodland_F", ["copper_ingot",44,"iron_ingot",41,"zinc_ingot",38,"mercury",39,"didymium",24,"lead_ingot",29,"aluminium_ingot",24]],
				//Rifle Illegal MK 14 Alle Tarnungen
				["srifle_DMR_06_camo_F", ["copper_ingot",44,"iron_ingot",41,"zinc_ingot",38,"mercury",39,"didymium",24,"lead_ingot",29,"aluminium_ingot",24]],
				["srifle_DMR_06_olive_F", ["copper_ingot",44,"iron_ingot",41,"zinc_ingot",38,"mercury",39,"didymium",24,"lead_ingot",29,"aluminium_ingot",24]],
				//Rifle Illegal Mar-10 ALLE TARNUNGEN
				["srifle_DMR_02_F", ["copper_ingot",20,"iron_ingot",35,"zinc_ingot",30,"dino",10,"goldbar",15,"whitegold",10]],
				["srifle_DMR_02_camo_F", ["copper_ingot",21,"iron_ingot",36,"zinc_ingot",31,"dino",11,"goldbar",16,"whitegold",11]],
				["srifle_DMR_02_sniper_F", ["copper_ingot",22,"iron_ingot",37,"zinc_ingot",32,"dino",12,"goldbar",17,"whitegold",12]]

			];
	};
	
	case "ammo":
	{
	
		_return = [
				//Pistolen Munition
				["16Rnd_9x21_Mag", ["blackpowder",3,"copper_ingot",7,"iron_ingot",4]],
				["6Rnd_45ACP_Cylinder", ["blackpowder",10,"copper_ingot",10,"iron_ingot",7]],
				["9Rnd_45ACP_Mag", ["blackpowder",9,"copper_ingot",8,"iron_ingot",5]],
				["11Rnd_45ACP_Mag", ["blackpowder",12,"copper_ingot",9,"iron_ingot",6]],
				//MPS Munition
				["30Rnd_9x21_Mag", ["blackpowder",30,"copper_ingot",23,"iron_ingot",20,"zinc_ingot",10]],
				["30Rnd_45ACP_Mag_SMG_01", ["blackpowder",35,"copper_ingot",25,"iron_ingot",22,"zinc_ingot",19]],
				//Rifle Legal Munition
				["20Rnd_556x45_UW_mag", ["blackpowder",20,"copper_ingot",30,"iron_ingot",27,"zinc_ingot",24]],
				["30Rnd_556x45_Stanag", ["blackpowder",30,"copper_ingot",35,"iron_ingot",32,"zinc_ingot",29]],
				//Rifle Illegal KATIBA Munition
				["30Rnd_65x39_caseless_green", ["blackpowder",30,"copper_ingot",25,"iron_ingot",22,"zinc_ingot",19,"mercury",25]],
				//Rifle Illegal MX REIHE schwierigkeit:6
				["30Rnd_65x39_caseless_mag", ["blackpowder",30,"copper_ingot",20,"iron_ingot",17,"zinc_ingot",14,"mercury",20,"didymium",10]],
				["100Rnd_65x39_caseless_mag", ["blackpowder",100,"copper_ingot",25,"iron_ingot",20,"zinc_ingot",19,"mercury",25,"didymium",15]],
				//Rifle Illegal Rahim Munition
				["10Rnd_762x54_Mag", ["blackpowder",10,"copper_ingot",20,"iron_ingot",17,"zinc_ingot",14,"mercury",20,"didymium",20]],
				//Rifle Illegal Mk200 Munition
				["200Rnd_65x39_cased_Box", ["blackpowder",200,"copper_ingot",30,"iron_ingot",27,"zinc_ingot",24,"mercury",25,"didymium",10,"lead_ingot",20,"aluminium_ingot",10]],				
				//Rifle Illegal MK1/MK14/MK18 Muntion
				["20Rnd_762x51_Mag", ["blackpowder",20,"copper_ingot",30,"iron_ingot",27,"zinc_ingot",24,"mercury",25,"didymium",10,"lead_ingot",20,"aluminium_ingot",10]],
				//Rifle Illegal Mar-10 Munition
				["10Rnd_338_Mag", ["blackpowder",10,"copper_ingot",10,"iron_ingot",25,"zinc_ingot",20,"dino",5,"goldbar",5,"whitegold",1]]				
		];
	
	};
	case "uniform":
	{
		_return = [
			];
	};
	case "Westen":
	{
		_return = [
			];
	};

	case "backpack":
	{
		_return = [
			];
	};


};

_return; 