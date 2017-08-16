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
ctrlSetText[3103,"TanoaRPG Polizei Shop"];

_ret = [];

switch (_filter) do
{
	//Uniforms
    case 0:
    {
        _ret set[count _ret,["U_Rangemaster","Uniform",35]];
		if (__GETC__(life_coplevel) > 1) then
		{
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["U_B_Wetsuit","Polizei Taucheranzug",500]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
		    _ret set[count _ret,["U_B_GhillieSuit","Sniperghillie",500]];
			_ret set[count _ret,["U_B_T_Soldier_F","Reb Kleidung",500]];
        };	
		if(__GETC__(life_coplevel) > 4) then
        {
		    _ret set[count _ret,["U_B_T_FullGhillie_tna_F","FullGhilli",1750]];
			_ret set[count _ret,["U_B_CombatUniform_mcam","Uniform",1750]];
			_ret set[count _ret,["U_O_V_Soldier_Viper_F","Special uniform",1750]];
        };
		if(__GETC__(life_coplevel) > 5) then
        {
        };
		if(__GETC__(life_coplevel) > 6) then
        {
        };
		if(__GETC__(life_coplevel) > 7) then
        {
        };
    };
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 0) then
		{ 
			_ret set[count _ret,["H_Cap_police",nil,25]];
			_ret set[count _ret,["H_Beret_blk",nil,2500]];
		};
		if (__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["H_CrewHelmetHeli_B", "Gasmaske", 4000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,2500]];
			_ret set[count _ret,["H_Watchcap_blk",nil,500]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{ 
			
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["H_HelmetB_black","Schwarzer Helm",5000]];
			_ret set[count _ret,["H_Booniehat_mcamo",nil,120]];
			_ret set[count _ret,["H_MilCap_mcamo",nil,500]];
			_ret set[count _ret,["H_HelmetIA",nil,1000]];
			_ret set[count _ret,["H_HelmetCrew_O_ghex_F",nil,1000]];
            _ret set[count _ret,["H_HelmetB_Light_tna_F",nil,1000]];
            _ret set[count _ret,["H_HelmetSpecO_ghex_F",nil,1000]];
            _ret set[count _ret,["H_HelmetB_Enh_tna_F",nil,1000]];
            _ret set[count _ret,["H_HelmetLeaderO_ghex_F",nil,1000]];
            _ret set[count _ret,["H_Beret_02",nil,1500]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_ret set[count _ret,["H_Booniehat_tan",nil,1500]];
		};
	};
	
	//Glasses
	case 2:
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["G_Shades_Black",nil,25]];
			_ret set[count _ret,["G_Shades_Blue",nil,20]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["G_Sport_Blackred",nil,20]];
			_ret set[count _ret,["G_Sport_Checkered",nil,20]];
			_ret set[count _ret,["G_B_Diving",nil,100]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["G_Sport_Blackyellow",nil,20]];
			_ret set[count _ret,["G_Sport_BlackWhite",nil,20]];
			_ret set[count _ret,["G_Aviator",nil,75]];
			_ret set[count _ret,["G_Balaclava_TI_tna_F",nil,100]];
            _ret set[count _ret,["G_Balaclava_TI_G_tna_F",nil,100]];
            _ret set[count _ret,["G_Balaclava_TI_blk_F",nil,100]];
            _ret set[count _ret,["G_Balaclava_TI_G_blk_F",nil,100]];
            _ret set[count _ret,["G_Combat_Goggles_tna_F",nil,100]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["G_Squares",nil,10]];
			_ret set[count _ret,["G_Lowprofile",nil,30]];
			_ret set[count _ret,["G_Combat",nil,55]];
			_ret set[count _ret,["G_Balaclava_blk",nil,500]];
		};
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["V_Rangemaster_belt","Schießplatzverwalter",800]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["V_Chestrig_blk","Tragegurt",2000]];
			_ret set[count _ret,["V_BandollierB_blk","Westenring",500]];
			_ret set[count _ret,["V_RebreatherB","Tauchgerät",5000]];
			_ret set[count _ret,["V_TacVest_blk_POLICE","Polizeiweste",1500]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["V_PlateCarrier1_tna_F","Carrier Lite (Tanoa)",2500]]; /////////
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["V_PlateCarrier3_rgr","Carrier Rig (Grün)",3000]]; /////////
			_ret set[count _ret,["V_TacVestIR_blk","Einsatzweste",3000]];
			_ret set[count _ret,["V_PlateCarrierL_CTRG","Plattentragegurt Mk.1",5000]];
			_ret set[count _ret,["V_PlateCarrier2_blk","Plattentragegurt Mk.2",15000]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["V_PlateCarrierH_CTRG","Plattentragegurt Mk.2",15000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["V_PlateCarrier2_tna_F","Plate Carrier 2 Tanoa",15000]];
			_ret set[count _ret,["V_PlateCarrier2_rgr_noflag_F","Plate Carrier 2 Tanoa",15000]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_ret set[count _ret,["V_TacVestIR_blk","Einsatzweste",6000]];
		};		
	};
	
	//Backpacks
	case 4:
	{
		_ret set[count _ret,["B_AssaultPack_cbr",nil,250]];
		_ret set[count _ret,["B_Bergen_sgg",nil,1250]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["B_Kitbag_cbr",nil,500]];
			_ret set[count _ret,["B_FieldPack_cbr",nil,750]];
			_ret set[count _ret,["B_Bergen_blk",nil,7500]];
			_ret set[count _ret,["B_Carryall_cbr",nil,1500]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["B_UAV_01_backpack_F",nil,7500]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["B_FieldPack_cbr_Ammo",nil,1750]];
			_ret set[count _ret,["B_Carryall_mcamo",nil,2000]];
			_ret set[count _ret,["B_Carryall_oucamo",nil,2250]];
			_ret set[count _ret,["B_Bergen_dgtl_F",nil,5000]];
			_ret set[count _ret,["B_Bergen_mcamo_F",nil,5000]];
			_ret set[count _ret,["B_Bergen_tna_F",nil,5000]];
			_ret set[count _ret,["B_ViperHarness_blk_F",nil,5000]];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_ret set[count _ret,["B_Bergen_blk",nil,2500]];
		};
	};
};

_ret;