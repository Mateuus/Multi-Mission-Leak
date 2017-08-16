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
if(!([_val] call fnc_isnumber)) exitWith {};
if(_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

hint format["%1 gab dir %2€",_from getVariable["realname",name _from],[(parseNumber (_val))] call EMonkeys_fnc_numberText];
EMonkeys_c164 = EMonkeys_c164 + (parseNumber(_val));
[0] call SOCK_fnc_updatePartial;


_text = format ["*** Geld geben | SpielerID Empfänger: %1 | Name Empfänger: %2 | SpielerID: %3 | Name: %4 | Betrag: %5 |",getPlayerUID player,name player,getPlayerUID _from ,name _from,_val];
[[4,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;