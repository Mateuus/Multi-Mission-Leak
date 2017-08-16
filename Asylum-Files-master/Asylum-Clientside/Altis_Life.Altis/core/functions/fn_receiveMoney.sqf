/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives money
*/
private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val == "") exitWith {};
if(player != _unit) exitWith {};
if(!([_val] call life_fnc_isnumber)) exitWith {};

hint format["%1 has given you $%2",name _from,[(parseNumber (_val))] call life_fnc_numberText];
["cash","add",parseNumber(_val)] call life_fnc_uC;

[[59, player, format["Given $%1 from %2 (%3)", _val, name _from, getPlayerUID _from]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;