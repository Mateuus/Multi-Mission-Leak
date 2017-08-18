/*
	File: fn_clothing_journalist.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Donator clothing.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Steve's Diving Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Journalist",nil,1000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_press",nil,250]
		];
	};
	
	//Glasses
	case 2:
	{
		[
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_Press_F",nil,5000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500]
		];
	};
};