/*
	File: fn_clothing_dive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Altis Diving Shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Diving Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_B_Wetsuit",nil,2000 * life_donDis]
		];
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
		[
			["G_Diving",nil,500 * life_donDis]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_RebreatherB",nil,5000 * life_donDis]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		    ["B_TacticalPack_blk",nil,5000 * life_donDis],
		    ["B_FieldPack_blk",nil,1000 * life_donDis],
		    ["B_AssaultPack_blk",nil,2500 * life_donDis]
		];
	};
};