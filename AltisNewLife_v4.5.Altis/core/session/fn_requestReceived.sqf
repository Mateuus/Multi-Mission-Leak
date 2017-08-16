#include <macro.h>
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {};
if(life_session_tries > 3) exitWith {cutText["Il y a eu une erreur en essayant de configurer votre client.","BLACK FADED"]; 0 cutFadeOut 999999999;};
0 cutText [format["Données reçues, traitement en cours...\nVotre nom : %1\nVotre ID : %2",profileName,getPlayerUID player],"BLACK FADED"];
0 cutFadeOut 9999999;

if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((steamid) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
argent_liquide = parseNumber (_this select 2);
compte_banque = parseNumber (_this select 3);
CONST(bitch_level,parseNumber(_this select 4));
CONST(life_donator,parseNumber(_this select 5));
//Loop through licenses
if(count (_this select 6) > 0) then {
	{SVAR_MNS [(_x select 0),(_x select 1)];} foreach (_this select 6);
};
life_gear = _this select 8;
[] call life_fnc_loadGear;
switch (GETC(life_donator)) do
{
	case 1: {life_paycheck = life_paycheck + 100;};
	case 2: {life_paycheck = life_paycheck + 200;};
	case 3: {life_paycheck = life_paycheck + 300;};
	case 4: {life_paycheck = life_paycheck + 400;};
	case 5: {life_paycheck = life_paycheck + 500;};
	case 6: {life_paycheck = life_paycheck + 600;};
};
switch(playerSide) do {
	case west: {
		CONST(life_coplevel,parseNumber(_this select 7));
		life_blacklisted = _this select 9;
		CONST(life_medicLevel,0);
		CONST(life_adacLevel,0);
		CONST(life_reblevel,0);
		CONST(life_tafflevel,0);		
	};

	case civilian: {
		life_is_arrested = _this select 7;
		CONST(life_reblevel,parseNumber(_this select 9));
		CONST(life_tafflevel,parseNumber(_this select 12));
		civ_position = _this select 10;
        life_is_alive = _this select 11;
		CONST(life_coplevel,0);
		CONST(life_medicLevel,0);
		CONST(life_adacLevel,0);
		life_houses = _this select 13;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = _this select 14;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};

	case independent: {
		CONST(life_medicLevel, parseNumber(_this select 7));
		CONST(life_copLevel,0);
		CONST(life_adacLevel,0);
		CONST(life_reblevel,0);
		CONST(life_tafflevel,0);		
	};

	case east: {
		CONST(life_adacLevel,parseNumber(_this select 7));
		CONST(life_copLevel,0);
		CONST(life_medicLevel,0);
		CONST(life_reblevel,0);
		CONST(life_tafflevel,0);		
	};
};
if(count (_this select 15) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 15);
};
switch (GETC(life_coplevel)) do
{
	case 1: {life_paycheck = life_paycheck + 0;};
	case 2: {life_paycheck = life_paycheck + 50;};
	case 3: {life_paycheck = life_paycheck + 100;};
	case 4: {life_paycheck = life_paycheck + 150;};
	case 5: {life_paycheck = life_paycheck + 200;};
	case 6: {life_paycheck = life_paycheck + 300;};
	case 7: {life_paycheck = life_paycheck + 400;};
	case 8: {life_paycheck = life_paycheck + 500;};
	case 9: {life_paycheck = life_paycheck + 600;};
	case 10: {life_paycheck = life_paycheck + 650;};
	case 11: {life_paycheck = life_paycheck + 700;};
	case 12: {life_paycheck = life_paycheck + 800;};
};
life_session_completed = true;