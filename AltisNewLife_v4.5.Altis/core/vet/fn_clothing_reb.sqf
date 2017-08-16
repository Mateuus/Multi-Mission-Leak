#include <macro.h>
private["_filter","_ret","_dis"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Vetements"];
_ret = [];
switch (GETC(life_donator)) do
{
	case 0: {_dis = 1;};
	case 1: {_dis = 0.9;};
	case 2: {_dis = 0.9;};
	case 3: {_dis = 0.8;};
	case 4: {_dis = 0.8;};
	case 5: {_dis = 0.7;};
	case 6: {_dis = 0.5;};
};

switch (_filter) do
{
//Uniforms
case 0:
{
	if(liciv_rebel) then {
	_ret pushBack ["U_IG_Guerilla1_1",nil,300 * _dis];
	_ret pushBack ["U_IG_leader",nil,300 * _dis];
	_ret pushBack ["U_O_CombatUniform_oucamo",nil,400 * _dis];
	_ret pushBack ["U_O_SpecopsUniform_ocamo",nil,400 * _dis];
	_ret pushBack ["U_O_OfficerUniform_ocamo",nil,500 * _dis];
	_ret pushBack ["U_I_CombatUniform_tshirt",nil,450 * _dis];
	_ret pushBack ["U_I_OfficerUniform",nil,500 * _dis];
	_ret pushBack ["U_O_PilotCoveralls",nil,550 * _dis];
	_ret pushBack ["U_I_pilotCoveralls",nil,550 * _dis];
	_ret pushBack ["U_I_HeliPilotCoveralls",nil,550 * _dis];
	_ret pushBack ["U_O_GhillieSuit",nil,5000 * _dis];
	_ret pushBack ["U_I_GhillieSuit",nil,5000 * _dis];
	_ret pushBack ["U_I_FullGhillie_ard",nil,10000 * _dis];
	_ret pushBack ["U_I_FullGhillie_lsh",nil,10000 * _dis];
	_ret pushBack ["U_I_FullGhillie_sard",nil,10000 * _dis];
	};
	if((GETC(life_reblevel) > 0) && (GETC(life_reblevel) != 13) && (GETC(life_reblevel) != 14))then {
	_ret pushBack ["U_B_CTRG_1",nil,500 * _dis];
	_ret pushBack ["U_B_CTRG_3",nil,500 * _dis];
	_ret pushBack ["U_B_CTRG_2",nil,500 * _dis];
	_ret pushBack ["U_O_Wetsuit","Tenue de plongée",200 * _dis];
	_ret pushBack ["U_IG_Guerilla2_1","Tenue civil",100 * _dis];
	_ret pushBack ["U_IG_Guerilla2_2","Tenue civil",100 * _dis];
	_ret pushBack ["U_IG_Guerilla2_3","Tenue civil",100 * _dis];
	_ret pushBack ["U_IG_Guerilla3_1","Tenue civil",100 * _dis];
	};
	if (GETC(life_reblevel) == 13) then	{
	_ret pushBack ["U_B_CombatUniform_mcam","Tenue Mercenaire",50 * _dis];
	_ret pushBack ["U_B_HeliPilotCoveralls",nil,1000 * _dis];
	_ret pushBack ["U_O_Wetsuit","Tenue de plongée",200 * _dis];
	};
	if (GETC(life_reblevel) == 14) then	{
	_ret pushBack ["U_B_CombatUniform_mcam_vest","Tenue FSA",200 * _dis];
	_ret pushBack ["U_B_HeliPilotCoveralls",nil,1000 * _dis];
	_ret pushBack ["U_B_GhillieSuit",nil,3000 * _dis];
	_ret pushBack ["U_O_Wetsuit","Tenue de plongée",200 * _dis];
	};
};
//Hats
case 1:
{
	if(liciv_rebel) then {
	_ret pushBack ["H_Cap_brn_SPECOPS",nil,80 * _dis];
	_ret pushBack ["H_Cap_khaki_specops_UK",nil,80 * _dis];
	_ret pushBack ["H_Cap_tan_specops_US",nil,80 * _dis];	
	_ret pushBack ["H_Cap_blk_CMMG",nil,80 * _dis];
	_ret pushBack ["H_Cap_blk_Raven",nil,80 * _dis];
	_ret pushBack ["H_Bandanna_camo",nil,80 * _dis];
	_ret pushBack ["H_Bandanna_mcamo",nil,80 * _dis];
	_ret pushBack ["H_HelmetB_camo",nil,80 * _dis];
	_ret pushBack ["H_HelmetB_sand",nil,80 * _dis];
	_ret pushBack ["H_HelmetO_ocamo",nil,80 * _dis];
	_ret pushBack ["H_HelmetO_oucamo",nil,80 * _dis];
	_ret pushBack ["H_HelmetIA",nil,80 * _dis];
	_ret pushBack ["H_PilotHelmetHeli_O",nil,80 * _dis];
	_ret pushBack ["H_PilotHelmetHeli_I",nil,80 * _dis];
	_ret pushBack ["H_Booniehat_indp",nil,80 * _dis];
	_ret pushBack ["H_Booniehat_dgtl",nil,80 * _dis];
	_ret pushBack ["H_Booniehat_mcamo",nil,80 * _dis];
	_ret pushBack ["H_Booniehat_dirty",nil,80 * _dis];
	_ret pushBack ["H_MilCap_ocamo",nil,80 * _dis];
	_ret pushBack ["H_MilCap_mcamo",nil,80 * _dis];
	_ret pushBack ["H_MilCap_rucamo",nil,80 * _dis];
	_ret pushBack ["H_MilCap_dgtl",nil,80 * _dis];
	_ret pushBack ["H_Shemag_olive",nil,80 * _dis];
	_ret pushBack ["H_Shemag_khk",nil,80 * _dis];
	_ret pushBack ["H_ShemagOpen_tan",nil,80 * _dis];
	};
	if(GETC(life_reblevel) > 0) then {
	_ret pushBack ["H_Watchcap_blk",nil,85 * _dis];
	_ret pushBack ["H_MilCap_gry",nil,85 * _dis];
	_ret pushBack ["H_Beret_grn","Beret",50 * _dis];
	_ret pushBack ["H_Beret_blk",nil,250 * _dis];
	_ret pushBack ["H_Beret_02",nil,250 * _dis];
	_ret pushBack ["H_Beret_Colonel",nil,250 * _dis];
	_ret pushBack ["H_PilotHelmetFighter_B","Masque a Gaz",500 * _dis];
	_ret pushBack ["H_CrewHelmetHeli_B",nil,100 * _dis];
	_ret pushBack ["H_HelmetB_light_black",nil,100 * _dis];
	};
};
//Glasses
case 2:
{
	if(liciv_rebel) then {
	_ret pushBack ["G_Bandanna_aviator",nil,5];
	_ret pushBack ["G_Bandanna_beast",nil,5];
	_ret pushBack ["G_Bandanna_blk",nil,5];
	_ret pushBack ["G_Bandanna_khk",nil,5];
	_ret pushBack ["G_Bandanna_oli",nil,5];
	_ret pushBack ["G_Bandanna_shades",nil,5];
	_ret pushBack ["G_Bandanna_sport",nil,5];
	_ret pushBack ["G_Bandanna_tan",nil,5];
	_ret pushBack ["G_Balaclava_oli",nil,10];
	};
	if(GETC(life_reblevel) > 0) then {
	_ret pushBack ["G_Balaclava_blk",nil,10],
	_ret pushBack ["G_Balaclava_combat",nil,10],
	_ret pushBack ["G_Balaclava_lowprofile",nil,10],
	_ret pushBack ["G_Diving",nil,50]
	};
};
//Vest
case 3:
{
	if(liciv_rebel) then {
	_ret pushBack ["V_Chestrig_khk",nil,500 * _dis];
	_ret pushBack ["V_Chestrig_rgr",nil,500 * _dis];
	_ret pushBack ["V_Chestrig_oli",nil,500 * _dis];
	_ret pushBack ["V_BandollierB_khk",nil,500 * _dis];
	_ret pushBack ["V_BandollierB_cbr",nil,500 * _dis];
	_ret pushBack ["V_BandollierB_rgr",nil,500 * _dis];
	_ret pushBack ["V_Chestrig_oli",nil,500 * _dis];
	_ret pushBack ["V_TacVest_khk",nil,500 * _dis];
	_ret pushBack ["V_TacVest_brn",nil,500 * _dis];
	_ret pushBack ["V_TacVest_oli",nil,500 * _dis];
	_ret pushBack ["V_I_G_resistanceLeader_F",nil,500 * _dis];
	_ret pushBack ["V_TacVest_camo",nil,500 * _dis];
	_ret pushBack ["V_HarnessO_brn",nil,500 * _dis];
	_ret pushBack ["V_RebreatherIA",nil,400 * _dis];	
	_ret pushBack ["V_HarnessOGL_brn","VESTE EXPLOSIVE",500000 * _dis];
	};
	if((GETC(life_reblevel) > 0) && (GETC(life_reblevel) != 13) && (GETC(life_reblevel) != 14))then {
	_ret pushBack ["V_PlateCarrier1_rgr",nil,200 * _dis];
	_ret pushBack ["V_PlateCarrier2_rgr",nil,200 * _dis];
	_ret pushBack ["V_PlateCarrierH_CTRG",nil,200 * _dis];
	_ret pushBack ["V_PlateCarrierIA1_dgtl",nil,200 * _dis];
	_ret pushBack ["V_PlateCarrierIAGL_dgtl",nil,200 * _dis];
	};
	if ((GETC(life_reblevel) == 13) || (GETC(life_reblevel) == 14) )then	{
	_ret pushBack ["V_PlateCarrier1_blk",nil,200 * _dis];
	_ret pushBack ["V_RebreatherB",nil,500 * _dis];
	};
};
//Backpacks
case 4:
{
	if(liciv_rebel) then {
	_ret pushBack ["B_AssaultPack_dgtl",nil,250 * _dis];
	_ret pushBack ["B_AssaultPack_mcamo",nil,250 * _dis];
	_ret pushBack ["B_Kitbag_mcamo",nil,450 * _dis];
	_ret pushBack ["B_FieldPack_oucamo",nil,300 * _dis];
	_ret pushBack ["B_FieldPack_ocamo",nil,300 * _dis];
	_ret pushBack ["B_Bergen_mcamo",nil,450 * _dis];
	_ret pushBack ["B_Carryall_oucamo",nil,500 * _dis];
	_ret pushBack ["B_Carryall_ocamo",nil,500 * _dis];
	_ret pushBack ["B_Carryall_mcamo",nil,500 * _dis];
	};
	if ((GETC(life_reblevel) == 13) || (GETC(life_reblevel) == 14) )then	{
	_ret pushBack ["B_AssaultPack_blk",nil,250 * _dis];
	_ret pushBack ["B_FieldPack_blk",nil,300 * _dis];
	_ret pushBack ["B_Bergen_blk",nil,450 * _dis];
	_ret pushBack ["B_Carryall_oucamo",nil,500 * _dis];
	_ret pushBack ["B_Carryall_cbr",nil,500 * _dis];
	};
};
};
_ret;