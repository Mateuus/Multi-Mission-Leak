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
		if (worldName == "Australia") then
		{
			switch(life_coplevel) do
			{
				case 1;
				case 2;
				case 3;
				case 4:
				{
					[
						["RH_15Rnd_9x19_M9","9mm 15Rnd Rubber",25],
						["acc_flashlight",nil,100],
						["optic_Aco_smg",nil,100],
						["optic_Aco",nil,150],
						["optic_Holosight",nil,200],
						["optic_Holosight_smg",nil,200],
						["acc_pointer_IR",nil,500],
						["11Rnd_45ACP_Mag",nil,20],
						["hlc_30Rnd_9x19_SD_MP5","9mm 30Rnd Rubber",100],
						["hlc_30rnd_556x45_SPR","STANAG 30Rnd Rubber",100]
					]
				};
				case 5;
				case 6:
				{
					[
						["RH_15Rnd_9x19_M9","9mm 15Rnd Rubber",25],
						["acc_flashlight",nil,100],
						["optic_Aco_smg",nil,100],
						["optic_Aco",nil,150],
						["optic_Holosight",nil,200],
						["optic_Holosight_smg",nil,200],
						["acc_pointer_IR",nil,500],
						["11Rnd_45ACP_Mag",nil,20],
						["optic_MRD",nil,250]
					]
				};
			}
		}
		else
		{
			switch(life_coplevel) do
			{
				case 1;
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
						["optic_Arco",nil,400],
						["acc_pointer_IR",nil,500],
						["30Rnd_9x21_Mag","9mm 30Rnd Rubber",100],
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
						["11Rnd_45ACP_Mag",nil,20],
						["30Rnd_45ACP_Mag_SMG_01",nil,50],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Rubber",50],
						["acc_flashlight",nil,100],
						["optic_Aco_smg",nil,100],
						["optic_Holosight",nil,200],
						["optic_Holosight_smg",nil,200],
						["optic_MRCO",nil,350],
						["optic_Hamr",nil,500],
						["optic_Arco",nil,400],
						["optic_MRD",nil,250],
						["acc_pointer_IR",nil,500],
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
	};

	case "bounty":
	{
		if (worldName == "Australia") then
		{
			[
				["hlc_30Rnd_9x19_SD_MP5","9mm 30Rnd Rubber",100],
				["hlc_30rnd_556x45_SPR","STANAG 30Rnd Rubber",100],
				["optic_ACO_grn_smg",nil,600]
			]
		}
		else
		{
			[
				["16Rnd_9x21_Mag","9mm 16Rnd Rubber",50],
				["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Rubber",150],
				["30Rnd_556x45_Stanag_Tracer_Green","5.56 30Rnd Rubber",200],
				["optic_ACO_grn_smg",nil,600]
			]
		};
	};



	case "rebel":
	{
		switch(true) do
		{
			case (worldName == "Australia"):
			{
				[
					["CUP_optic_Kobra",nil,800],
					["hlc_optic_kobra",nil,800],
					["optic_Yorris",nil,400],
					["optic_Aco",nil,600],
					["optic_ACO_grn",nil,600],
					["optic_Aco_smg",nil,600],
					["optic_Holosight",nil,550],
					["optic_Holosight_smg",nil,550],
					["CUP_optic_Eotech533",nil,550],
					["CUP_optic_Eotech533Grey",nil,550],
					["CUP_optic_CompM4",nil,550],
					["CUP_optic_HoloBlack",nil,550],
					["CUP_optic_HoloDesert",nil,550],
					["CUP_optic_HoloWdl",nil,550],
					["CUP_optic_TrijiconRx01_black",nil,550],
					["CUP_optic_TrijiconRx01_desert",nil,550],
					["acc_flashlight",nil,100],
					["CUP_acc_Flashlight",nil,100],
					["CUP_acc_Flashlight_desert",nil,100],
					["CUP_acc_Flashlight_wdl",nil,100]
				]
			};
			default
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
					["optic_Aco",nil,600],
					["optic_Aco_smg",nil,600],
					["optic_Holosight",nil,550],
					["optic_Holosight_smg",nil,550],
					["optic_Hamr",nil,850],
					["optic_MRCO",nil,800],
					["optic_Arco",nil,800],
					["acc_flashlight",nil,100],
					["10Rnd_762x54_Mag",nil,150],
					["20Rnd_762x51_Mag",nil,150]
				]
			};
		};
	};
	
	case "turf":
	{
		if (worldName == "Australia") then
		{
			[
				["CUP_optic_Kobra",nil,800],
				["hlc_optic_kobra",nil,800],
				["optic_Yorris",nil,400],
				["optic_Aco",nil,600],
				["optic_ACO_grn",nil,600],
				["optic_Aco_smg",nil,600],
				["optic_Holosight",nil,550],
				["optic_Holosight_smg",nil,550],
				["CUP_optic_Eotech533",nil,550],
				["CUP_optic_Eotech533Grey",nil,550],
				["CUP_optic_CompM4",nil,550],
				["CUP_optic_HoloBlack",nil,550],
				["CUP_optic_HoloDesert",nil,550],
				["CUP_optic_HoloWdl",nil,550],
				["CUP_optic_TrijiconRx01_black",nil,550],
				["CUP_optic_TrijiconRx01_desert",nil,550],
				["acc_flashlight",nil,100],
				["CUP_acc_Flashlight",nil,100],
				["CUP_acc_Flashlight_desert",nil,100],
				["CUP_acc_Flashlight_wdl",nil,100]
			]
		}
		else
		{
			[
				["16Rnd_9x21_Mag",nil,50],
				["9Rnd_45ACP_Mag",nil,50],
				["30Rnd_9x21_Mag",nil,100],
				["6Rnd_45ACP_Cylinder",nil,100],
				["30Rnd_45ACP_Mag_SMG_01",nil,150],
				["20Rnd_556x45_UW_mag",nil,100],
				["30Rnd_556x45_Stanag",nil,100],
				["optic_Yorris",nil,400],
				["optic_Aco",nil,600],
				["optic_Aco_smg",nil,600],
				["optic_Holosight",nil,550],
				["optic_Holosight_smg",nil,550],
				["optic_MRCO",nil,800],
				["optic_Arco",nil,800],
				["acc_flashlight",nil,100]
			]
	};
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