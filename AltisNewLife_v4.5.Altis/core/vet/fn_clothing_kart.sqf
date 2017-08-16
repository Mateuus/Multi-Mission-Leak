private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Karting"];
switch (_filter) do
{
	case 0:
	{
		[
		["U_C_Driver_1_black",nil,150],
		["U_C_Driver_1_blue",nil,150],
		["U_C_Driver_1_red",nil,150],
		["U_C_Driver_1_orange",nil,100],
		["U_C_Driver_1_green",nil,150],
		["U_C_Driver_1_white",nil,150],
		["U_C_Driver_1_yellow",nil,150],
		["U_C_Driver_1",nil,350],
		["U_C_Driver_2",nil,350],
		["U_C_Driver_3",nil,350],
		["U_C_Driver_4",nil,350]
		];
	};
	case 1:
	{
		[
			["H_RacingHelmet_1_black_F",nil,100],
			["H_RacingHelmet_1_blue_F",nil,100],
			["H_RacingHelmet_1_red_F",nil,100],
			["H_RacingHelmet_1_green_F",nil,100],
			["H_RacingHelmet_1_green_F",nil,100],
			["H_RacingHelmet_1_white_F",nil,100],
			["H_RacingHelmet_1_yellow_F",nil,100],
			["H_RacingHelmet_1_F",nil,250],
			["H_RacingHelmet_2_F",nil,250],
			["H_RacingHelmet_3_F",nil,250],
			["H_RacingHelmet_4_F",nil,250]
		];
	};
	case 2:
	{
		[
		];
	};
	case 3:
	{
		[
		];
	};
	case 4:
	{
		[
		];
	};
};