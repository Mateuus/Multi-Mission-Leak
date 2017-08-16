/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Jagdklamotten"];
_ret = [];

if(life_level < 4) exitWith {["Info: ","Du musst Level 4 erreicht haben um Jagdklamotten kaufen zu können!","#ff1000","#ffffff",7] call life_fnc_texttiles;};

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_C_HunterBody_grn",nil,5000];
	};
	
	//Hats
	case 1:
	{};
	
	//Glasses
	case 2:
	{
		_ret = [
			["G_Shades_Black",nil,110],
			["G_Shades_Blue",nil,120],
			["G_Shades_Green",nil,130],
			["G_Shades_Red",nil,140],
			["G_Spectacles",nil,150],
			["G_Spectacles_Tinted",nil,160],
			["G_Sport_Blackred",nil,170],
			["G_Sport_Checkered",nil,180],
			["G_Sport_Blackyellow",nil,190],
			["G_Sport_BlackWhite",nil,200],
			["G_Sport_Greenblack",nil,210],
			["G_Sport_Red",nil,220],
			["G_Squares",nil,230],
			["G_Aviator",nil,240],
			["G_Lady_Blue",nil,250],
			["G_Tactical_Black",nil,500],
			["G_Tactical_Clear",nil,700],
			["G_Lowprofile",nil,1000]
		];
	};
	
	//Vest
	case 3:
	{};
	
	//Backpacks
	case 4:
	{
		_ret = [
			["B_OutdoorPack_Base",nil,1000],
			["B_OutdoorPack_blk",nil,1000],
			["B_OutdoorPack_tan",nil,1000],
			["B_OutdoorPack_blu",nil,1000],
			["B_HuntingBackpack",nil,2000]
		];
	};
};

_ret;