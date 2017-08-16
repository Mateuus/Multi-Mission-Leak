/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call GTA_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Metro Taxi Service"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_Rangemaster","Taxi Uniform",250]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_press",nil,150]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2000],
			["B_FieldPack_ocamo",nil,4000],
			["B_Kitbag_mcamo",nil,6000],
			["B_Kitbag_cbr",nil,8000],
			["B_TacticalPack_oli",nil,10000],
			["B_Bergen_sgg",nil,12000],
			["B_Carryall_oli",nil,14000],
			["B_Carryall_khk",nil,14000]
		];
	};
};