/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Krawallausrüstung"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_B_CombatUniform_mcam_worn","Krawalluniform",25];

		if(call life_coplevel > 5) then
		{
			_ret pushBack ["U_B_FullGhillie_ard","Ghillie (Trocken)",1000];
			_ret pushBack ["U_B_FullGhillie_lsh","Ghillie (Grün)",1000];
			_ret pushBack ["U_B_FullGhillie_sard","Ghillie (Halbtrocken)",1000];
		};	
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_HelmetSpecB_blk","Krawallhelm",10];
	};
	
	//Glasses
	case 2:
	{
		_ret pushBack ["G_Combat","Gasmaske",21];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_TacVest_blk_POLICE","Polizeiweste",100];

		if(call life_coplevel > 2) then
		{
			_ret pushBack ["V_PlateCarrier2_blk","Krawallweste",200];
		};
	};
	
	//Backpacks
	case 4:
	{
		if(call life_coplevel > 5) then
		{
			_ret pushBack ["B_UAV_01_backpack_F","UAV-Rucksack",5000];
		};
	};
};

_ret;