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
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{		
		if(__GETC__(life_coplevel) >= 0) then
		{
			_ret pushBack ["U_Rangemaster","Cop",150];

		};
		/*if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["U_Marshal","Sergeant",250];
		};*/
		if(__GETC__(life_coplevel) >= 7) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam","Department Grey",550];
		};
		if(license_cop_adf) then
		{
		_ret pushBack ["U_IG_Guerilla2_3",nil,550];
		_ret pushBack ["U_BG_Guerilla2_1",nil,550];
		_ret pushBack ["U_I_G_resistanceLeader_F",nil,550];
		_ret pushBack ["U_IG_Guerrilla_6_1",nil,550];
			
		};
			
			
		
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) >= 1) then
		{
			_ret pushBack ["H_MilCap_blue",nil,75];
		};
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["H_Cap_police",nil,120];
		};
		
		if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["H_Beret_blk_POLICE",nil,100];
		};
		if(__GETC__(life_coplevel) >= 7) then
		{
			_ret pushBack ["H_Booniehat_indp",nil,100];
			_ret pushBack ["H_Watchcap_sgg",nil,100];
			_ret pushBack ["H_Watchcap_blk",nil,100];
			_ret pushBack ["H_HelmetB_camo",nil,100];
			_ret pushBack ["H_Beret_02",nil,100];
			
		};
		if(__GETC__(life_coplevel) >= 8) then
		{

			_ret pushBack ["H_Beret_Colonel",nil,100];
			
		};
		if(license_cop_adf) then
		{
		_ret pushBack ["H_Shemag_olive",nil,550];
		_ret pushBack ["H_Shemag_tan",nil,550];
		_ret pushBack ["H_ShemagOpen_tan",nil,550];
		_ret pushBack ["H_ShemagOpen_khk",nil,550];
			
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Spectacles_Tinted",nil,50],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			//["G_Bandanna_aviator",nil,20],
			["G_Squares_Tinted",nil,50],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Diving",nil,100]
			
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,800];
		_ret pushBack ["V_RebreatherIA",nil,800];
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["V_TacVest_blk_POLICE",nil,1500];
			_ret pushBack ["V_RebreatherB","Tauchgerät",1500];
		};
		if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["V_PlateCarrier1_blk",nil,1500];
		};
		if(__GETC__(life_coplevel) >= 7) then
		{
			_ret pushBack ["V_PlateCarrier2_blk",nil,1200];
		};
		if(license_cop_adf) then
		{
		_ret pushBack ["V_Chestrig_rgr",nil,550];
		_ret pushBack ["V_TacVest_oli",nil,550];
		_ret pushBack ["V_PlateCarrierIA2_dgtl",nil,550];
		_ret pushBack ["V_PlateCarrier2_rgr",nil,550];
			
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,1000],
			["B_FieldPack_blk",nil,1000],
			["B_AssaultPack_blk",nil,1000],
			["B_Bergen_sgg",nil,1000],
			["B_Parachute",nil,1000],
			["B_Bergen_blk",nil,1000],
			["B_Carryall_cbr",nil,1000]
		];
	};
};

_ret;