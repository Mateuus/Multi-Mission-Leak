#include "\hst_life_phone\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_list","_type"];
_amount = parseNumber (_this select 0);
if(isNil "_amount") exitWith {};
if(_amount < 0) exitWith {};
if(CASH < _amount) exitWith {hint "Nie masz wystarczajaco pieniedzy";};
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};
CASH = CASH - _amount;
hst_life_phone_activeCardSaldo = hst_life_phone_activeCardSaldo + _amount;
[0] call SOCK_fnc_updatePartial;
[0,hst_life_phone_activeCard] spawn life_fnc_phoneCardUpdate;