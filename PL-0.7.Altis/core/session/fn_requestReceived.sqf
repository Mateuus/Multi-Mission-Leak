#include "..\..\script_macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
private["_array"];
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(typeName _this,"STRING")) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(count _this,0)) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(SEL(_this,0),"Error")) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(!(EQUAL(steamid,SEL(_this,0)))) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
CASH = parseNumber (SEL(_this,2));
BANK = parseNumber (SEL(_this,3));
CONST(life_adminlevel, (SEL(_this,4)));
CONST(life_donator, (SEL(_this,5)));

//Loop through licenses
if(count (SEL(_this,6)) > 0) then {
	{SVAR_MNS [SEL(_x,0),SEL(_x,1)];} foreach (SEL(_this,6));
};

life_gear = SEL(_this,8);
[true] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		CONST(life_coplevel, (SEL(_this,7)));
		CONST(life_mediclevel,0);
		CONST(life_armerlevel,0);
		life_blacklisted = SEL(_this,9);
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,10),0);
			life_thirst = SEL(SEL(_this,10),1);
		};
	};

	case civilian: {
		life_is_arrested = SEL(_this,7);
		CONST(life_coplevel, 0);
		CONST(life_mediclevel, 0);
		CONST(life_armerlevel,0);
		life_job = parseNumber(_this select 10);

		life_houses = SEL(_this,11);
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,9),0);
			life_thirst = SEL(SEL(_this,9),1);
		};
		{
			_house = nearestBuilding (call compile format["%1", SEL(_x,0)]);
			life_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = SEL(_this,12);
		if(!(EQUAL(count life_gangData,0))) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};

	case independent: {
		CONST(life_mediclevel, (SEL(_this,7)));
		CONST(life_coplevel,0);
		CONST(life_armerlevel,0);
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,9),0);
			life_thirst = SEL(SEL(_this,9),1);
		};
	};

	case east: {
		CONST(life_armerlevel, (SEL(_this,7)));
		CONST(life_coplevel,0);
		CONST(life_mediclevel,0);
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,9),0);
			life_thirst = SEL(SEL(_this,9),1);
		};
	}
};

if(count (SEL(_this,13)) > 0) then {
	{life_vehicles pushBack _x;} foreach (SEL(_this,13));
};

life_session_completed = true;
