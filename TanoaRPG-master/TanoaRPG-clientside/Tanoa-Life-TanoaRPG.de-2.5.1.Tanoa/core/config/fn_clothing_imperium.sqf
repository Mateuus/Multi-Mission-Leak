#include <macro.h>
/*
    File: fn_clothing_imperium.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Master configuration file for adac Outfits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price
//Shop Title Name
ctrlSetText[3103,"Imperium Kleidershop"];


_ret = [];

switch (_filter) do
{
    //Uniforms
    case 0:
    {
		_ret set[count _ret,["U_O_T_Soldier_F",nil,2500]];
		_ret set[count _ret,["U_O_Wetsuit",nil,2500]];
        if(__GETC__(life_adaclevel) > 1) then
        {
			_ret set[count _ret,["U_O_T_Sniper_F",nil,20000]];
			_ret set[count _ret,["U_B_T_Soldier_F",nil,15000]];
			_ret set[count _ret,["U_B_T_Soldier_AR_F",nil,15000]];
			_ret set[count _ret,["U_O_CombatUniform_oucamo",nil,15000]];
			_ret set[count _ret,["U_B_CTRG_Soldier_F",nil,15000]];
        };
		if(__GETC__(life_adaclevel) > 2) then
        {
			_ret set[count _ret,["U_O_T_FullGhillie_tna_F",nil,30000]];
			_ret set[count _ret,["U_O_FullGhillie_lsh",nil,30000]];
			_ret set[count _ret,["U_B_CTRG_Soldier_urb_2_F",nil,25000]];
        };
		if(__GETC__(life_adaclevel) > 3) then
        {
			_ret set[count _ret,["U_O_V_Soldier_Viper_F",nil,30000]];
        };
    };
    
    //Hats
    case 1:
    {
		_ret set[count _ret,["H_HelmetB",nil,2500]];
		_ret set[count _ret,["H_HelmetB_tna_F",nil,2500]];
		_ret set[count _ret,["H_Cap_brn_SPECOPS",nil,2500]];
        if(__GETC__(life_adaclevel) > 1) then
        {
			_ret set[count _ret,["H_HelmetB_TI_tna_F",nil,5000]];
			_ret set[count _ret,["H_Booniehat_tna_F",nil,3000]];
			_ret set[count _ret,["H_ShemagOpen_tan",nil,3000]];
			_ret set[count _ret,["H_Shemag_olive",nil,3000]];
        };
		if(__GETC__(life_adaclevel) > 2) then
        {
			_ret set[count _ret,["H_HelmetB_Enh_tna_F",nil,5000]];
			_ret set[count _ret,["H_HelmetSpecB_paint1",nil,5000]];
			_ret set[count _ret,["H_Beret_ocamo",nil,5000]];
        };
		if(__GETC__(life_adaclevel) > 3) then
        {
			_ret set[count _ret,["H_Beret_Colonel",nil,3000]];
        };
    };
    
    //Glasses
    case 2:
    {
		_ret set[count _ret,["G_O_Diving",nil,5000]];
		_ret set[count _ret,["G_Shades_Black",nil,5000]];
        if(__GETC__(life_adaclevel) > 1) then
        {
			_ret set[count _ret,["G_Bandanna_beast",nil,3000]];
			_ret set[count _ret,["G_Bandanna_blk",nil,3000]];
        };
		if(__GETC__(life_adaclevel) > 2) then
        {
			_ret set[count _ret,["G_Balaclava_TI_blk_F",nil,5000]];
			_ret set[count _ret,["G_Balaclava_TI_G_blk_F",nil,5000]];
        };
		if(__GETC__(life_adaclevel) > 3) then
        {
        };
    };
    
    //Vest
    case 3:
    {
		_ret set[count _ret,["V_PlateCarrier1_rgr",nil,5000]];
		_ret set[count _ret,["V_PlateCarrier2_rgr_noflag_F",nil,5000]];
		_ret set[count _ret,["V_RebreatherIR",nil,5000]];
        if(__GETC__(life_adaclevel) > 1) then
        {
			_ret set[count _ret,["V_PlateCarrierL_CTRG",nil,30000]];
			_ret set[count _ret,["V_PlateCarrierH_CTRG",nil,45000]];
        };
		if(__GETC__(life_adaclevel) > 2) then
        {
			_ret set[count _ret,["V_PlateCarrierIAGL_dgtl",nil,55000]];
			_ret set[count _ret,["V_PlateCarrierIA1_dgtl",nil,55000]];
			_ret set[count _ret,["V_PlateCarrierIA2_dgtl",nil,55000]];
        };
		if(__GETC__(life_adaclevel) > 3) then
        {
        };
    };
    
    //Backpacks
    case 4:
    {
		_ret set[count _ret,["B_Carryall_mcamo",nil,5000]];
		_ret set[count _ret,["B_Kitbag_mcamo",nil,5000]];
        if(__GETC__(life_adaclevel) > 1) then
        {
			_ret set[count _ret,["B_Bergen_mcamo",nil,3000]];
        };
		if(__GETC__(life_adaclevel) > 2) then
        {
			_ret set[count _ret,["B_ViperHarness_ghex_F",nil,5000]];
        };
		if(__GETC__(life_adaclevel) > 3) then
        {
        };
    };
};

_ret;