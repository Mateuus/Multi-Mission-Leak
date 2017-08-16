/*
	File: fn_clothing_bounty.sqf
	Author: stuffz - CheapSuit Inc
	
	Description:
	Clothing shop for the bounty hunters
*/
private["_filter"];
_filter = [_this,0,0,[0]] call GTA_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bounty Hunter Clothing Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_I_CombatUniform","Bounty Hunter Uniform",5000]
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
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		];
	};
};