/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private["_obj"];
_obj = cursorTarget;
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!
//if({side _x == west} count playableUnits < 1) exitWith {hint "Es sind zu wenig Polizisten Online"; deleteVehicle _obj;};

if(([true,"turtle",1] call EMonkeys_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText["Du hast etwas Schildkrötenfleisch gesammelt","PLAIN"];
};