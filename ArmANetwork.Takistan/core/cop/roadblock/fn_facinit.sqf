#include <macro.h>
/*
 Author: Fuzz
 Description: Choix de des factions soit medic ou policier.
*/
if(playerSide == civilian OR independent) exitWith {hint "You must be Police to make roadblocks"};

[] spawn life_fnc_placeablesMenu;
