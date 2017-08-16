#include <macro.h>
/*
	File: fn_clothing_med.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for medic clothing store.
*/
private["_filter","_ret"];
_filter = param [0,0,[0]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Medizinisches Equipment"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:  
	{
		// Medic Level 1
		_ret pushBack ["U_Competitor","Medical Assistant",150];
		
		if(__GETC__(lhm_medicLevel) > 1) then // Medic Level 2
		{
		_ret pushBack ["U_I_CombatUniform","Doctor",350];
		};
		if(__GETC__(lhm_medicLevel) > 2) then // Medic level 3
		{
		
		};
		if(__GETC__(lhm_medicLevel) > 3) then // Medic Level 4
		{
		
		};
		if(__GETC__(lhm_medicLevel) > 4) then // Medic Level 5
		{
		
		};
	};

	//Hats
	case 1:
	{
		_ret pushBack ["H_Cap_red","Medical Cap",50];
		
		if(__GETC__(lhm_medicLevel) > 1) then
		{
		
		};
		
		if(__GETC__(lhm_medicLevel) > 2) then
		{
		
		};
		if(__GETC__(lhm_medicLevel) > 3) then
		{
		
		};
		if(__GETC__(lhm_medicLevel) > 4) then
		{
		
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
	};

	//Vest
	case 3:
	{
		if(__GETC__(lhm_medicLevel) > 1) then
		{
		
		};
		
		if(__GETC__(lhm_medicLevel) > 2) then
		{
		
		};
	};

	//Backpacks
	case 4:
	{
		// Medic Level 1
		_ret pushBack ["B_AssaultPack_khk",nil,1000];
		
		// Medic Level 2
		if(__GETC__(lhm_medicLevel) > 1) then
		{
			_ret pushBack ["B_Kitbag_cbr",nil,1500];
		};
		
		// Medic Level 3
		if(__GETC__(lhm_medicLevel) > 2) then
		{
		
		};
		
		// Medic Level 4
		if(__GETC__(lhm_medicLevel) > 3) then
		{
		_ret pushBack ["B_Carryall_ocamo",nil,2000];
		};
		
		// Medic Level 5
		if(__GETC__(lhm_medicLevel) > 4) then
		{
		_ret pushBack ["B_Carryall_oucamo",nil,2500];
		};
		
	};
};

_ret;