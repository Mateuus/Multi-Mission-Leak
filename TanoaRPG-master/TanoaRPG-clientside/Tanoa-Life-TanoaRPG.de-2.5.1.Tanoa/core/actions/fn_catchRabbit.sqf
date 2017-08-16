/*
	File: fn_catchRabbit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead rabbit?
*/
private["_obj"];
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if(([true,"rabbit",1] call tanoarpg_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText["Du hast etwas Hasenfleisch bekommen","PLAIN"];
};