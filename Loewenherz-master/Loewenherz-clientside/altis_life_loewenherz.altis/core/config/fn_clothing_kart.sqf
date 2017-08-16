/*
	File: fn_clothing_kart.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bobby's Kart Racing Outfits
*/
private["_filter"];
_filter = param [0,0,[0]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bobby's Kart-Racing Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_C_Driver_1_black",nil,15000],
		["U_C_Driver_1_blue",nil,15000],
		["U_C_Driver_1_red",nil,15000],
		["U_C_Driver_1_orange",nil,15000],
		["U_C_Driver_1_green",nil,15000],
		["U_C_Driver_1_white",nil,15000],
		["U_C_Driver_1_yellow",nil,15000],
		["U_C_Driver_2",nil,15000],
		["U_C_Driver_1",nil,15000],
		["U_C_Driver_3",nil,15000],
		["U_C_Driver_4",nil,15000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_RacingHelmet_1_black_F",nil,10000],
			["H_RacingHelmet_1_red_F",nil,10000],
			["H_RacingHelmet_1_white_F",nil,10000],
			["H_RacingHelmet_1_blue_F",nil,10000],
			["H_RacingHelmet_1_yellow_F",nil,10000],
			["H_RacingHelmet_1_green_F",nil,10000],
			["H_RacingHelmet_1_F",nil,10000],
			["H_RacingHelmet_2_F",nil,10000],
			["H_RacingHelmet_3_F",nil,10000],
			["H_RacingHelmet_4_F",nil,10000]
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