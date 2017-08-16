/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call GTA_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Jet Clothing Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		//["U_O_PilotCoveralls","Pilot Coveralls",10000],
		["U_I_pilotCoveralls","Pilot Coveralls",10000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_PilotHelmetFighter_O","Pilot Helmet",25000],
			["H_PilotHelmetFighter_I","Pilot Helmet",25000]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Aviator",nil,1000]
		];
	};

	//Vests
	case 3:
	{
		[
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_Parachute",nil,5000]
		];
	};
};
