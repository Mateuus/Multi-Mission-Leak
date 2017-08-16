#include "..\..\script_macros.hpp"


private["_vehicle"];
closeDialog 0;
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {hint "Veuillez regarder votre véhicule!"};
if(!(_vehicle isKindOF "LandVehicle")) exitWith {hint "Véhicule invalide! Voitures uniquement"};
if(player distance _vehicle > 7.5) exitWith {hint "Veuillez vous approcher de votre véhicule!"};

if(!([false,"pbleu",1] call life_fnc_handleInv)) exitWith {};
_vehicle setObjectTextureGlobal [0,"#(rgb,8,8,3)color(0,0,0.2,1)"];
hint "Véhicule peint avec succès !";