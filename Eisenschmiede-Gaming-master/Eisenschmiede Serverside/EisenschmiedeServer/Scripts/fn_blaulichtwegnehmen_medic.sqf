/*
   File: fn_blaulichtwegnehmen_medic.sqf
   Author: Basti aka. John Collins
   
   Description:
   This file was written for Eisenschmiede-Gaming.de
*/

if (!(playerside in [west,independent])) exitWith {};

if (vehicle player getVariable "lights") exitWith {hintSilent "Das Blaulicht ist noch an !"};

{ detach _x; } forEach nearestObjects [vehicle player,["Land_Camping_Light_off_F"],5];
{ deleteVehicle _x; } forEach nearestObjects [vehicle player,["Land_Camping_Light_off_F"],5];
vehicle player setVariable ["BlauLicht",false,true];