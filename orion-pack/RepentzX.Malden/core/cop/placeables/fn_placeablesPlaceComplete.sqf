/*
	Author: Maximum
	Description: Placeables for the cop\medic sides.
*/
disableSerialization;
if (!life_barrier_active) exitWith {};
if (life_barrier_activeObj == ObjNull) exitWith {};

_currentPos = getPosATL life_barrier_activeObj;
detach life_barrier_activeObj;
life_barrier_activeObj setPos[(getPos life_barrier_activeObj select 0), (getPos life_barrier_activeObj select 1), 0];
life_barrier_activeObj enableSimulationGlobal true;
life_barrier_activeObj setVariable ["placeable" ,true, true];
//life_barrier_activeObj addAction ["Remove Police Placeable",life_fnc_removePlaceable,"",0,false,false,"",'!isNull cursorTarget && (playerSide == west) && !(animationState cursorTarget == "Incapacitated") && !(player getVariable["restrained",false])'];
life_bar_placey pushBack life_barrier_activeObj;
// ToDo: Add cleanup script.
life_barrier_active = false;
life_barrier_activeObj = ObjNull;
