/*
	File: fn_weaponAddons.sqf
	Author: John "Paratus" VanderZwet
*/

private["_shop", "_ret"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;

if(_shop == "") exitWith {closeDialog 0};

_ret = switch(_shop) do
{
	case "police_weapons":
	{
		switch(life_coplevel) do
		{
			case 1:
			{
				[
					["30Rnd_556x45_Stanag_Tracer_Green","5.56 30Rnd Rubber",50],
					["16Rnd_9x21_Mag","9mm 16Rnd Rubber",25],
					["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Rubber",50],
					["acc_flashlight",nil,100],
					["optic_Aco_smg",nil,100],
					["optic_Holosight",nil,200],
					["optic_Holosight_smg",nil,200],
					["acc_pointer_IR",nil,500],
					["30Rnd_9x21_Mag","9mm 30Rnd Rubber",100],
					["20Rnd_556x45_UW_mag",nil,100],
					["30Rnd_9x21_Mag_SMG_02",nil,50],
					["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","9mm 21Rnd Rubber",50],
					["30Rnd_556x45_Stanag",nil,100]				
				];
			};
			case 2;
			case 3:
			{
				[
					["30Rnd_65x39_caseless_mag",nil,50],
					["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Rubber",50],
					["30Rnd_556x45_Stanag",nil,50],
					["30Rnd_556x45_Stanag_Tracer_Green","5.56 30Rnd Rubber",50],
					["16Rnd_9x21_Mag","9mm 16Rnd Rubber",25],
					["30Rnd_45ACP_Mag_SMG_01",nil,50],
					["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Rubber",50],
					["acc_flashlight",nil,100],
					["optic_Aco_smg",nil,100],
					["optic_Holosight",nil,200],
					["optic_Holosight_smg",nil,200],
					["optic_MRCO",nil,350],
					["optic_Hamr",nil,500],
					["optic_Arco_blk_F",nil,400],
					["optic_ERCO_blk_F",nil,400],
					["acc_pointer_IR",nil,500],
					["30Rnd_9x21_Mag","9mm 30Rnd Rubber",100],
					["30Rnd_9x21_Mag_SMG_02",nil,50],
					["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","9mm 21Rnd Rubber",50],
					["20Rnd_762x51_Mag","7.62 20Rnd",100],
					["20Rnd_556x45_UW_mag",nil,100]						
				];
			};
			case 4;
			case 5;
			case 6:
			{
				[
					["30Rnd_65x39_caseless_mag",nil,50],
					["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Rubber",50],
					["30Rnd_556x45_Stanag",nil,50],
					["30Rnd_556x45_Stanag_Tracer_Green","5.56 30Rnd Rubber",50],
					["16Rnd_9x21_Mag","9mm 16Rnd Rubber",25],
					["30Rnd_9x21_Mag","9mm 30Rnd Rubber",100],
					["11Rnd_45ACP_Mag",nil,20],
					["30Rnd_45ACP_Mag_SMG_01",nil,50],
					["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Rubber",50],
					["acc_flashlight",nil,100],
					["optic_Aco_smg",nil,100],
					["optic_Holosight",nil,200],
					["optic_Holosight_smg",nil,200],
					["optic_MRCO",nil,350],
					["optic_Hamr",nil,500],
					["optic_Arco_blk_F",nil,400],
					["optic_ERCO_blk_F",nil,400],
					["optic_MRD",nil,250],
					["acc_pointer_IR",nil,500],
					["30Rnd_9x21_Mag_SMG_02",nil,50],
					["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","9mm 21Rnd Rubber",50],
					["20Rnd_762x51_Mag",nil,150],
					["20Rnd_556x45_UW_mag",nil,100]
				];
			};
			default
			{
				"You are not a Police Officer";
			};
		};
	};

	case "bounty":
	{
		[
			["30Rnd_9x21_Mag","9mm 30Rnd Rubber",50],
			["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Rubber",150],
			["30Rnd_556x45_Stanag_Tracer_Green","5.56 30Rnd Rubber",200],
			["30Rnd_65x39_caseless_mag_Tracer","6.5 30Rnd Rubber",200],
			["30Rnd_556x45_Stanag",nil,200],
			["optic_ACO_grn_smg",nil,300],
			["optic_ACO_grn",nil,300],
			["optic_ACO",nil,300],
			["optic_ACO_smg",nil,300],
			["optic_Holosight",nil,300],
			["optic_Holosight_blk_F",nil,300],
			["optic_Holosight_khk_F",nil,300],
			["optic_Holosight_smg",nil,300],
			["optic_Holosight_smg_blk_F",nil,300],
			["optic_MRCO",nil,1000],
			["optic_Hamr",nil,1000],
			["optic_Arco",nil,1000],
			["optic_Arco_blk_F",nil,1000],
			["optic_Arco_ghex_F",nil,1000],
			["optic_ERCO_blk_F",nil,1000],
			["optic_ERCO_khk_F",nil,1000],
			["optic_ERCO_snd_F",nil,1000]
		]
	};



	case "rebel":
	{
		[
			["16Rnd_9x21_Mag",nil,50],
			["9Rnd_45ACP_Mag",nil,50],
			["30Rnd_9x21_Mag",nil,100],
			["6Rnd_45ACP_Cylinder",nil,100],
			["30Rnd_45ACP_Mag_SMG_01",nil,150],
			["20Rnd_556x45_UW_mag",nil,100],
			["30Rnd_556x45_Stanag",nil,100],
			["30Rnd_65x39_caseless_green",nil,120],
			["200Rnd_65x39_cased_Box",nil,10000],
			["200Rnd_556x45_Box_F",nil,7000],
			["optic_Yorris",nil,400],
			["optic_ACO_grn_smg",nil,300],
			["optic_ACO_grn",nil,300],
			["optic_ACO",nil,300],
			["optic_ACO_smg",nil,300],
			["optic_Holosight",nil,300],
			["optic_Holosight_blk_F",nil,300],
			["optic_Holosight_khk_F",nil,300],
			["optic_Holosight_smg",nil,300],
			["optic_Holosight_smg_blk_F",nil,300],
			["optic_MRCO",nil,1000],
			["optic_Hamr",nil,1000],
			["optic_Arco",nil,1000],
			["optic_Arco_blk_F",nil,1000],
			["optic_Arco_ghex_F",nil,1000],
			["RPG7_F",nil,40000],
			["optic_ERCO_blk_F",nil,1000],
			["optic_ERCO_khk_F",nil,1000],
			["optic_ERCO_snd_F",nil,1000],
			["acc_flashlight",nil,100],
			["10Rnd_762x54_Mag",nil,150],
			["30Rnd_762x39_Mag_F",nil,150],
			["30Rnd_580x42_Mag_F",nil,100],
			["30Rnd_545x39_Mag_F",nil,100],
			["30Rnd_9x21_Mag_SMG_02",nil,100],
			["20Rnd_762x51_Mag",nil,150]
		]
	};
	
	case "turf":
	{
		[
			["16Rnd_9x21_Mag",nil,50],
			["9Rnd_45ACP_Mag",nil,50],
			["30Rnd_9x21_Mag",nil,100],
			["6Rnd_45ACP_Cylinder",nil,100],
			["30Rnd_45ACP_Mag_SMG_01",nil,150],
			["20Rnd_556x45_UW_mag",nil,100],
			["30Rnd_556x45_Stanag",nil,100],
			["30Rnd_65x39_caseless_green",nil,120],
			["200Rnd_65x39_cased_Box",nil,10000],
			["optic_Yorris",nil,400],
			["optic_ACO_grn_smg",nil,300],
			["optic_ACO_grn",nil,300],
			["optic_ACO",nil,300],
			["optic_ACO_smg",nil,300],
			["optic_Holosight",nil,300],
			["optic_Holosight_blk_F",nil,300],
			["optic_Holosight_khk_F",nil,300],
			["optic_Holosight_smg",nil,300],
			["optic_Holosight_smg_blk_F",nil,300],
			["optic_MRCO",nil,1000],
			["optic_Hamr",nil,1000],
			["optic_Arco",nil,1000],
			["optic_Arco_blk_F",nil,1000],
			["optic_Arco_ghex_F",nil,1000],
			["optic_ERCO_blk_F",nil,1000],
			["optic_ERCO_khk_F",nil,1000],
			["optic_ERCO_snd_F",nil,1000],
			["acc_flashlight",nil,100],
			["10Rnd_762x54_Mag",nil,150],
			["30Rnd_762x39_Mag_F",nil,150],
			["30Rnd_580x42_Mag_F",nil,100],
			["30Rnd_545x39_Mag_F",nil,100],
			["30Rnd_9x21_Mag_SMG_02",nil,100],
			["20Rnd_762x51_Mag",nil,150]
		]
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (worldName == "Australia"):
			{
				[
					["optic_Yorris",nil,200],
					["6Rnd_GreenSignal_F",nil,50],
					["6Rnd_RedSignal_F",nil,50],
					["optic_ACO_grn_smg",nil,600],
					["optic_MRD",nil,300],
					["RH_M6X",nil,100],
					["RH_X300",nil,100],
					["RH_X2",nil,100]
				]
			};
			default
			{
				[
					["16Rnd_9x21_Mag",nil,50],
					["9Rnd_45ACP_Mag",nil,50],
					["10Rnd_9x21_Mag",nil,50],
				//	["11Rnd_45ACP_Mag",nil,50],
					["30Rnd_9x21_Mag",nil,100],
					["20Rnd_556x45_UW_mag",nil,200],
					["6Rnd_GreenSignal_F",nil,50],
					["6Rnd_RedSignal_F",nil,50],
					["optic_ACO_grn",nil,600],
					["optic_ACO_grn_smg",nil,600]
				]
			};
		};
	};

	default { [] };
};

_ret;