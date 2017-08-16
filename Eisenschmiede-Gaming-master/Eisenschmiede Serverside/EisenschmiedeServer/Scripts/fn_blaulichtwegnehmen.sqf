/*
   File: fn_blaulichtwegnehmen.sqf
   Author: Basti aka. John Collins
   
   Description:
   This file was written for Eisenschmiede-Gaming.de
*/
private["_blaulicht"];
if (vehicle player getVariable "lights") exitWith {hintSilent "Das Blaulicht ist noch dran !"};
if (!((driver vehicle player) == player)) exitWith {hintSilent "Du bist nicht der Fahrer !"};
_blaulicht = nearestObjects[vehicle player,["Land_Camping_Light_off_F"],5] select 0;
detach _blaulicht;
deleteVehicle _blaulicht;
[true,"blaulicht",1] call ES_fnc_handleInv;
titleText["Du hast das Magnetblaulicht abgebaut.","PLAIN"];
vehicle player setVariable ["BlauLicht",false,true];