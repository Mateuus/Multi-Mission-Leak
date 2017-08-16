/*
   File: fn_blaulicht_medic.sqf
   Author: Basti aka. John Collins
   
   Description:
   This file was written for Eisenschmiede-Gaming.de
*/
private["_blaulicht1","_blaulicht2","_blaulicht3","_vehicle"];
_vehicle = vehicle player;
if (!(playerside == independent)) exitWith {};

if (!((typeOf _vehicle) in ["I_Truck_02_box_F","B_Truck_01_transport_F","B_Truck_01_mover_F","C_Van_01_box_F"])) exitWith {hintSilent "In diesem Fahrzeug kannst du das Blaulicht nicht benutzen."};

if (count attachedObjects _vehicle >= 2) exitWith {hintSilent "Ein Magnetblaulicht ist schon aufgebaut."};

if (!((driver _vehicle) == player)) exitWith {hintSilent "Du bist nicht der Fahrer !"};

_blaulicht1 = "Land_Camping_Light_off_F" createVehicle getpos _vehicle;
_blaulicht2 = "Land_Camping_Light_off_F" createVehicle getpos _vehicle;

sleep 0.2;

switch (typeOf _vehicle) do
{
   case "B_Truck_01_transport_F":
   {
      _blaulicht1 attachTo [_vehicle, [-1,4,0.5]];
      _blaulicht2 attachTo [_vehicle, [1,4,0.5]];
   };
   
   case "B_Truck_01_mover_F":
   {
      _blaulicht1 attachTo [_vehicle, [-1,4,0.8]];
      _blaulicht2 attachTo [_vehicle, [1,4,0.8]];
   };
   
   case "I_Truck_02_box_F":
   {
      _blaulicht1 attachTo [_vehicle, [0.87, 3.1, 0.5]];
      _blaulicht2 attachTo [_vehicle, [-0.87, 3.1, 0.5]]; 
   };

   case "C_Van_01_box_F":
   {
      _blaulicht3 = "Land_Camping_Light_off_F" createVehicle getpos _vehicle;
      _blaulicht1 attachTo [vehicle player, [-0.7, 0, 0.8]];
      _blaulicht2 attachTo [vehicle player, [0.7, 0, 0.8]];
      _blaulicht3 attachTo [vehicle player, [0.85, -3.37, 1.53]];
   };
};

vehicle player setVariable ["BlauLicht",true,true];