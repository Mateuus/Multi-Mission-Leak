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
CONST(life_adminlevel,parseNumber (SEL(_this,4)));
CONST(life_donatorlvl,parseNumber (SEL(_this,5)));

//Loop through licenses
if(count (SEL(_this,6)) > 0) then {
	{SVAR_MNS [SEL(_x,0),SEL(_x,1)];} foreach (SEL(_this,6));
};

life_gear = SEL(_this,8);
[true] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		CONST(life_coplevel, parseNumber(SEL(_this,7)));
		CONST(life_medicLevel,0);
		life_blacklisted = SEL(_this,9);
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,10),0);
			life_thirst = SEL(SEL(_this,10),1);
		};
	};

	case civilian: {
		life_is_arrested = SEL(_this,7);
		CONST(life_coplevel, 0);
		CONST(life_medicLevel, 0);
		life_EXPLevel = SEL(_this,10);
		life_EXPCount = SEL(_this,11);
		life_EXPKills = SEL(_this,12);
		life_EXPDeaths = SEL(_this,13);
		life_civTime = SEL(_this,14);
		life_houses = SEL(_this,15);
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,9),0);
			life_thirst = SEL(SEL(_this,9),1);
		};
		{
			_house = nearestBuilding (call compile format["%1", SEL(_x,0)]);
			life_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = SEL(_this,16);
		if(!(EQUAL(count life_gangData,0))) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};

	case independent: {
		CONST(life_medicLevel, parseNumber(SEL(_this,7)));
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,9),0);
			life_thirst = SEL(SEL(_this,9),1);
		};
	};
};

if(count (SEL(_this,17)) > 0) then {
	{life_vehicles pushBack _x;} foreach (SEL(_this,17));
};

life_session_completed = true;

_Items = [["peach",50],["ananas",60],["banane",60],["drakefruit",225],["salema_raw",115],["ornate_raw",115],["mackerel_raw",325],["mullet_raw",325],["tuna_raw",615],["catshark_raw",750],["rabbit_raw",95],["hen_raw",1000],["rooster_raw",1000],["sheep_raw",2000],["goat_raw",2000],["kokosfleisch",800],["kokosmilch",900],["kaffee",1200],["zucker",1600],["copper",1650],["zigaretten",2300],["drakecocktail",1200],["steel",3900],["holz",2250],["coal",1000],   ["crab",1000],["marijuana",1800],["meth",3350],["palmenOl",2250],["kristalle",5900],["uranIL",5100],   ["coralP",2500],["antiqui",2550],["goldbar",90000],["waterBottle",5],["coffee",5],["turtle_raw",6000],["turtlesoup",1000],["donuts",60],["tbacon",25],["lockpick",75],["pickaxe",750],["redgull",200],["painkillers",100],["morphium",100],["fuelFull",500],["spikeStrip",1200],["handcuffs",200],["handcuffkeys",1000]];
[1,_Items] remoteExecCall ["life_fnc_update",player];
