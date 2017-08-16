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

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call XAS_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call XAS_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call XAS_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call XAS_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call XAS_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donator")) exitWith {
	[profileName,getPlayerUID player,"VariablesAlreadySet"] remoteExec ["SPY_fnc_cookieJar", 2, false];
	[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donator: %3",life_adminlevel,life_coplevel,life_donator]] remoteExec ["SPY_fnc_notifyAdmins", -2, false];
	sleep 0.9;
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};

//Parse basic player information.
life_cash = parseNumber (_this select 2);
life_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

life_gear = _this select 8;
[] call tanoarpg_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		__CONST__(life_adaclevel,0);
		life_blacklisted = _this select 9;
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		__CONST__(life_adaclevel,0);
		life_houses = _this select 9;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		life_gangData = _This select 10;
		if(count life_gangData != 0) then {
			[] spawn tanoarpg_fnc_initGang;
		};
		[] spawn tanoarpg_fnc_initHouses;
		
		if((__GETC__(life_donator)) == 1) then // Donator 10 euro *3
		{
			life_paycheck = (life_paycheck * 3);
		};
		if((__GETC__(life_donator)) > 1) then // Donator 20 euro *5
		{
			life_paycheck = (life_paycheck * 5);
		};
	};
	
	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);
		__CONST__(life_adaclevel,0);
	};
	
	case east: {
        __CONST__(life_adaclevel, parseNumber(_this select 7));
        __CONST__(life_coplevel,0);
        __CONST__(life_medicLevel,0);
    };
};

if(count (_this select 12) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 12);
};

life_session_completed = true;