//Hier die fn_blaulicht.sqf:

/*
   File: fn_blaulicht.sqf
   Author: Basti aka. John Collins
   
   Description:
   This file was written for Eisenschmiede-Gaming.de
*/
private["_blaulicht","_vehicle"];
_vehicle = vehicle player;
if (!(playerside == west)) exitWith {};
if(!((typeOf _vehicle) in ["C_SUV_01_F","C_Hatchback_01_sport_F"])) exitWith {hintSilent "In diesem Fahrzeug kannst du das Blaulicht nicht benutzen." && [true,"blaulicht",1] call ES_fnc_handleInv};
if (count attachedObjects _vehicle >= 1) exitWith {hintSilent "Ein Magnetblaulicht ist schon aufgebaut."};
if (!((driver _vehicle) == player)) exitWith {hintSilent "Du bist nicht der Fahrer !" && [true,"blaulicht",1] call ES_fnc_handleInv};

_blaulicht = "Land_Camping_Light_off_F" createVehicle getpos _vehicle;
sleep 0.2;

switch (typeOf _vehicle) do
{
   case "C_SUV_01_F":
   {
    _blaulicht attachTo [_vehicle, [-0.6,-0.4,0.36]];
   };
   
   case "C_Hatchback_01_sport_F":
   {
   _blaulicht attachTo [_vehicle, [-0.55,-0.8,0.22]];
   };
};
sleep 0.2:
titleText["Du hast das Magnetblaulicht aufgebaut.","PLAIN"];
vehicle player setVariable ["BlauLicht",true,true];