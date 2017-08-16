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
ctrlSetText[3103,"Police Department Shop"];
 
_ret = [];
switch (_filter) do
{
    //Uniforms
    case 0:
    {
        if(__GETC__(life_coplevel) > 0) then
        {
            _ret pushBack ["U_Rangemaster",nil,100];
            _ret pushBack ["U_B_Wetsuit",nil,100];
            _ret pushback ["U_C_Scientist",nil,100];
            _ret pushBack ["U_B_CombatUniform_mcam",Cop,100];
        };
       
 
        if(__GETC__(life_coplevel) > 6) then
        {
            _ret pushBack ["U_B_CombatUniform_mcam",Chief,10];
            _ret pushBack ["U_O_CombatUniform_oucamo",BHC,100];
        };
       
        if(license_cop_swat) then
        {
            _ret pushBack ["U_B_CTRG_1",SWAT,100];
            _ret pushBack ["U_B_CTRG_3",SWAT,100];
			_ret pushBack ["U_B_CTRG_Soldier_urb_1_F",SWAT,100];
			_ret pushBack ["U_B_CTRG_Soldier_urb_3_F",SWAT,100];
        };
		
		if(license_cop_zoll) then
        {
            _ret pushBack ["U_Marshal","Marschal",100];
			_ret pushBack ["U_I_G_resistanceLeader_F","UndercoverONLY",100];
			_ret pushBack ["U_O_CombatUniform_oucamo","UndercoverONLY",100];
			_ret pushBack ["U_O_SpecopsUniform_blk","UndercoverONLY",100];
        };
    };
   
    //Hats
    case 1:
    {
        if(__GETC__(life_coplevel) > 0) then
        {
            _ret pushBack ["H_HelmetSpecB_blk",nil,75];
            _ret pushBack ["H_Beret_blk_POLICE",nil,120];
            _ret pushBack ["H_Watchcap_blk",nil,120];
            _ret pushBack ["H_Cap_blu",nil,120];
            _ret pushBack ["H_Cap_blk_ION",nil,120];
            _ret pushBack ["H_Cap_blk",nil,120];
            _ret pushBack ["H_Booniehat_mcamo",nil,120];
            _ret pushBack ["H_Booniehat_dgtl",nil,120];
            _ret pushBack ["H_Booniehat_indp",nil,120];
            _ret pushBack ["H_HelmetB_black",nil,120];
            _ret pushBack ["H_PilotHelmetHeli_B",nil,500];
            _ret pushBack ["H_PilotHelmetHeli_I",nil,500];
            _ret pushBack ["H_HelmetB_light_black",nil,120];
            _ret pushBack ["G_Diving",nil,500];
            _ret pushBack ["H_MilCap_mcamo",nil,100];              
            _ret pushBack ["H_Beret_02",nil,100];
            _ret pushBack ["H_HelmetB_plain_mcamo",nil,75];
        };
        if(license_cop_swat) then
        {
            _ret pushBack ["H_ShemagOpen_khk",NoName,100];
            _ret pushBack ["H_Shemag_khk",NoName,100];
            _ret pushBack ["H_Shemag_olive",NoName,100];
            _ret pushBack ["H_Shemag_tan",NoName,100];
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
            ["G_Sport_Checkered",nil,20],
            ["G_Sport_Blackyellow",nil,20],
            ["G_Sport_BlackWhite",nil,20],
            ["G_Aviator",nil,75],
            ["G_Squares",nil,10],
            ["G_Diving",nil,500],
            ["G_Lowprofile",nil,30],
            ["G_Combat",nil,55]
        ];
        if(license_cop_swat) then
        {
            _ret pushBack ["G_Balaclava_blk",NoName,100];
            _ret pushBack ["G_Balaclava_lowprofile",NoName,100];
            _ret pushBack ["G_Balaclava_combat",NoName,100];
            _ret pushBack ["G_Balaclava_oli",NoName,100];
        };
    };
   
    //Vest
    case 3:
    {
        if(__GETC__(life_coplevel) > 0) then
        {
            _ret pushBack ["V_TacVest_blk_POLICE",nil,2000];
            _ret pushBack ["V_RebreatherIR",nil,1000]; 
            _ret pushBack ["V_PlateCarrier1_blk",nil,2000];
        };
		if(license_cop_zoll) then
        {
			 _ret pushBack ["V_TacVest_khk","UndercoverONLY",2000];
			 _ret pushBack ["V_TacVest_blk","UndercoverONLY",2000];
			 _ret pushBack ["V_BandollierB_cbr","UndercoverONLY",2000];
		};
    };
   
    //Backpacks
    case 4:
    {
        _ret =
        [
            ["B_Carryall_cbr",nil,3500]
        ];
    };
};
 
_ret;