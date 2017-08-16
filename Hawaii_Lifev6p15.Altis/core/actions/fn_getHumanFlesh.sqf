/*
	File: fn_getHumanFlesh.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private["_obj"];
_obj = param [0,ObjNull,[ObjNull]];
if(isNull _obj) exitWith {};
if(alive _obj) exitWith {};

if(([true,"humanflesh",1] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtHumanFlesh","PLAIN"];
};