/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"A-Team Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_Rangemaster","QT-Kleidung",15000],
			["U_B_GEN_Soldier_F","QT-Security",15000]
		];
	};
	
	//Hats
	case 1:
	{
		["H_Beret_gen_F","QT-SecurityBaret",15000]
	};
	
	//Glasses
	case 2:
	{
		[];
	};
	
	//Vest
	case 3:
	{
		[
			["V_PlateCarrier1_blk",nil,125000],
			["V_TacVest_gen_F","QT-SecurityWeste",15000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Carryall_oli",nil,4500],
			["B_Carryall_khk",nil,4500],
			["B_ViperHarness_blk_F",nil,4500]
		];
	};
};