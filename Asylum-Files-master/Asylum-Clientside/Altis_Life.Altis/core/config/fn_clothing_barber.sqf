/*
	File: fn_clothing_barber.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Master configuration file for barber shop
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bobby's Kart-Racing Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[];
	};

	//Hats
	case 1:
	{
		[["TRYK_H_wig",nil,200]];
	};

	//Glasses
	case 2:
	{
		[
			["TRYK_Beard_BK",nil,100],
			["TRYK_Beard",nil,100],
			["TRYK_Beard_BW",nil,100],
			["TRYK_Beard_Gr",nil,100],
			["TRYK_Beard_BK2",nil,100],
			["TRYK_Beard2",nil,100],
			["TRYK_Beard_BW2",nil,100],
			["TRYK_Beard_Gr2",nil,100],
			["TRYK_Beard_BK3",nil,250],
			["TRYK_Beard3",nil,250],
			["TRYK_Beard_BW3",nil,250],
			["TRYK_Beard_Gr3",nil,250],
			["TRYK_Beard_BK4",nil,300],
			["TRYK_Beard4",nil,300],
			["TRYK_Beard_Gr4",nil,300],
			["TRYK_Beard_BW4",nil,300]
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