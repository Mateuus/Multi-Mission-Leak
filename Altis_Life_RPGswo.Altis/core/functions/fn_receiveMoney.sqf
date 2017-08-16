#include "..\..\macros.hpp"
/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives money
*/
private["_unit","_val","_from"];
_unit = param [0,ObjNull,[ObjNull]];
_val = param [1,"",[""]];
_from = param [2,ObjNull,[ObjNull]];
if(isNull _unit OR isNull _from OR _val == "") exitWith {};
if(player != _unit) exitWith {};
if(!([_val] call DWF_fnc_isnumber)) exitWith {};
if(_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

hint format["%1 hat dir %2€ gegeben.",getPlayerName(_from),[(parseNumber (_val))] call DWEV_fnc_numberText];
dwf_cash = dwf_cash + (parseNumber(_val));