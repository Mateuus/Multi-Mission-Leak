#include "..\script_macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
ES_session_tries = ES_session_tries + 1;
if(ES_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(ES_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(typeName _this,"STRING")) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(count _this,0)) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(SEL(_this,0),"Error")) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(!(EQUAL(getPlayerUID player,SEL(_this,0)))) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
ES_cash = parseNumber (SEL(_this,2));
ES_atmbank = parseNumber (SEL(_this,3));
CONST(ES_adminlevel,parseNumber (SEL(_this,4)));
CONST(ES_donator,parseNumber (SEL(_this,5)));



//Loop through licenses
if(count (SEL(_this,6)) > 0) then {
	{missionNamespace setVariable [SEL(_x,0),SEL(_x,1)];} foreach (SEL(_this,6));
};

ES_gear = SEL(_this,8);
[true] call ES_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		CONST(ES_coplevel, parseNumber(SEL(_this,7)));
		CONST(ES_medicLevel,0);
		ES_blacklisted = SEL(_this,9);

		ES_xp_cop = SEL(_this,10);
		[] call ES_fnc_xp_update;
	};
	
	case civilian: {

		ES_is_arrested = SEL(_this,7);

		ES_xp_civ = SEL(_this,9);
		[] call ES_fnc_xp_update;

		if(save_playerStats) then {
			ES_hunger = SEL(SEL(_this,10),0);
			ES_thirst = SEL(SEL(_this,10),1);
			player setDamage SEL(SEL(_this,10),2);
		};

		CONST(ES_coplevel, 0);
		CONST(ES_medicLevel, 0);
		ES_houses = SEL(_this,11);
		{
			_house = nearestBuilding (call compile format["%1", SEL(_x,0)]);
			ES_vehicles pushBack _house;
		} foreach ES_houses;
		
		ES_gangData = SEL(_this,12);
		if(!(EQUAL(count ES_gangData,0))) then {
			[] spawn ES_fnc_initGang;
		};
		[] spawn ES_fnc_initHouses;
	};
	
	case independent: {
		CONST(ES_medicLevel, parseNumber(SEL(_this,7)));
		CONST(ES_coplevel,0);
		ES_xp_med = SEL(_this,9);
		[] call ES_fnc_xp_update;
	};
};

if(count (SEL(_this,13)) > 0) then {
	{ES_vehicles pushBack _x;} foreach (SEL(_this,13));
};

ES_session_completed = true;