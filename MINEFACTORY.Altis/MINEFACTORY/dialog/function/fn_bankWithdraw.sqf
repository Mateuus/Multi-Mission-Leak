#include "..\..\..\script_macros.hpp"
/*
	File: fn_bankWithdraw.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Withdraws money from the players account
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint  "AbhebenMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint  "Die eingegebene Zahl ist keine richtige Zahl"};
if(_val > BANK) exitWith {hint  "Du hast nicht so viel Geld auf deinem Bankkonto!"};
if(_val < 100 && BANK > 20000000) exitWith {hint  "AbhebenMin"}; //Temp fix for something.

ADD(CASH,_val);
SUB(BANK,_val);
hint format [ "AbhebenSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;