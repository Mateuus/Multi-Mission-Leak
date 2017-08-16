/*
	File: fn_clothing_ap.sqf
	Author: Bryan "Tonic" Boardwine
	
	Edited by: E-Monkeys.com
	
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Presse Ausstatter"];

switch (_filter) do
{
	//Kleidung
	case 0:
	{
		[
		["U_C_Journalist","Presse Uniform",1000]	
		];
	};
	
	//Hüte
	case 1:
	{
		[
        ["H_Cap_press","Presse Cap",100]
		];
	};
	
	//Brillen
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Westen
	case 3:
	{
	    [
		["V_Press_F","Presse Weste",500]
		];	
	};
	
	//Rucksäcke
	case 4:
	{
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500],
			["B_Parachute",nil,5000]
		];
	};
};