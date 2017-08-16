/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Recieves the money given by somebody nearby
*/

private ["_value","_unit","_parsedValue"];

_value = [_this,0,"",[0]] call BIS_fnc_param;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
//if(player != _unit) exitWith {};
if(!([_value] call DS_fnc_isNumber)) exitWith {};

hint format ["%1 has given you $%2",(name _unit),[_value] call DS_fnc_numberText];
[_value,false,true] call DS_fnc_handleMoney;
[] call DS_fnc_compileData;























