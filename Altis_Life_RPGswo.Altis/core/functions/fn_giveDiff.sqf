#include "..\..\macros.hpp"
/*
	File: fn_giveDiff.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	??A?SD?ADS?A
*/
private ["_unit","_item","_val","_from","_bool"];
_unit = _this select 0;
if !(_unit isEqualTo player) exitWith {};
_item = _this select 1;
_val = _this select 2;
_from = _this select 3;
_bool = if (count _this > 4) then {true} else {false};
_type = M_CONFIG(getText,"VirtualItems",_item,"displayName");

if(_bool) then
{
	if(([true,_item,(parseNumber _val)] call DWEV_fnc_handlelnv)) then
	{
		hint format["Du hast versucht %1 %2 %3 zu geben, aber aus platzmangel wurde es dir zurückgegeben.",getPlayerName(_from),_val,_type];
	};
}
	else
{
	if(([true,_item,(parseNumber _val)] call DWEV_fnc_handlelnv)) then
	{
		hint format["%1 gab %2 %3 zurück weil er keinen Platz mehr dafür hatte.",getPlayerName(_from),_val,_type];
	};
};