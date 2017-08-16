/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine & John "Paratus" VanderZwet
*/
private["_shop", "_ret"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

_ret = switch(_shop) do
{
	case "police_equipment":
	{
		if (life_coplevel > 0) then {
			["Police General Equipment",
				[
					["ToolKit",nil,80],
					["FirstAidKit",nil,25],
					["Medikit",nil,100],
					["Binocular",nil,15],
					["B_UavTerminal",nil,2000],
					["NVGoggles_OPFOR",nil,100],
					["ItemGPS",nil,0],
					["ItemMap",nil,0],
					["ItemCompass",nil,0],
					["ItemWatch",nil,0]
				]
			];
		} else {
			"You are not a Police Officer";
		};
	};

	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"You are not an EMT Paramedic"};
			default {
				["Hospital EMT Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,15],
						["Medikit",nil,0],
						["NVGoggles",nil,100],
						["ItemRadio",nil,50]
					]
				];
			};
		};
	};

	case "police_weapons":
	{
		if (worldName == "Australia") then
		{
			switch(life_coplevel) do
			{
				case 1:
				{
					["Cadet",
						[
							["RH_m9",nil,500],
							["RH_m9c",nil,900]
						]
					];
				};
				case 2:
				{
					["Constable",
						[
							["RH_m9",nil,500],
							["RH_m9c",nil,900],
							["SmokeShell",nil,100]
						]
					];
				};
				case 3:
				{
					["Corporal",
						[
							["RH_m9",nil,500],
							["RH_m9c",nil,900],
							["SmokeShell",nil,100]
						]
					];
				};
				case 4:
				{
					["Sergeant",
						[
							["RH_m9",nil,500],
							["RH_m9c",nil,900],
							["SmokeShell",nil,100]
						]
					];
				};
				case 5:
				{
					["Lieutenant",
						[
							["RH_m9",nil,500],
							["RH_m9c",nil,900],
							["hgun_Pistol_heavy_01_F",nil,700],
							["SmokeShell",nil,100]
						]
					];
				};
				case 6:
				{
					["Captain",
						[
							["RH_m9",nil,500],
							["RH_m9c",nil,900],
							["hgun_Pistol_heavy_01_F",nil,700],
							["SmokeShell",nil,100]
						]
					];
				};
				default
				{
					"You are not a Police Officer";
				};
			};
		}
		else
		{
			switch(life_coplevel) do
			{
				case 1:
				{
					["Cadet",
						[
							["hgun_P07_snds_F",nil,500]
						]
					];
				};
				case 2:
				{
					["Constable",
						[
							["hgun_P07_snds_F",nil,500],
							["SmokeShell",nil,100]
						]
					];
				};
				case 3:
				{
					["Corporal",
						[
							["hgun_P07_snds_F",nil,500],
							["SmokeShell",nil,100]
						]
					];
				};
				case 4:
				{
					["Sergeant",
						[
							["hgun_P07_snds_F",nil,500],
							["SmokeShell",nil,100]
						]
					];
				};
				case 5:
				{
					["Lieutenant",
						[
							["hgun_P07_snds_F",nil,500],
							["hgun_Pistol_heavy_01_F",nil,700],
							["SmokeShell",nil,100]
						]
					];
				};
				case 6:
				{
					["Captain",
						[
							["hgun_P07_snds_F",nil,500],
							["hgun_Pistol_heavy_01_F",nil,700],
							["SmokeShell",nil,100]
						]
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
			switch(true) do
			{
				case (!license_civ_bounty): {"You don't have a bounty hunter license!"};
				case (5 in life_talents):
				{
					["Bounty Hunter Shop",
						[
							["hgun_P07_F",nil,1000],
							["hlc_smg_MP5N",nil,6000],
							["hlc_rifle_Colt727",nil,12000]
						]
					];
				};
				default
				{
					["Bounty Hunter Shop",
						[
							["hgun_P07_F",nil,1000]
						]
					];
				};
			};
		}
		else
		{
			switch(true) do
			{
				case (!license_civ_bounty): {"You don't have a bounty hunter license!"};
				case (5 in life_talents):
				{
					["Bounty Hunter Shop",
						[
							["hgun_P07_F",nil,1000],
							["SMG_01_F",nil,6000],
							["arifle_TRG20_F",nil,7000]
						]
					];
				};
				default
				{
					["Bounty Hunter Shop",
						[
							["hgun_P07_F",nil,1000]
						]
					];
				};
			};
		};
	};



	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are a cop!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			case (worldName == "Australia"):
			{
				_point = life_capture_list select 0;
				if ((_point select 1) != "0" && (_point select 1) == life_gang && (_point select 2) == 1) then
				{
					["Your Jihadi Shop",
						[
							["RH_tec9",nil,2500],
							["RH_muzi",nil,6000],
							["RH_vz61",nil,3500],
							["LMG_Mk200_F",nil,50000],
							["hlc_rifle_ak47",nil,10000],
							["hlc_rifle_ak12",nil,9500],
							["hlc_rifle_aku12",nil,9500],
							["hlc_rifle_ak74",nil,11000],
							["hlc_rifle_ak74_dirty",nil,10700],
							["CUP_arifle_AKS_Gold",nil,18000],
							["hlc_rifle_aks74",nil,10000],
							["hlc_rifle_aks74u",nil,9000],
							["hlc_rifle_aek971",nil,11000],
							["hlc_rifle_honeybadger",nil,20000],
							["CUP_arifle_FNFAL",nil,15000],
							["CUP_arifle_FNFAL_railed",nil,17000],
							["CUP_arifle_FNFAL_OSW",nil,15000],
							["arifle_Katiba_F",nil,16000],
							["arifle_Katiba_C_F",nil,15000],
							["CUP_srifle_LeeEnfield",nil,10000],
							["CUP_srifle_LeeEnfield_rail",nil,12000],
							["HandGrenade",nil,5000],
							["ToolKit",nil,80],
							["FirstAidKit",nil,25],
							["ItemGPS",nil,250],
							["Binocular",nil,150],
							["NVGoggles",nil,100],
							["ItemMap",nil,0],
							["SmokeShell",nil,100],
							["SmokeShellRed",nil,100],
							["SmokeShellGreen",nil,100],
							["SmokeShellYellow",nil,100],
							["SmokeShellPurple",nil,100],
							["SmokeShellBlue",nil,100],
							["SmokeShellOrange",nil,100]
						]
					];
				}
				else
				{
					["Mohammed's Jihadi Shop",
						[
							["RH_tec9",nil,2500],
							["RH_muzi",nil,6000],
							["RH_vz61",nil,3500],
							["RH_vz61",nil,3500],
							["hlc_rifle_ak47",nil,10000],
							["hlc_rifle_ak12",nil,9500],
							["hlc_rifle_aku12",nil,9500],
							["hlc_rifle_ak74",nil,11000],
							["hlc_rifle_ak74_dirty",nil,10700],
							["hlc_rifle_aks74",nil,10000],
							["hlc_rifle_aks74u",nil,9000],
							["hlc_rifle_aek971",nil,11000],
							["hlc_rifle_honeybadger",nil,20000],
							["CUP_arifle_FNFAL",nil,15000],
							["CUP_arifle_FNFAL_railed",nil,17000],
							["CUP_arifle_FNFAL_OSW",nil,15000],
							["arifle_Katiba_F",nil,16000],
							["arifle_Katiba_C_F",nil,15000],
							["CUP_srifle_LeeEnfield",nil,10000],
							["CUP_srifle_LeeEnfield_rail",nil,12000],
							["HandGrenade",nil,5000],
							["ToolKit",nil,80],
							["FirstAidKit",nil,25],
							["ItemGPS",nil,250],
							["Binocular",nil,150],
							["NVGoggles",nil,100],
							["ItemMap",nil,0],
							["SmokeShell",nil,100],
							["SmokeShellRed",nil,100],
							["SmokeShellGreen",nil,100],
							["SmokeShellYellow",nil,100],
							["SmokeShellPurple",nil,100],
							["SmokeShellBlue",nil,100],
							["SmokeShellOrange",nil,100]
						]
					];
				};
			};
			default
			{
				_point = life_capture_list select 0;
				if ((_point select 1) != "0" && (_point select 1) == life_gang && (_point select 2) == 1) then
				{
					["Your Jihadi Shop",
						[
							["hgun_Rook40_F",nil,1500],
							["hgun_ACPC2_F",nil,3000],
							["hgun_PDW2000_F",nil,5000],
							["hgun_Pistol_heavy_02_F",nil,3500],
							["SMG_01_F",nil,6000],
							["arifle_sdar_F",nil,3500],
							["arifle_Mk20C_plain_F",nil,8000],
							["arifle_TRG21_F",nil,8000],
							["arifle_Katiba_F",nil,9500],
							["arifle_Katiba_C_F",nil,9000],
							["LMG_Mk200_F",nil,50000],
							["HandGrenade",nil,5000],
							["ToolKit",nil,80],
							["FirstAidKit",nil,25],
							["ItemGPS",nil,250],
							["Binocular",nil,150],
							["NVGoggles",nil,100],
							["ItemMap",nil,0],
							["SmokeShell",nil,100],
							["SmokeShellRed",nil,100],
							["SmokeShellGreen",nil,100],
							["SmokeShellYellow",nil,100],
							["SmokeShellPurple",nil,100],
							["SmokeShellBlue",nil,100],
							["SmokeShellOrange",nil,100]
						]
					];
				}
				else
				{
					["Mohammed's Jihadi Shop",
						[
							["hgun_Rook40_F",nil,1500],
							["hgun_ACPC2_F",nil,3000],
							["hgun_PDW2000_F",nil,5000],
							["hgun_Pistol_heavy_02_F",nil,3500],
							["SMG_01_F",nil,6000],
							["arifle_sdar_F",nil,3500],
							["arifle_Mk20C_plain_F",nil,8000],
							["arifle_TRG21_F",nil,8000],
							["arifle_Katiba_F",nil,9500],
							["arifle_Katiba_C_F",nil,9000],
							["HandGrenade",nil,5000],
							["ToolKit",nil,80],
							["FirstAidKit",nil,25],
							["ItemGPS",nil,250],
							["Binocular",nil,150],
							["NVGoggles",nil,100],
							["ItemMap",nil,0],
							["SmokeShell",nil,100],
							["SmokeShellRed",nil,100],
							["SmokeShellGreen",nil,100],
							["SmokeShellYellow",nil,100],
							["SmokeShellPurple",nil,100],
							["SmokeShellBlue",nil,100],
							["SmokeShellOrange",nil,100]
						]
					];
				};
			};
		};
	};
	
	
	
	case "turf":
	{
		if (worldName == "Australia") then
		{
			["Gang Gats",
				[
					["RH_tec9",nil,2500],
					["RH_muzi",nil,6000],
					["RH_vz61",nil,3500],
					["RH_vz61",nil,3500],
					["hlc_rifle_ak47",nil,10000],
					["hlc_rifle_ak12",nil,9500],
					["hlc_rifle_aku12",nil,9500],
					["hlc_rifle_ak74",nil,11000],
					["hlc_rifle_ak74_dirty",nil,10700],
					["hlc_rifle_aks74",nil,10000],
					["hlc_rifle_aks74u",nil,9000],
					["hlc_rifle_aek971",nil,11000],
					["CUP_srifle_LeeEnfield",nil,10000],
					["CUP_srifle_LeeEnfield_rail",nil,12000],
					["HandGrenade",nil,5000],
					["ToolKit",nil,80],
					["FirstAidKit",nil,25],
					["ItemGPS",nil,250],
					["Binocular",nil,150],
					["NVGoggles",nil,100],
					["ItemMap",nil,0],
					["SmokeShell",nil,100],
					["SmokeShellRed",nil,100],
					["SmokeShellGreen",nil,100],
					["SmokeShellYellow",nil,100],
					["SmokeShellPurple",nil,100],
					["SmokeShellBlue",nil,100],
					["SmokeShellOrange",nil,100]
				]
			];
		}
		else
		{
			["Gang Gats",
				[
					["hgun_Rook40_F",nil,1500],
					["hgun_ACPC2_F",nil,3000],
					["hgun_PDW2000_F",nil,5000],
					["hgun_Pistol_heavy_02_F",nil,3500],
					["SMG_01_F",nil,6000],
					["arifle_sdar_F",nil,3500],
					["arifle_Mk20C_plain_F",nil,8000],
					["arifle_TRG21_F",nil,8000],
					["HandGrenade",nil,5000],
					["ToolKit",nil,80],
					["FirstAidKit",nil,25],
					["ItemGPS",nil,250],
					["Binocular",nil,150],
					["NVGoggles",nil,100],
					["ItemMap",nil,0],
					["SmokeShell",nil,100],
					["SmokeShellRed",nil,100],
					["SmokeShellGreen",nil,100],
					["SmokeShellYellow",nil,100],
					["SmokeShellPurple",nil,100],
					["SmokeShellBlue",nil,100],
					["SmokeShellOrange",nil,100]
				]
			];
		};
	};
	
	

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			case (worldName == "Australia"):
			{
				["Dundee's Firearms",
					[
						["hgun_Pistol_heavy_02_F",nil,800],
						["arifle_sdar_F","SDAR (Illegal)",3000],
						["hgun_Pistol_Signal_F","Flare Starter Gun",500],
						["RH_python",nil,1000],
						["hgun_ACPC2_F",nil,950],
						["CUP_hgun_Duty",nil,1100],
						["CUP_hgun_Compact",nil,1100],
						["CUP_hgun_Phantom",nil,1100],
						["RH_deagle",nil,2000],
						["RH_Deaglem",nil,2200],
						["RH_Deagles",nil,2300],
						["RH_Deagleg",nil,3300],
						["RH_fnp45",nil,1200],
						["RH_fnp45t",nil,1200],
						["RH_g17",nil,1000],
						["RH_g18",nil,5000],
						["RH_g19",nil,1100],
						["RH_g19t",nil,1100],
						["RH_gsh18",nil,1150],
						["RH_kimber_nw",nil,1300],
						["RH_kimber",nil,1400],
						["RH_m1911",nil,1300],
						["RH_mateba",nil,2500],
						["RH_mp412",nil,4000],
						["CUP_hgun_PB6P9",nil,1200],
						["RH_mk2",nil,1300],
						["RH_p226",nil,1250],
						["RH_sw659",nil,1350],
						["RH_bull",nil,3000],
						["RH_bullb",nil,3000],
						["RH_ttracker",nil,1500],
						["RH_ttracker_g",nil,2000],
						["RH_tt33",nil,1500],
						["RH_fn57",nil,1600],
						["RH_fn57_g",nil,1600],
						["RH_fn57_t",nil,1600],
						["RH_uspm",nil,2500],
						["RH_usp",nil,2300],
						["RH_vp70",nil,1300]
					]
				];
			};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_ACPC2_F",nil,3000],
						["hgun_PDW2000_F",nil,5000],
						["arifle_sdar_F","SDAR (Illegal)",4000],
						["hgun_Pistol_Signal_F","Flare Starter Gun",500]
					]
				];
			};
		};
	};

	case "genstore":
	{
		[format["%1 General Store", worldName],
			[
				["ToolKit",nil,80],
				["FirstAidKit",nil,25],
				["NVGoggles",nil,100],
				["Binocular",nil,150],
				["ItemRadio",nil,50],
				["ItemGPS",nil,250],
				["ItemMap",nil,10],
				["ItemCompass",nil,10],
				["ItemWatch",nil,10]
			]
		];
	};

	case "gas":
	{
		[format["%1 Gas Store", worldName],
			[
				["ToolKit",nil,80],
				["FirstAidKit",nil,25]
			]
		];
	};
};

_list = _ret select 1;

if ((_shop == "rebel") && (31 in life_talents)) then
{
	if (worldName == "Australia") then
	{
		_list set [count _list, ["hlc_rifle_akm",nil,10000]];
		_list set [count _list, ["CUP_srifle_AWM_des",nil,10000]];
		_list set [count _list, ["CUP_srifle_AWM_wdl",nil,10000]];
	}
	else
	{
		_list set [count _list, ["srifle_DMR_01_F",nil,10000]];
		_list set [count _list, ["srifle_EBR_F",nil,11000]];
		_list set [count _list, ["srifle_DMR_03_khaki_F",nil,15000]];
		_list set [count _list, ["srifle_DMR_03_multicam_F",nil,15000]];
		_list set [count _list, ["srifle_DMR_03_tan_F",nil,15000]];
		_list set [count _list, ["srifle_DMR_03_woodland_F",nil,15000]];
		_list set [count _list, ["srifle_DMR_06_olive_F",nil,15000]];
		_list set [count _list, ["srifle_DMR_06_camo_F",nil,15000]];
	};
};

if (_shop == "police_weapons") then
{
	if (worldName == "Australia") then
	{
		if (77 in life_talents) then
		{
			_list set [count _list, ["hlc_smg_MP5N",nil,2500]];
		};
		if ((life_coplevel > 1) && (78 in life_talents)) then
		{
			_list set [count _list, ["hlc_smg_mp5k_PDW",nil,3500]];
			_list set [count _list, ["arifle_sdar_F",nil,2000]];
		};
		if ((life_coplevel > 1) && (80 in life_talents)) then
		{
			_list set [count _list, ["hlc_smg_mp5a4",nil,4000]];
			_list set [count _list, ["hlc_rifle_vendimus",nil,5000]];
		};
		if ((life_coplevel > 1) && (82 in life_talents)) then
		{
			_list set [count _list, ["MiniGrenade","Flashbang",250]];
		};
		if ((life_coplevel > 2) && (81 in life_talents)) then
		{
			_list set [count _list, ["hlc_rifle_Colt727",nil,8000]];
		};
		if ((life_coplevel > 4) && (81 in life_talents)) then
		{
			_list set [count _list, ["hlc_rifle_bcmjack",nil,9000]];
		};
	}
	else
	{
		if (77 in life_talents) then
		{
			_list set [count _list, ["arifle_Mk20_F",nil,2500]];
		};
		if ((life_coplevel > 1) && (78 in life_talents)) then
		{
			_list set [count _list, ["arifle_MXC_Black_F",nil,3500]];
			_list set [count _list, ["arifle_sdar_F",nil,2000]];
		};
		if ((life_coplevel > 1) && (80 in life_talents)) then
		{
			_list set [count _list, ["arifle_MX_Black_F",nil,4000]];
		};
		if ((life_coplevel > 1) && (82 in life_talents)) then
		{
			_list set [count _list, ["MiniGrenade","Flashbang",250]];
		};
		if ((life_coplevel > 2) && (81 in life_talents)) then
		{
			_list set [count _list, ["arifle_MXM_Black_F",nil,5000]];
		};
		if ((life_coplevel > 4) && (81 in life_talents)) then
		{
			_list set [count _list, ["srifle_DMR_03_F",nil,8000]];
		};
	};
};

if ((_shop == "genstore") && (12 in life_talents)) then
{
	_list set [count _list, ["Medikit",nil,200]];
};

_ret set[1, _list];

_ret;