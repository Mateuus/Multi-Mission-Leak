#include "..\..\script_macros.hpp"
/*
Author: Repentz
Gives admins the ability to spawn as a random animal!
*/

private["_animalType","_findType"];

_animalType = [
	"Alsatian_Black_F"
];

_findType = _animalType select floor random count _animalType;

if (FETCH_CONST(life_adminlevel) isEqualTo 0) exitwith {["You cannot use this feature if you're not an admin, sorry.",false,"slow"] call life_fnc_notificationSystem;};

if!(isNull objectParent player) exitWith {["You can not use the animal in a vehicle!",false,"slow"] call life_fnc_notificationSystem;};

if(isNull life_animal) then {
	life_animal = group player createUnit [_findType, Position player, [], 0, "FORM"];
	life_animal switchCamera "External"; 
	player remoteControl life_animal;
	life_animal allowDamage false;
	titleText ["You used the animal.","PLAIN"];

} else {
	
	titleText ["You put the animal away","PLAIN"];
	deletevehicle life_animal;
	life_animal = ObjNull;
};
