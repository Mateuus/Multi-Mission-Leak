/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Presse shop.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Presseladen"];

if(!license_civ_presse) exitWith {["Info: ","Du musst Mitglied der Altis Presse sein!","#ff1000","#ffffff",7] call life_fnc_texttiles;};

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_C_Journalist","Presseuniform",150];
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Cap_press","Pressekappe",10];
	};
	
	//Glasses
	case 2:
	{
		_ret = [
			["G_Shades_Black",nil,2],
			["G_Shades_Blue",nil,2],
			["G_Sport_Blackred",nil,5],
			["G_Sport_Checkered",nil,5],
			["G_Sport_Blackyellow",nil,5],
			["G_Sport_BlackWhite",nil,5],
			["G_Squares",nil,8],
			["G_Aviator",nil,12],
			["G_Lowprofile",nil,10]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Press_F",nil,1500];
	};
	
	//Backpacks
	case 4:
	{};
};

_ret;