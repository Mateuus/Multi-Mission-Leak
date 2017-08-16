#include "..\..\script_macros.hpp"
private ["_schild"];
if(life_protest_active) exitWith {hint "Du hast bereits ein Schild in der Hand."};
if(!(vehicle player == player)) exitWith {hint "Du kannst in Fahrzeugen nicht protestieren"};
life_protest_active = true;
_schild = "Land_Poster_04_F" createVehicle [0,0,0];
_schild attachTo [player, [0,0,0.7], "righthand"];
_schild setVectorUp [0,89,-1];
player playAction "Salute";
sleep 30;
deleteVehicle _schild;
life_protest_active = false;