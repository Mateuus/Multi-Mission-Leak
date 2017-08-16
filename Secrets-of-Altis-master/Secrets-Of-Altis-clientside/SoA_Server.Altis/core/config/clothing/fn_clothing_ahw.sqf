#include <macro.h>
/*
	File: fn_clothing_med.sqf
	Author original file fn_clothing_cop.sqf: Bryan "Tonic" Boardwine
        Modifi by Warsheep
	
	Description:
	Master config file for med clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"AHW-Ausrüstung"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = 
		[
			["U_Rangemaster","Dienstkleidung",250],
			["U_B_Wetsuit","Taucheranzug",2000],
			["U_C_Scientist","ABC-Anzug",10000]
		];
	};
	
	//Hats
	case 1:
	{
		_ret = 
		[
			["H_Cap_red","Rote Kappe",15],
			["H_Cap_marshal","Sicherheitshelm",20],
			["H_Watchcap_cbr",nil,22],
			["H_Bandanna_cbr",nil,27]
		];
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,2],
			["G_Shades_Blue",nil,2],
			["G_Sport_Blackred",nil,5],
			["G_Sport_Checkered",nil,5],
			["G_Sport_Blackyellow",nil,5],
			["G_Sport_BlackWhite",nil,5],
			["G_Squares",nil,8],
			["G_Tactical_Clear",nil,30],
			["G_Tactical_Black",nil,21],
			["G_Spectacles",nil,21],
			["G_Spectacles_Tinted",nil,21],
			["G_Aviator",nil,12],
			["G_Lowprofile",nil,8],
			["G_Diving","Tauchermaske",50]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushback ["V_RebreatherB","Atemgerät",500];
	};
	
	//Backpacks
	case 4:
	{
		_ret pushBack ["B_Carryall_cbr","Rucksack",800];
	};
};

_ret;