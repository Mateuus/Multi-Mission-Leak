#include <macro.h>
/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(!(isNull objectParent player) && !(surfaceIsWater position (vehicle player))) exitWith {hint "Du kannst aus einem Fahrzeug heraus nichts kaufen bzw. verkaufen!"};
if(playerside != civilian) exitWith {hint "Die Stimme aus der Kiste sagt: Ich spreche nicht mit Beamten."};

createDialog "VIPshops_menu";

ctrlEnable[2447,false];
ctrlEnable[2448,false];
ctrlEnable[2449,false];
ctrlEnable[2450,false];
ctrlEnable[2451,false];

[] call life_fnc_virtVIP_update;