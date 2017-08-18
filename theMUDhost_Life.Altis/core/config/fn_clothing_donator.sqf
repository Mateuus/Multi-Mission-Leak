#include <macro.h>
/*
	File: fn_clothing_donator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Donator clothing.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Steve's Diving Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(__GETC__(life_donator) > 0 ) then
		{
			_ret pushBack ["U_NikosBody",nil,1000];
			_ret pushBack ["U_C_Scientist",nil,1000];
			_ret pushBack ["U_I_G_resistanceLeader_F",nil,1000];
			_ret pushBack ["U_C_Poor_1",nil,1000];
			_ret pushBack ["U_OrestesBody",nil,1000];
			_ret pushBack ["U_OG_Guerilla1_1",nil,1000];
			_ret pushBack ["U_O_GhillieSuit",nil,1000];
			_ret pushBack ["U_B_GhillieSuit",nil,1000];
			_ret pushBack ["U_C_WorkerCoveralls","Prison Uniform",1000];
		};
			
		if(__GETC__(life_donator) > 1 ) then
		{
			_ret pushBack ["U_B_Wetsuit",nil,1000];
			_ret pushBack ["U_MillerBody",nil,1000];
			_ret pushBack ["U_B_Wetsuit",nil,1000];
			_ret pushBack ["U_B_HeliPilotCoveralls",nil,1000];
			_ret pushBack ["U_O_PilotCoveralls",nil,1000];
		};
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_donator) > 0 ) then
		{
			_ret pushBack ["H_HelmetB_camo",nil,100];
			_ret pushBack ["H_Booniehat_indp",nil,100];
			_ret pushBack ["H_Booniehat_tan",nil,100];
			_ret pushBack ["H_Booniehat_dgtl",nil,100];
			_ret pushBack ["H_Cap_red",nil,100];
			_ret pushBack ["H_Cap_oli",nil,100];
			_ret pushBack ["H_Cap_blk_CMMG",nil,100];
			_ret pushBack ["H_Cap_blk_ION",nil,100];
			_ret pushBack ["H_Cap_brn_SPECOPS",nil,100];
			_ret pushBack ["H_HelmetIA",nil,100];
			_ret pushBack ["H_HelmetB_grass",nil,100];
			_ret pushBack ["H_Shemag_khk",nil,100];
			_ret pushBack ["H_Shemag_olive",nil,100];
		};
			
		if(__GETC__(life_donator) > 1 ) then
		{
			_ret pushBack ["H_PilotHelmetFighter_B",nil,100];
			_ret pushBack ["H_PilotHelmetHeli_B",nil,100];
			_ret pushBack ["H_CrewHelmetHeli_I",nil,100];
			_ret pushBack ["H_HelmetB_light_black",nil,100];
			_ret pushBack ["H_BandMask_demon",nil,100];
			_ret pushBack ["H_HelmetSpecO_blk",nil,100];
		};
	};
	
	//Glasses
	case 2:
	{
		if(__GETC__(life_donator) > 0 ) then
		{
			_ret pushBack ["G_Shades_Black",nil,25];
			_ret pushBack ["G_Shades_Blue",nil,20];
			_ret pushBack ["G_Sport_Blackred",nil,20];
			_ret pushBack ["G_Sport_Checkered",nil,20];
			_ret pushBack ["G_Sport_Blackyellow",nil,20];
			_ret pushBack ["G_Sport_BlackWhite",nil,20];
			_ret pushBack ["G_Aviator",nil,75];
			_ret pushBack ["G_Squares",nil,10];
			_ret pushBack ["G_Bandanna_tan",nil,100];
			_ret pushBack ["G_Bandanna_aviator",nil,100];
			_ret pushBack ["G_Bandanna_blk",nil,100];
			_ret pushBack ["G_Bandanna_oli",nil,100];
			_ret pushBack ["G_Bandanna_khk",nil,100];
			_ret pushBack ["G_Bandanna_shades",nil,100];
			_ret pushBack ["G_Bandanna_sport",nil,100];
		};
			
		if(__GETC__(life_donator) > 1 ) then
		{
			_ret pushBack ["G_Diving",nil,100];
			_ret pushBack ["G_Bandanna_beast",nil,100];
		};
	};
	
	//Vest
	case 3:
	{
		if(__GETC__(life_donator) > 0 ) then
		{
			_ret pushBack ["V_Rangemaster_belt",nil,500];
			_ret pushBack ["V_BandollierB_khk",nil,500];
			_ret pushBack ["V_BandollierB_oli",nil,500];
			_ret pushBack ["V_TacVest_brn",nil,500];
		};
		
		if(__GETC__(life_donator) > 1 ) then
		{
			_ret pushBack ["V_RebreatherB",nil,500];
			_ret pushBack ["V_PlateCarrier1_rgr",nil,500];
			_ret pushBack ["V_PlateCarrierGL_rgr",nil,500];
			_ret pushBack ["V_Chestrig_khk",nil,500];
			_ret pushBack ["V_PlateCarrierIA1_dgtl",nil,500];
			_ret pushBack ["V_PlateCarrierIAGL_dgtl",nil,500];
		};
	};
	
	//Backpacks
	case 4:
	{
		if(__GETC__(life_donator) > 0 ) then
		{
			_ret pushBack ["B_Kitbag_cbr",nil,800];
			_ret pushBack ["B_FieldPack_cbr",nil,500];
			_ret pushBack ["B_AssaultPack_cbr",nil,700];
			_ret pushBack ["B_Bergen_sgg",nil,2500];
			_ret pushBack ["B_Carryall_cbr",nil,3500];
		};
		
		if(__GETC__(life_donator) > 1 ) then
		{
			_ret pushBack ["B_Parachute",nil,1000];
		};
	};
};

_ret;