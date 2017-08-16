/*
	File: fn_clothing_dive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Altis Diving Shop.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Steve's Diving Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushback ["U_I_Wetsuit",nil,1900];
		_ret pushback ["U_B_Wetsuit",nil,2000];
		_ret pushback ["U_O_Wetsuit",nil,2300];
	};
	
	//Hats
	case 1:
	{
		[
		];
	};
	
	//Glasses
	case 2:
	{
		_ret pushback ["G_Diving","Tauchermaske",500];
	};
	
	//Vest
	case 3:
	{
		_ret pushback ["V_RebreatherIA",nil,4800];
		_ret pushback ["V_RebreatherB",nil,5000];
		_ret pushback ["V_RebreatherIR",nil,5400];
	};
	
	//Backpacks
	case 4:
	{};
};

_ret;