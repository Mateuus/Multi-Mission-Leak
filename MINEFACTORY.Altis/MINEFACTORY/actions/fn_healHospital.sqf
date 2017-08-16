#include "..\..\script_macros.hpp"
/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(CASH < 100) exitWith {hint format[ "Du hast keine $%1, um geheilt zu werden.",100];};
titleText[ "Bitte bewege dich nicht","PLAIN"];

uiSleep 8;

if(player distance (_this select 0) > 5) exitWith {titleText[ "Du musst in der Nähe des Doktors bleiben, während du geheilt wirst","PLAIN"]};
titleText[ "Du wurdest geheilt.","PLAIN"];
player setDamage 0;
SUB(CASH,100);