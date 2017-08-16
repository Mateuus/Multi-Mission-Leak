/*
	File: D41_wetter.sqf
	Author: Distrikt41.de - Dscha

	Description:
	Random Weather Script - What else can i say?
	Updated: 16.11.2014
*/
	private ["_fnc_meteo"];
	ANL_fog = [0,0,0];
	ANL_vague = 1;
	ANL_chgt = 0.5;
	ANL_vent = [1, 1, true];
	ANL_rain = 0;
	ANL_rainCounter = 1;
	
	_fnc_meteo =
	{
		if (isDedicated) then
			{
				ANL_chance = round(random 100);
				if(ANL_chance <= 5) then
					{
						ANL_fog = [0,0,0]; ANL_vague = 1; ANL_chgt = 0.2; ANL_vent = [2, 2, true]; ANL_rain = 0; ANL_rainCounter = 0;
						ANL_Meteo = round(random 2);
						if(ANL_Meteo == 0)	then {ANL_fog = [0.6, 0.1,30];	ANL_rainCounter = 0;};
						if(ANL_Meteo == 1)	then {ANL_fog = [0.5, 0.1,30];	ANL_rain = 0.2;	ANL_chgt = 0.5;};
						if(ANL_Meteo == 2)	then {ANL_fog = [0.1, 0.1,50];	ANL_rain = 0.4;	ANL_vague = 1;	ANL_chgt = 0.5;};
					};
				if(ANL_chance >=6 && ANL_chance <= 35 && ANL_rainCounter == 0) then
					{
						ANL_fog = [0,0,0]; ANL_vague = 1; ANL_chgt = 1; ANL_rain = 0; ANL_rainCounter = 0;
						ANL_Meteo = round(random 2);
						if(ANL_Meteo == 0)	then {ANL_fog = 0.1;	ANL_vague = 1;		ANL_chgt = 0.9; ANL_vent = [4, 4, true];	ANL_rain = 0.5;};
						if(ANL_Meteo == 1)	then {ANL_fog = 0.2;	ANL_vague = 1;		ANL_chgt = 0.8; ANL_vent = [0, 5, true];	ANL_rain = 0.5;};
						if(ANL_Meteo == 2)	then {ANL_fog = 0.1;	ANL_vague = 1;		ANL_chgt = 0.7; ANL_vent = [6, 0, true];	ANL_rain = 0.3;
					};
				if(ANL_chance >=6 && ANL_chance <= 35 && ANL_rainCounter == 1) then {ANL_chance = 36};
				if(ANL_chance >=36 && ANL_chance <= 90) then
				{
					ANL_fog = [0,0,0]; ANL_vague = 1; ANL_chgt = 0.2; ANL_vent = [5, 5, true]; ANL_rain = 0; ANL_rainCounter = 0;
					ANL_Meteo = round(random 2);
					if(ANL_Meteo == 0)	then {ANL_chgt = 0.9;	ANL_vent = [2, 0, true];};
					if(ANL_Meteo == 1)	then {ANL_chgt = 0.6;	ANL_vent = [0, 3, true];}; 
					if(ANL_Meteo == 2)	then {ANL_chgt = 0.4;	ANL_vent = [3, 1, true];};
				};
				if(ANL_chance >=91 && ANL_chance <= 100) then
				{
					ANL_fog = [0,0,0]; ANL_vague = 1; ANL_chgt = 0.2; ANL_vent = [1, 1, true]; ANL_rain = 0; ANL_rainCounter = 1;
					ANL_Meteo = round(random 2);
					if(ANL_Meteo == 0)	then {ANL_chgt = 0.2;	ANL_vent = [5, 5, true];};
					if(ANL_Meteo == 1)	then {ANL_chgt = 0.2;	ANL_vent = [0, 3, true];};
					if(ANL_Meteo == 2)	then {ANL_chgt = 0.1;	ANL_vent = [0, 0, true];};				
				};
				diag_log format ["::::::::: METEO FRANCE ::::::::: Chance = %1 ::: Meteo = %2",ANL_chance, ANL_Meteo];
				publicVariable "ANL_fog";
				publicVariable "ANL_vague";
				publicVariable "ANL_chgt";
				publicVariable "ANL_vent";
				publicVariable "ANL_rain";
			};
	};
	if(isDedicated)then
	{
		while{true}do
		{
			[] call _fnc_meteo;
			uiSleep 1;
			0 setfog (ANL_fog);
			60 setRain (ANL_rain);
			0 setOvercast (ANL_chgt);
			setWind (ANL_vent);
			60 setWaves (ANL_vague);
			uiSleep 1200;
		};
	};
	if (!isDedicated) then
	{
		while{true}do
		{
			0 setfog (ANL_fog);
			60 setRain (ANL_rain);
			0 setOvercast (ANL_chgt);
			setWind (ANL_vent);
			60 setWaves (ANL_vague);
			uiSleep 180;
		};
	};