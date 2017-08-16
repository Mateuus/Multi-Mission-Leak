#include "..\..\macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
DWEV_session_tries = DWEV_session_tries + 1;
if(DWEV_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(DWEV_session_tries > 3) exitWith {cutText["Es gab einen Fehler bei dem Versuch, den Client einzurichten.","BLACK FADED"]; 0 cutFadeOut 999999999;};
/*
diag_log format ["################# DatenPaket vom Server Empfangen: %1",_this];
if (worldName == "Tanoa") then
{
	diag_log format ["DatenPaket vom Server Empfangen: %1",_this];
};
*/
0 cutText ["Erhaltene Anfrage vom Server... Überprüfen...","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};


//Parse basic player information.
dwf_cash = parseNumber (_this select 2);
dwf_atmcash = parseNumber (_this select 3);
__CONST__(DWEV_adminlevel,(_this select 4));
__CONST__(DWEV_donator,(_this select 5));
__CONST__(DWEV_viplevel,(_this select 1));
//Loop through licenses
if(count (_this select 6) > 0) then 
{
	{missionNamespace setVariable [(_x select 0),(_x select 1)];false;} count (_this select 6);
};

DWEV_gear = _this select 8;
[] spawn DWEV_fnc_loadGear;

//Parse side specific information.
switch((side player)) do 
{
	case west: 
	{
		__CONST__(DWEV_coplevel, (_this select 7));
		__CONST__(DWEV_medicLevel,0);
		__CONST__(DWEV_opforlevel,0);
		DWEV_blacklisted = _this select 9;
		DWEV_combatlog = _this select 11;
	};
	
	case civilian: 
	{
		DWEV_is_arrested = _this select 7;
		DWEV_blacklisted = _this select 9;
		DWEV_check_coplevel = (_this select 11);
		DWEV_check_mediclevel = (_this select 12);
		DWEV_combatlog = _this select 13;
		
		__CONST__(DWEV_coplevel,0);
		__CONST__(DWEV_medicLevel,0);
		__CONST__(DWEV_opforlevel,0);		
		
		if ((_this select 10) == 1) then {player setVariable["noobschutz",true,true];};  // Noobschutz aus Datenbank wiederherstellen solange er noch vorhanden ist
		
		DWEV_houses = _this select 14;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			DWEV_vehicles pushBack _house;
			false;
		} count DWEV_houses;
		   
		
		DWEV_gangData = _this select 15;
		if(count DWEV_gangData != 0) then 
		{
			[] spawn DWEV_fnc_initGang;
		};
		
		[] spawn DWEV_fnc_initHouses;
	};
	
	case independent: 
	{
		__CONST__(DWEV_medicLevel, (_this select 7));
		__CONST__(DWEV_coplevel,0);
		__CONST__(DWEV_opforlevel,0);
		DWEV_blacklisted = _this select 9;
		DWEV_combatlog = _this select 11;
	};
	
	case east: 
	{
		__CONST__(DWEV_opforlevel, (_this select 7));
		__CONST__(DWEV_medicLevel,0);
		__CONST__(DWEV_coplevel,0);
		DWEV_blacklisted = _this select 9;
		DWEV_combatlog = _this select 11;
	};
};

switch(__GETC__(DWEV_donator)) do
{
	case 1: {DWEV_paycheck = DWEV_paycheck + 750;};
	case 2: {DWEV_paycheck = DWEV_paycheck + 1500;};
	case 3: {DWEV_paycheck = DWEV_paycheck + 2000;};
	case 4: {DWEV_paycheck = DWEV_paycheck + 2500;};
};

switch(__GETC__(DWEV_coplevel)) do
{
	case 1: {DWEV_paycheck = DWEV_paycheck + 0;}; //1000
	case 2: {DWEV_paycheck = DWEV_paycheck + 500;};//1500
	case 3: {DWEV_paycheck = DWEV_paycheck + 1250;};//2250
	case 4: {DWEV_paycheck = DWEV_paycheck + 2000;};//3000
	case 5: {DWEV_paycheck = DWEV_paycheck + 2750;};//3750
	case 6: {DWEV_paycheck = DWEV_paycheck + 3500;};//4500
	case 7: {DWEV_paycheck = DWEV_paycheck + 4000;};//5000
	case 8: {DWEV_paycheck = DWEV_paycheck + 4000;};//5000
	case 9: {DWEV_paycheck = DWEV_paycheck + 4000;};//5000
};
if (actionSpendenziel1) then {DWEV_paycheck = (DWEV_paycheck / 0.8);};

if(count (_this select 21) > 0) then // Schlüssel wiederherstellen
{
	{DWEV_vehicles pushBack _x; false;} count (_this select 21);
};

DWEV_session_completed = true;

