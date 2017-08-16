/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private["_obj"];

_obj = (nearestObjects[getPos player,["Turtle_F"],4]) select 0;

if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith { hint "That turtle is still alive! Kill it before taking it's meat (you sick, sick person)."};

if(([true,"turtle",1] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText["You have cut meat from the dead turtle.","PLAIN"];
	life_experience = life_experience + 6;
};