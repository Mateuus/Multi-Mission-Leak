/*
Author: Bryan "Tonic" Boardwine
Description:
Verifies that the ticket was paid.
*/
private["_value","_unit","_adac"];
_value = [_this,0,5,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_adac = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR {_unit != life_rechnung_unit}) exitWith {}; //NO
if(isNull _adac OR {_adac != player}) exitWith {}; //Double NO
life_beatbankgeld = life_beatbankgeld + _value;