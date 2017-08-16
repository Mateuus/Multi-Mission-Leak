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
		switch(life_coplevel) do
		{
			case 1:
			{
				["Cadet",
					[
						["hgun_P07_snds_F",nil,500],
						["SMG_05_F",nil,1000]
					]
				];
			};
			case 2:
			{
				["Constable",
					[
						["hgun_P07_snds_F",nil,500],
						["SMG_05_F",nil,1000],
						["SmokeShell",nil,100]
					]
				];
			};
			case 3:
			{
				["Corporal",
					[
						["hgun_P07_snds_F",nil,500],
						["SMG_05_F",nil,1000],
						["SmokeShell",nil,100]
					]
				];
			};
			case 4:
			{
				["Sergeant",
					[
						["hgun_P07_snds_F",nil,500],
						["SMG_05_F",nil,1000],
						["SmokeShell",nil,100]
					]
				];
			};
			case 5:
			{
				["Lieutenant",
					[
						["hgun_P07_snds_F",nil,500],
						["SMG_05_F",nil,1000],
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
						["SMG_05_F",nil,1000],
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
					_tempo = ["Bounty Hunter Shop",
						[
							["hgun_P07_F",nil,1000],
							["SMG_02_F",nil,5000],
							["SMG_01_F",nil,6000],
							["arifle_TRG20_F",nil,7000]
							//["arifle_TRG21_F",nil,7000]
						]
					];
					if(count life_honortalents > 0 && license_civ_bounty && (126 in life_talents)) then {
						_temp = _tempo select 1;
						_temp pushBack ["arifle_mx_f",nil,7000]; _temp pushBack ["arifle_mxc_f",nil,7000];
						_tempo set[1,_temp];
					};
					_tempo;
				};
				default
				{
					_tempo = ["Bounty Hunter Shop",
						[
							["hgun_P07_F",nil,1000]
						]
					];
					if(count life_honortalents > 0) then {
						_temp = _tempo select 1;
						_temp pushBack ["arifle_mx_f",nil,7000]; _temp pushBack ["arifle_mxc_f",nil,7000];
						_tempo set[1,_temp];
					};
					_tempo;
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
							["SMG_05_F",nil,6000],
							["arifle_sdar_F",nil,3500],
							["arifle_SPAR_01_khk_F",nil,5000],
							["arifle_SPAR_01_snd_F",nil,5000],
							["arifle_Mk20C_plain_F",nil,5000],
							["arifle_Mk20_plain_F",nil,5000],
							["arifle_TRG21_F",nil,5000],
							//["arifle_TRG20_F",nil,8000],
							["arifle_AKS_F",nil,4000],
							["arifle_CTAR_blk_F",nil,4000],
							["arifle_Katiba_F",nil,6000],
							["arifle_Katiba_C_F",nil,6000],
							["launch_RPG7_F",nil,10000],
							["LMG_03_F",nil,25000],
							["LMG_Mk200_F",nil,35000],
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
							["SMG_05_F",nil,6000],
							["arifle_sdar_F",nil,3500],
							["arifle_SPAR_01_khk_F",nil,5000],
							["arifle_SPAR_01_snd_F",nil,5000],
							["arifle_Mk20C_plain_F",nil,5000],
							["arifle_Mk20_plain_F",nil,5000],
							["arifle_TRG21_F",nil,5000],
							//["arifle_TRG20_F",nil,8000],
							["arifle_AKS_F",nil,4000],
							["arifle_CTAR_blk_F",nil,4000],
							["arifle_Katiba_F",nil,6000],
							["arifle_Katiba_C_F",nil,6000],
							["launch_RPG7_F",nil,10000],
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
		["Gang Gats",
			[
				["hgun_Rook40_F",nil,1500],
				["hgun_ACPC2_F",nil,3000],
				["hgun_PDW2000_F",nil,5000],
				["hgun_Pistol_heavy_02_F",nil,3500],
				["SMG_01_F",nil,6000],
				["SMG_05_F",nil,6000],
				["arifle_sdar_F",nil,3500],
				["arifle_SPAR_01_khk_F",nil,5000],
				["arifle_SPAR_01_snd_F",nil,5000],
				["arifle_Mk20C_plain_F",nil,5000],
				["arifle_Mk20_plain_F",nil,5000],
				["arifle_TRG21_F",nil,5000],
				//["arifle_TRG20_F",nil,8000],
				["arifle_AKS_F",nil,4000],
				["arifle_CTAR_blk_F",nil,4000],
				["arifle_Katiba_F",nil,6000],
				["arifle_Katiba_C_F",nil,6000],
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



	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Pistol_01_F",nil,1000],
						["hgun_Rook40_F",nil,1500],
						["hgun_ACPC2_F",nil,3000],
					//	["hgun_Pistol_heavy_01_F",nil,3500],
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
	_list set [count _list, ["arifle_AKM_F",nil,7000]];
	_list set [count _list, ["arifle_AK12_F",nil,9000]];
	_list set [count _list, ["srifle_DMR_01_F",nil,8000]];
	_list set [count _list, ["srifle_EBR_F",nil,8000]];
	_list set [count _list, ["srifle_DMR_03_khaki_F",nil,9000]];
	_list set [count _list, ["srifle_DMR_03_multicam_F",nil,9000]];
	_list set [count _list, ["srifle_DMR_03_tan_F",nil,9000]];
	_list set [count _list, ["srifle_DMR_03_woodland_F",nil,9000]];
	_list set [count _list, ["srifle_DMR_06_olive_F",nil,9000]];
	_list set [count _list, ["srifle_DMR_06_camo_F",nil,9000]];
	_list set [count _list, ["arifle_SPAR_03_khk_F",nil,10000]];
	_list set [count _list, ["arifle_SPAR_03_snd_F",nil,10000]];
};

if (_shop == "police_weapons") then
{
	if (77 in life_talents) then
	{
		_list set [count _list, ["arifle_Mk20_F",nil,1500]];
		_list pushBack ["arifle_SPAR_01_blk_F",nil,1800];
	};
	if ((life_coplevel > 1) && (78 in life_talents)) then
	{
		_list set [count _list, ["arifle_MXC_Black_F",nil,2100]];
		_list set [count _list, ["arifle_sdar_F",nil,1200]];
	};
	if ((life_coplevel > 1) && (80 in life_talents)) then
	{
		_list set [count _list, ["arifle_MX_Black_F",nil,2400]];
	};
	if ((life_coplevel > 1) && (82 in life_talents)) then
	{
		_list set [count _list, ["MiniGrenade","Flashbang",250]];
	};
	if ((life_coplevel > 2) && (81 in life_talents)) then
	{
		_list set [count _list, ["arifle_MXM_Black_F",nil,3000]];
	};
	if ((life_coplevel > 4) && (81 in life_talents)) then
	{
		_list set [count _list, ["srifle_DMR_03_F",nil,4800]];
		_list set [count _list, ["arifle_SPAR_03_blk_F",nil,5400]];
	};
	if (life_coprole in ["detective","all"]) then
	{
		if (77 in life_talents) then
		{
			_list set [count _list, ["arifle_SPAR_01_khk_F",nil,1800]],
			_list set [count _list, ["arifle_SPAR_01_snd_F",nil,1800]],
		};
		if (80 in life_talents) then
		{
			_list set [count _list, ["arifle_mxc_f",nil,2100]];
			_list set [count _list, ["arifle_mx_f",nil,2400]];
		};
	};
};

if ((_shop == "genstore") && (12 in life_talents)) then
{
	_list set [count _list, ["Medikit",nil,200]];
};

_ret set[1, _list];

_ret;
