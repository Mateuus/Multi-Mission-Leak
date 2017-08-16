#include <macro.h>
/*
	File: fn_clothing_sec.sqf
	Author: Bloodwyn

	Description:
	Master config file for sec clothing store.
*/
private["_filter","_ret"];
_filter = param [0,0,[0]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price
//Shop Title Name
ctrlSetText[3103,"Security Uniform Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{

		_ret pushBack ["U_O_OfficerUniform_ocamo","Türsteher Style",150];

		if(__GETC__(lhm_seclevel) > 1) then
		{
			_ret pushBack ["U_O_SpecopsUniform_ocamo",nil,150];
		};
	};

	//Hats
	case 1:
	{
		_ret pushBack ["H_WatchCap_blk",nil,750];

		if(__GETC__(lhm_seclevel) > 1) then
		{
			_ret pushBack ["H_MilCap_blue",nil,10];
			_ret pushBack ["H_Bandanna_blu",nil,10];
			_ret pushBack ["H_Cap_blu",nil,10];
		};

		if(__GETC__(lhm_seclevel) > 2) then
		{
			_ret pushBack ["H_HelmetLeaderO_oucamo",nil,6500];
			_ret pushBack ["H_HelmetLeaderO_ocamo",nil,6500];
		};
		if(__GETC__(lhm_seclevel) > 3) then
		{
			_ret pushBack ["H_CrewHelmetHeli_B",nil,5000];
			_ret pushBack ["H_Beret_blk",nil,1500];
		};
	};

	//Glasses
	case 2:
	{
		_ret pushBack ["G_Shades_Black",nil,25];
		_ret pushBack ["G_Shades_Blue",nil,25];
		_ret pushBack ["G_Sport_Blackred",nil,30];
		_ret pushBack ["G_Sport_Checkered",nil,30];
		_ret pushBack ["G_Sport_Blackyellow",nil,30];
		_ret pushBack ["G_Sport_BlackWhite",nil,30];
		_ret pushBack ["G_Aviator",nil,75];
		_ret pushBack ["G_Squares",nil,45];
		_ret pushBack ["G_Lowprofile",nil,50];
		_ret pushBack ["G_Balaclava_combat",nil,350];
		_ret pushBack ["G_Tactical_Clear",nil,400];
		_ret pushBack ["G_Lady_Mirror",nil,150];
		_ret pushBack ["G_Lady_Dark",nil,150];
		_ret pushBack ["G_Lady_Blue",nil,150];
		_ret pushBack ["G_Lowprofile",nil,30];
		_ret pushBack ["G_Combat",nil,55];
	};

	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,1200];

		if(__GETC__(lhm_seclevel) > 1) then
		{
			_ret pushBack ["V_TacVest_blk",nil,200];
		};
		if(__GETC__(lhm_seclevel) > 2) then
		{
			_ret pushBack ["V_PlateCarrier1_blk",nil,20000];
			_ret pushBack ["V_PlateCarrier2_blk",nil,40000];
		};

		if(__GETC__(lhm_seclevel) > 3) then
		{
			_ret pushBack ["V_PlateCarrierSpec_blk",nil,75000];
			_ret pushBack ["V_PlateCarrierSpec_rgr",nil,75000];
		};
	};

	//Backpacks
	case 4:
	{
		_ret pushBack ["B_Carryall_oucamo",nil,5000];
	};
};

_ret;