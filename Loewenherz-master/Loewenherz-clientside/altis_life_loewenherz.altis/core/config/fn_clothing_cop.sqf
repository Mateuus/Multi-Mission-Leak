#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = param [0,0,[0]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Polizei-Equipment"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		// Cadet Rang 1
		_ret pushBack ["U_Competitor","Recruit Uniform",150];

		if(__GETC__(lhm_coplevel) > 1) then // Officer Rang 2
		{
			_ret pushBack ["U_Rangemaster","Officer Uniform",350];
			_ret pushBack ["U_B_HeliPilotCoveralls","Pilot Uniform",750];
		};

		if(__GETC__(lhm_coplevel) > 2) then // Sergeant Rang 3
		{
			_ret pushBack ["U_B_SpecopsUniform_sgg","Coporal Uniform",1000];
			_ret pushBack ["U_B_survival_uniform","Notfallanzug",1000];
		};

		if(__GETC__(lhm_coplevel) > 3) then // 4
		{
			_ret pushBack ["U_B_CombatUniform_mcam_vest","Sergeant Uniform",1000];

		};
		if(__GETC__(lhm_coplevel) > 4) then // 5
		{
			_ret pushBack ["U_B_CTRG_1","Lt. Uniform",1500];

		};
		if(__GETC__(lhm_coplevel) > 5) then // 6
		{
			_ret pushBack ["U_B_CombatUniform_mcam","1.Lieut.Uniform",2500];
			_ret pushBack ["U_B_CombatUniform_mcam_worn","SWAT Uniform",3000];
		};
		if(__GETC__(lhm_coplevel) > 6) then // 7
		{
			_ret pushBack ["U_B_CombatUniform_mcam","Captain Uniform",2500];
		};
		if(__GETC__(lhm_coplevel) > 7) then // 8
		{
			_ret pushBack ["U_B_CombatUniform_mcam","Colonel Uniform",2500];
		};
		if(__GETC__(lhm_coplevel) > 8) then // 9
		{
			_ret pushBack ["U_B_CombatUniform_mcam","Dep.Chief Uniform",2500];
		};
		if(__GETC__(lhm_coplevel) > 9) then // 10
		{
			_ret pushBack ["U_B_CTRG_3","Chief Uniform",2500];
		};
	};

	//Hats
	case 1:
	{
		_ret pushBack ["H_Cap_police","Police Cap",50];

		if(__GETC__(lhm_coplevel) > 1) then
		{
			_ret pushBack ["H_HelmetB_plain_mcamo",nil,75];
			_ret pushBack ["H_PilotHelmetHeli_B","Pilot Helmet",200];
		};

		if(__GETC__(lhm_coplevel) > 2) then
		{
			_ret pushBack ["H_MilCap_gry",nil,100];
			_ret pushBack ["H_Cap_khaki_specops_UK",nil,200];
			_ret pushBack ["H_HelmetSpecB_blk","SWAT Helmet",600];
			_ret pushBack ["H_Watchcap_blk",nil,300];
		};
		if(__GETC__(lhm_coplevel) > 5) then
		{
			_ret pushBack ["H_Beret_blk_POLICE","SWAT Beret",400];
		};
		if(__GETC__(lhm_coplevel) > 6) then
		{
			_ret pushBack ["H_Beret_02","Captain Beret",500];

		};
		if(__GETC__(lhm_coplevel) > 8) then
		{
			_ret pushBack  ["H_Beret_Colonel","Chief Beret",1000];
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
		_ret pushBack ["G_Balaclava_blk",nil,400];

		if(__GETC__(lhm_coplevel) > 1) then
		{
		_ret pushBack ["G_Aviator",nil,75];
		_ret pushBack ["G_Squares",nil,45];
		_ret pushBack ["G_Lowprofile",nil,50];
		};

		if(__GETC__(lhm_coplevel) > 2) then
		{
		_ret pushBack ["G_Diving","Diving Googles",500]; // Cop Diving Equip
		_ret pushBack ["G_Balaclava_combat","SWAT Combat Google",350];
		};

		if(__GETC__(lhm_coplevel) > 3) then
		{
		_ret pushBack ["G_Tactical_Clear",nil,400];
		};
	};

	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,1000];

		if(__GETC__(lhm_coplevel) > 1) then
		{
			//_ret pushBack ["V_PlateCarrier1_blk","Anti-Gas Vest",1500]];
			_ret pushBack ["V_TacVest_blk_POLICE","Cop Weste",3000]; // Cop Vest
		};

		if(__GETC__(lhm_coplevel) > 2) then
		{
			_ret pushBack ["V_PlateCarrier1_blk",nil,3000];
		};

		if(__GETC__(lhm_coplevel) > 3) then
		{
			_ret pushBack ["V_RebreatherB","Atemgeraet",5000]; // Cop Diving Equip
			_ret pushBack ["V_PlateCarrierSpec_blk",nil,6000];
			_ret pushBack ["V_TacVestIR_blk",nil,6000];
		};
		if(__GETC__(lhm_coplevel) > 3) then
		{

		_ret pushBack ["V_PlateCarrier2_blk",nil,5000];
		};

		if(__GETC__(lhm_coplevel) > 5) then
		{
			_ret pushBack ["V_PlateCarrierGL_blk",nil,8000];
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_FieldPack_blk",nil,500],
			["B_OutdoorPack_blk",nil,700],
			["B_TacticalPack_blk",nil,2500]
		];
		if(__GETC__(lhm_coplevel) > 4) then
		{
			_ret pushBack ["B_Carryall_khk",nil,3000]; // Bloodwyn
		};
	};
};

_ret;