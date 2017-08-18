/*
	File: fn_clothing_law.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for lawyer shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Newscaster Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_NikosAgedBody",nil,5000 * life_donDis]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25 * life_donDis],
			["G_Shades_Blue",nil,20 * life_donDis],
			["G_Sport_Blackred",nil,20 * life_donDis],
			["G_Sport_Checkered",nil,20 * life_donDis],
			["G_Sport_Blackyellow",nil,20 * life_donDis],
			["G_Sport_BlackWhite",nil,20 * life_donDis],
			["G_Squares",nil,10 * life_donDis],
			["G_Lowprofile",nil,30 * life_donDis],
			["G_Combat",nil,55 * life_donDis]
		];
	};
};