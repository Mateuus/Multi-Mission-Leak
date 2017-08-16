#include <macro.h>
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Uniforme Gendarmerie"];
_ret = [];
switch (_filter) do
{
case 0:
{
_ret pushBack ["U_Rangemaster","Uniforme Gendarmerie",10];
_ret pushBack ["U_O_OfficerUniform_ocamo","Tenue Route",20];
if(GETC(life_coplevel) > 1) then
{
_ret pushBack ["U_O_Wetsuit","Tenue de plongée",100];
_ret pushBack ["U_B_SpecopsUniform_sgg","Tenue Grand froid",30];
};
if(GETC(life_coplevel) > 3) then
{
_ret pushBack ["U_B_CombatUniform_mcam_worn","Tenue Polaire",20];
_ret pushBack ["U_O_OfficerUniform_ocamo","Tenue Douane",20];
};
if(GETC(life_coplevel) > 4) then
{
_ret pushBack ["U_I_pilotCoveralls","Pilote",100];
_ret pushBack ["U_B_CombatUniform_mcam","Encadrement",40];
};
if(GETC(life_coplevel) > 6) then
{
_ret pushBack ["U_B_CTRG_1","Commandement",40];
_ret pushBack ["U_B_CombatUniform_mcam_vest","Commandement",40];
};
if(GETC(life_coplevel) > 7) then
{
_ret pushBack ["U_O_OfficerUniform_ocamo","Tenue Ceremonie",80];
};
if(licop_swat) then
{_ret pushBack ["U_B_CTRG_3","GIGN",80];
};
if(licop_sniper) then
{
_ret pushBack ["U_B_GhillieSuit","Ghillie",60];
_ret pushBack ["U_B_FullGhillie_ard","Ghillie Complete",60];
_ret pushBack ["U_B_FullGhillie_lsh","Ghillie Complete",60];
_ret pushBack ["U_B_FullGhillie_sard","Ghillie Complete",60];
};
if(licop_spy) then
{
_ret pushBack ["U_C_HunterBody_grn","Tenue Civil",20];
_ret pushBack ["U_C_Journalist","Tenue Civil",20];
_ret pushBack ["U_OrestesBody","Tenue Civil",20];
	
};
};
case 1:
{
_ret pushBack ["H_Cap_police",nil,7];
_ret pushBack ["H_PilotHelmetFighter_B","Masque a Gaz",10];
if(GETC(life_coplevel) > 4) then
{
_ret pushBack ["H_Beret_blk_POLICE",nil,1];
};
if(GETC(life_coplevel) > 6) then
{
_ret pushBack ["H_Beret_02",nil,1];
};
if(GETC(life_coplevel) > 9) then
{
_ret pushBack ["H_Beret_Colonel",nil,1];
};
if(licop_swat) then
{
_ret pushBack ["H_Booniehat_indp","GIGN",5];
_ret pushBack ["H_HelmetB_light_black","GIGN",5];
};
};
case 2:
{
_ret pushBack ["G_Shades_Black",nil,2];
_ret pushBack ["G_Shades_Blue",nil,2];
_ret pushBack ["G_Sport_Blackred",nil,2];
_ret pushBack ["G_Sport_Checkered",nil,2];
_ret pushBack ["G_Sport_Blackyellow",nil,2];
_ret pushBack ["G_Sport_BlackWhite",nil,2];
_ret pushBack ["G_Squares",nil,10];
_ret pushBack ["G_Aviator",nil,10];
_ret pushBack ["G_Lady_Mirror",nil,15];
_ret pushBack ["G_Lady_Dark",nil,15];
_ret pushBack ["G_Lady_Blue",nil,15];
_ret pushBack ["G_Diving",nil,5];
if(licop_swat) then
{
_ret pushBack ["G_Bandanna_beast",nil,1];
_ret pushBack ["G_Balaclava_blk",nil,1];
_ret pushBack ["G_Balaclava_combat",nil,1];
_ret pushBack ["G_Balaclava_lowprofile",nil,1];
_ret pushBack ["G_Balaclava_oli",nil,1];
};
};
case 3:
{
_ret pushBack ["V_RebreatherB",nil,50];
_ret pushBack ["V_TacVest_blk_POLICE",nil,15];
if(GETC(life_coplevel) > 4) then
{
_ret pushBack ["V_TacVestIR_blk",nil,25];
};
if(GETC(life_coplevel) > 6) then
{
_ret pushBack ["V_PlateCarrier1_blk",nil,25];
};
if(licop_swat) then
{
_ret pushBack ["V_TacVestIR_blk",nil,60];
_ret pushBack ["V_PlateCarrier1_blk",nil,60];
_ret pushBack ["V_PlateCarrier2_blk",nil,60];
};
};
case 4:
{
_ret pushBack ["B_Kitbag_cbr",nil,8];
_ret pushBack ["B_Carryall_cbr",nil,12];
if(licop_spy) then
{
_ret pushBack ["B_UAV_01_backpack_F",nil,50];
};
};
};
_ret;