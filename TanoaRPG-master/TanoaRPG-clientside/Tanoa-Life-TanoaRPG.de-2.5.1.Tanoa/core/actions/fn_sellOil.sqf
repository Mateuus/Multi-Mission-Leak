#include <macro.h>
/*
	File: fn_sellOil.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the oil to the oil trader.
	Will be revised.
*/
private["_val"];

//GET OUT OF YOU FUCKING VEHICLE !!!!!
if(vehicle player != player) exitWith {hint "Beweg deinen Arsch aus dem Fahrzeug"};

_val = life_inv_oilp;

if(life_inv_oilp < 10) exitWith { hint "Du benötigst mindestens 10 Liter Euro Diesel";};
if(([false,"oilp",_val] call tanoarpg_fnc_handleInv)) then
{
	titleText[format["Du hast erfolgreich %1 Liter Euro-Diesel in Kerosin verarbeitet",_val],"PLAIN"];
	if(!([true,"fuelK",_val] call tanoarpg_fnc_handleInv)) exitWith {[true,"oilp",_val] call tanoarpg_fnc_handleInv};
};