#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis PD Clothing"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_Rangemaster","Standard Uniform",25];

		if(__GETC__(life_coplevel) >= 1) then
		{
			_ret pushBack ["U_Competitor","Patrol Uniform",150];
		};

		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["U_I_HeliPilotCoveralls","Pilot Uniform",500];
			_ret pushBack ["U_IG_Guerilla2_3","Undercover Clothes",1500];
		};
		
		if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["U_B_Wetsuit",nil,2000];
			_ret pushBack ["U_B_CombatUniform_mcam_tshirt",nil,350];
			_ret pushBack ["U_B_CombatUniform_mcam_worn",nil,550];
			_ret pushBack ["U_O_GhillieSuit",nil,50000];
		};
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Cap_police","Police Hat",100];
		
		if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["H_Cap_tan_specops_US",nil,50];
			_ret pushBack ["H_CrewHelmetHeli_B","Gas Mask",1000];
			_ret pushBack ["H_HelmetB_plain_mcamo",nil,75];
			_ret pushBack ["H_Booniehat_mcamo",nil,120];
			_ret pushBack ["H_MilCap_mcamo",nil,100];
			_ret pushBack ["H_HelmetB_light_black","SWAT Helmet",1500];
			_ret pushBack ["H_PilotHelmetHeli_O",nil,1000];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret pushBack ["G_Shades_Black",nil,25];
		_ret pushBack ["G_Shades_Blue",nil,20];
		_ret pushBack ["G_Sport_Blackred",nil,20];
		_ret pushBack ["G_Sport_Checkered",nil,20];
		_ret pushBack ["G_Sport_Blackyellow",nil,20];
		_ret pushBack ["G_Sport_BlackWhite",nil,20];
		_ret pushBack ["G_Aviator",nil,75];
		_ret pushBack ["G_Squares",nil,10];
		
		if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["G_Lowprofile",nil,30];
			_ret pushBack ["G_Combat",nil,55];
			_ret pushBack ["G_Balaclava_blk",nil,1000];
			_ret pushBack ["G_Balaclava_oli",nil,1000];
			_ret pushBack ["G_Balaclava_combat",nil,1000];
			_ret pushBack ["G_Balaclava_lowprofile",nil,100];
			_ret pushBack ["G_Diving",nil,500];
		};
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt","Pistol Holster",800];
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret pushBack ["V_TacVest_blk_POLICE","Kevlar Vest",1000];
		};
		
		if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["V_PlateCarrier2_rgr","Green SWAT Vest",2500];
			_ret pushBack ["V_PlateCarrier1_blk","Black SWAT Vest",2500];
			_ret pushBack ["V_PlateCarrierIA1_dgtl",nil,5000];
			_ret pushBack ["V_PlateCarrierIAGL_dgtl",nil,5000];
			_ret pushBack ["V_PlateCarrierGL_rgr",nil,7500];
			_ret pushBack ["V_PlateCarrierGL_blk",nil,7500];
			_ret pushBack ["V_RebreatherB",nil,5000];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500]
		];
	};
};

_ret;