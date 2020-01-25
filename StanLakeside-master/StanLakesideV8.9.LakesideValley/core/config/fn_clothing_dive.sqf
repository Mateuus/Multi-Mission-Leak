/*
	File: fn_clothing_dive.sqf
	
	
	Description:
	Master configuration file for Altis Diving Shop.
*/
private["_filter"];
_filter = param [0,0,[0]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Sklep nurka"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_B_Wetsuit",nil,200]
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
			["G_Diving",nil,50]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_RebreatherB",nil,500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		];
	};
};