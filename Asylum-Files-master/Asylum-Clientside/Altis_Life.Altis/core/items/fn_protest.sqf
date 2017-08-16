/*
	File: fn_protest.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Holds a random protest sign!
*/

private ["_started"];

if (life_protesting) exitWith {};
if (!isNull life_object_inhand) exitWith {hint "You're already holding an object."};

_started = time;
life_protesting = true;
if (!([animationState player,"_salute"] call KRON_StrInStr)) then { player playAction "Salute"; };

waitUntil { ([animationState player,"_salute"] call KRON_StrInStr) || ((time - _started) > 5) };
if ((time - _started) > 5) exitWith {life_protesting = false};

closeDialog 0;
titleText["Rabble rabble rabble!","PLAIN"];

life_object_inhand = "Land_Poster_04_F" createVehicle [0,0,0];
life_object_inhand attachTo [player, [0,0,0.6], "righthand"];
life_object_inhand setVectorUp [0,90,-1];

waitUntil { !([animationState player,"_salute"] call KRON_StrInStr) };

deleteVehicle life_object_inhand;
life_protesting = false;