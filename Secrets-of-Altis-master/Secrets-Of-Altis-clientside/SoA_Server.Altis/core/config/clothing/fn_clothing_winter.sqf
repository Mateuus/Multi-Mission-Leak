/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for W's Outback Outfits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Winteroutfits"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_OG_Guerrilla_6_1","Weihnachtsoutfit",2500];
	};
	
	//Hats
	case 1:
	{
	_ret =	[
				["H_Watchcap_blk","Wintermütze (Schwarz)",1500],
				["H_Watchcap_khk","Wintermütze (Khaki)",1500],
				["H_Watchcap_sgg","Wintermütze (Graugrün)",1500]
			];
	};
	
	//Glasses
	case 2:
	{
	_ret =	[
				["G_Shades_Green",nil,130],
				["G_Shades_Red",nil,140],
				["G_Aviator",nil,240]
			];
	};
	
	//Vest
	case 3:
	{};
	
	//Backpacks
	case 4:
	{};
};

_ret;