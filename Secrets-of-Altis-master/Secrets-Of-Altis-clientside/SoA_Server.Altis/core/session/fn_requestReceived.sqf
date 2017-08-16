#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};


//Parse basic player information.
life_beatgeld = parseNumber (_this select 2);
life_beatbankgeld = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));
if(count (_this select 6) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

// 8 gear 
life_gear = _this select 8;
[] spawn life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		// 7 coplevel
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_ahwLevel,0);		

		//paycheck:
		switch(parseNumber(_this select 7)) do	{
			case 1: {life_paycheck = life_paycheck + 10000;};
			case 2: {life_paycheck = life_paycheck + 15000;};
			case 3: {life_paycheck = life_paycheck + 17000;};
			case 4: {life_paycheck = life_paycheck + 20000;};
			case 5: {life_paycheck = life_paycheck + 23000;};
			case 6: {life_paycheck = life_paycheck + 25000;};
			case 7: {life_paycheck = life_paycheck + 28000;};
			case 8: {life_paycheck = life_paycheck + 30000;};
			case 9: {life_paycheck = life_paycheck + 35000;};
		};
		
		// Erfolge
		if(count (_this select 10) > 0) then {
			{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 10);
		};
		
		// Serverpoints
		life_serverpoints = parseNumber (_this select 11);
		
		//Apps
		if(count (_this select 12) > 0) then {
			{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 12);
		};
		
		//Guthaben
		life_guthaben = parseNumber (_this select 13);
		
		//activity
		life_activity = parseNumber (_this select 14);

		timecollected = parsenumber (_this select 15);
	};	
	case civilian: {
		// 7 arrested		
		life_is_arrested = _this select 7;

		__CONST__(life_coplevel, 0);
		__CONST__(life_ahwLevel, 0);
		
		// 9 alive.
		if(!(_this select 9) || life_newplayer)then{
			[] spawn life_fnc_CivLoadOut;
		};

		// 10 exp system
		life_exp = parseNumber (_this select 10);
		
		// 11 Erfolge
		if(count (_this select 11) > 0) then {
			{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 11);
		};	
		
		// 12 Serverpoints
		life_serverpoints = parseNumber (_this select 12);
		
		// 13 Apps
		if(count (_this select 13) > 0) then {
			{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 13);
		};
		
		// 14 Guthaben
		life_guthaben = parseNumber (_this select 14);

		// 15 Ausweis
		life_ausweisdaten = _this select 15;

		// 16 Kennzeichen
		life_veh_kfz = _this select 16;
		if(life_veh_kfz IsEqualTo [""]) then {life_veh_kfz = ""};

		// 17 timeplayed
		timecollected = parsenumber (_this select 17);
		
		// 18 häuser
		life_houses = _this select 18;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		[] spawn life_fnc_initHouses;
		
		// 19 Gangs
		life_gangData = _this select 19;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
	};
	
	case independent: {
		__CONST__(life_ahwLevel, parseNumber(_this select 7));
		__CONST__(life_copLevel,0);	

		// paycheck:
		switch(parseNumber(_this select 7)) do	{
			case 1: {life_paycheck = life_paycheck + 15000;};
			case 2: {life_paycheck = life_paycheck + 20000;};
			case 3: {life_paycheck = life_paycheck + 25000;};
			case 4: {life_paycheck = life_paycheck + 30000;};
			case 5: {life_paycheck = life_paycheck + 35000;};
			case 6: {life_paycheck = life_paycheck + 40000;};
			case 7: {life_paycheck = life_paycheck + 45000;};
			case 8: {life_paycheck = life_paycheck + 45000;};
		};
				
		// Erfolge
		if(count (_this select 10) > 0) then {
			{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 10);
		};
		
		// Serverpoints
		life_serverpoints = parseNumber (_this select 11);
		
		// Apps
		if(count (_this select 12) > 0) then {
			{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 12);
		};
		
		//Guthaben
		life_guthaben = parseNumber (_this select 13);
		
		//activity
		life_activity = parseNumber (_this select 14);

		timecollected = parsenumber (_this select 15);
	};
	
	/*case east: {
		__CONST__(life_adacLevel, parseNumber(_this select 7));
		__CONST__(life_copLevel,0);
		__CONST__(life_ahwLevel,0);

		// payChecks.
		switch(parseNumber(_this select 7)) do{
			case 1: {life_paycheck = life_paycheck + 15000;};
			case 2: {life_paycheck = life_paycheck + 20000;};
			case 3: {life_paycheck = life_paycheck + 30000;};
			case 4: {life_paycheck = life_paycheck + 35000;};
			case 5: {life_paycheck = life_paycheck + 40000;};
		};
		
		// Erfolge
		if(count (_this select 10) > 0) then {
			{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 10);
		};
		
		// Serverpoints
		life_serverpoints = parseNumber (_this select 11);
		
		// Apps
		if(count (_this select 12) > 0) then {
			{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 12);
		};
		
		//Guthaben
		life_guthaben = parseNumber (_this select 13);
		
		//activity
		life_activity = parseNumber (_this select 14);
	};*/
};

// 17 die Schlüssel.
if(count (_this select 20) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 20);
};

life_session_completed = true;