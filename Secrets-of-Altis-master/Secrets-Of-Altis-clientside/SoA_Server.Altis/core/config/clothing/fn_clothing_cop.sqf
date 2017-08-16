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
ctrlSetText[3103,"Polizeiuniformen"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		hint "In diesem Shop sind DLC-Anzüge vorhanden. Ohne DLC wird der Anzug nach Ablage auf den Boden unbenutzbar.";
		_ret pushBack ["U_Rangemaster","Polizeiuniform",25];
		
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["U_C_Scientist","ABC-Anzug",200];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam","Kampfanzug",300];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret pushBack ["U_B_Wetsuit","Taucheranzug",350];
			_ret pushBack ["U_OG_Guerilla2_2","Zivilkleidung",150];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_ret pushBack ["U_Marshal","Marschallkleidung",350];
		};
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Cap_police","Polizeicappy",10];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["H_Beret_blk","Barett (Meister)",20];
		};	
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret pushBack ["H_Watchcap_blk",nil,10];
			_ret pushBack ["H_Beret_02","Barett (Kommissar)",30];
			_ret pushBack ["H_Booniehat_tan","Zivilbuschhut",30];
			_ret pushBack ["H_Bandanna_sand","Zivilbandana (Sand)",20];
			_ret pushBack ["H_Bandanna_gry","Zivilbandana (Schwarz)",20];
			_ret pushBack ["H_Cap_oli","Zivilcappy",25];
			_ret pushBack ["H_MilCap_gry","Militärmütze",30];
			_ret pushBack ["H_Beret_gen_F","Barett (Spezial)",50];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_ret pushBack ["H_StrawHat","Strohhut",35];
		};	
		if(__GETC__(life_coplevel) > 8) then
		{
			_ret pushBack ["H_Beret_Colonel","Barett (Leitung)",60];
		};	
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,2],
			["G_Shades_Blue",nil,2],
			["G_Aviator",nil,12],
			["G_Squares",nil,5],
			["G_Lowprofile",nil,8],
			["G_Combat","Gasmaske",21],
			["G_Tactical_Clear",nil,30],
			["G_Tactical_Black",nil,21],
			["G_Spectacles",nil,21],
			["G_Spectacles_Tinted",nil,21],
			["G_Diving","Tauchermaske",500]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_BandollierB_blk","Polizeigürtel",50];
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["V_TacVest_blk_POLICE","Polizeiweste",100];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret pushBack ["V_RebreatherB","Tauchgerät",70];
			_ret pushBack ["V_Chestrig_oli","Zivile Weste",150];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_ret pushBack ["V_PlateCarrier1_blk","Große Weste",180];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret pushBack ["B_Carryall_khk","Polizeirucksack",100];
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret pushBack ["B_Carryall_oli","Ziviler Rucksack",200];
		};
	};
};

_ret;