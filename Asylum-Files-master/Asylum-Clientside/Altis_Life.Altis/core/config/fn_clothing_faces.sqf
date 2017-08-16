/*
	File: fn_clothing_faces.sqf
	Author: John "Paratus" VanderZwetr

	Description:
	Master configuration file for faces
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Plastic Surgery"];

switch (worldName) do
{
	//Faces
	case "Tanoa":
	{
		[
			["AfricanHead_01","African 1",250],
			["AfricanHead_02","African 2",250],
			["AfricanHead_03","African 3",250],
			["AsianHead_A3_01","Asian 1",250],
			["AsianHead_A3_02","Asian 2",250],
			["AsianHead_A3_03","Asian 3",250],
			["AsianHead_A3_01","Asian 4",250],
			["AsianHead_A3_02","Asian 5",250],
			["AsianHead_A3_03","Asian 6",250],
			["AsianHead_A3_04","Asian 7",250],
			["AsianHead_A3_05","Asian 8",250],
			["AsianHead_A3_06","Asian 9",250],
			["AsianHead_A3_07","Asian 10",250],
			["GreekHead_A3_01","Greek 1",250],
			["GreekHead_A3_02","Greek 2",250],
			["GreekHead_A3_03","Greek 3",250],
			["GreekHead_A3_04","Greek 4",250],
			["GreekHead_A3_05","Greek 5",250],
			["GreekHead_A3_06","Greek 6",250],
			["GreekHead_A3_07","Greek 7",250],
			["GreekHead_A3_08","Greek 8",250],
			["GreekHead_A3_09","Greek 9",250],
			["PersianHead_A3_01","Persian 1",250],
			["PersianHead_A3_02","Persian 2",250],
			["PersianHead_A3_03","Persian 3",250],
			["TanoanHead_A3_01","Tanoan 1",250],
			["TanoanHead_A3_02","Tanoan 2",250],
			["TanoanHead_A3_03","Tanoan 3",250],
			["TanoanHead_A3_04","Tanoan 4",250],
			["TanoanHead_A3_05","Tanoan 5",250],
			["TanoanHead_A3_06","Tanoan 6",250],
			["TanoanHead_A3_07","Tanoan 7",250],
			["TanoanHead_A3_08","Tanoan 8",250],
			["WhiteHead_01","White 1",250],
			["WhiteHead_02","White 2",250],
			["WhiteHead_03","White 3",250],
			["WhiteHead_04","White 4",250],
			["WhiteHead_05","White 5",250],
			["WhiteHead_06","White 6",250],
			["WhiteHead_07","White 7",250],
			["WhiteHead_08","White 8",250],
			["WhiteHead_09","White 9",250],
			["WhiteHead_10","White 10",250],
			["WhiteHead_11","White 11",250],
			["WhiteHead_12","White 12",250],
			["WhiteHead_13","White 13",250],
			["WhiteHead_14","White 14",250],
			["WhiteHead_15","White 15",250]
		];
	};
	default
	{	
		[
			["AfricanHead_01","African 1",250],
			["AfricanHead_02","African 2",250],
			["AfricanHead_03","African 3",250],
			["AsianHead_A3_01","Asian 1",250],
			["AsianHead_A3_02","Asian 2",250],
			["AsianHead_A3_03","Asian 3",250],
			["AsianHead_A3_01","Asian 4",250],
			["AsianHead_A3_02","Asian 5",250],
			["AsianHead_A3_03","Asian 6",250],
			["GreekHead_A3_01","Greek 1",250],
			["GreekHead_A3_02","Greek 2",250],
			["GreekHead_A3_03","Greek 3",250],
			["GreekHead_A3_04","Greek 4",250],
			["GreekHead_A3_05","Greek 5",250],
			["GreekHead_A3_06","Greek 6",250],
			["GreekHead_A3_07","Greek 7",250],
			["GreekHead_A3_08","Greek 8",250],
			["GreekHead_A3_09","Greek 9",250],
			["PersianHead_A3_01","Persian 1",250],
			["PersianHead_A3_02","Persian 2",250],
			["PersianHead_A3_03","Persian 3",250],
			["WhiteHead_01","White 1",250],
			["WhiteHead_02","White 2",250],
			["WhiteHead_03","White 3",250],
			["WhiteHead_04","White 4",250],
			["WhiteHead_05","White 5",250],
			["WhiteHead_06","White 6",250],
			["WhiteHead_07","White 7",250],
			["WhiteHead_08","White 8",250],
			["WhiteHead_09","White 9",250],
			["WhiteHead_10","White 10",250],
			["WhiteHead_11","White 11",250],
			["WhiteHead_12","White 12",250],
			["WhiteHead_13","White 13",250],
			["WhiteHead_14","White 14",250],
			["WhiteHead_15","White 15",250]
		];
	};
};