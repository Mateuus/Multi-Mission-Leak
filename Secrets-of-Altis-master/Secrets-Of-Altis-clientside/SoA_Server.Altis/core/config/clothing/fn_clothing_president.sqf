/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Andreas' Präsidentenkleidungen"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_O_OfficerUniform_ocamo","Pimpy President",1000];
	};
	
	//Hats
	case 1:
	{
		_ret = [
			["H_Cap_blk",nil,100],
			["H_Cap_grn",nil,200],
			["H_Cap_oli",nil,300],
			["H_Cap_tan",nil,400],
			["H_Cap_blk_Raven",nil,500],
			["H_Cap_brn_SPECOPS",nil,600],
			["H_Cap_blu",nil,700],
			["H_Cap_red",nil,800],
			["H_Cap_blk_CMMG",nil,900],
			["H_Cap_blk_ION",nil,1000],
			["H_Cap_grn_BI",nil,1100],
			["H_Cap_khaki_specops_UK",nil,1300],
			["H_Cap_tan_specops_US",nil,1400],
			["H_BandMask_blk",nil,1500],
			["H_Cap_oli_hs",nil,1600],
			["H_Cap_headphones",nil,1700],
			["H_Hat_tan",nil,1900],
			["H_Hat_grey",nil,2000],
			["H_Hat_brown",nil,2100],
			["H_Hat_checker",nil,2200],
			["H_Hat_blue",nil,2300],
			["H_Hat_camo",nil,2400],
			["H_StrawHat",nil,2500],
			["H_StrawHat_dark",nil,2600],
			["H_TurbanO_blk",nil,2700],
			["H_Bandanna_camo",nil,2800],
			["H_Bandanna_cbr",nil,2900],
			["H_Bandanna_gry",nil,3000],
			["H_Bandanna_khk",nil,3100],
			["H_Bandanna_mcamo",nil,3200],
			["H_Bandanna_sgg",nil,3300],
			["H_Bandanna_surfer",nil,3400],
			["H_Bandanna_khk_hs",nil,3500],
			["H_Watchcap_blk",nil,3600],
			["H_Watchcap_camo",nil,3700],
			["H_Watchcap_khk",nil,3800],
			["H_Watchcap_sgg",nil,3900],
			["H_Booniehat_tan",nil,4000],
			["H_Booniehat_grn",nil,4100],
			["H_Booniehat_mcamo",nil,4200],
			["H_Booniehat_indp",nil,4300],
			["H_Booniehat_khk_hs",nil,4400],
			["H_MilCap_blue",nil,4500],
			["H_MilCap_dgtl",nil,4600],
			["H_MilCap_gry",nil,4700],
			["H_MilCap_mcamo",nil,4800],
			["H_MilCap_ocamo",nil,4900],
			["H_MilCap_oucamo",nil,5000],
			["H_MilCap_rucamo",nil,5100]
		];
	};
	
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
	{
		_ret pushBack ["V_Rangemaster_belt",nil,5000];
	};
	
	//Backpacks
	case 4:
	{};
};

_ret;