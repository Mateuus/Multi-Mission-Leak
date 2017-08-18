#include <macro.h>
/*
    File: fn_busTravel.sqf
    Author: Blaster + Author: [midgetgrimm] edit adi

    Description:
    Travel by bus!
*/
private["_vendor","_dest", "_destPos", "_busCost"];

//check client
if(!alive player) exitWith {hint"You dead homie.. dafuq";};
if(vehicle player != player) exitWith {hint "Please store your vehicle, there will be a garage on the other side";};

_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //get NCP (vendor) name
_dest = [_this,3,"",[""]] call BIS_fnc_param; //get dest. name
_destPos = [0,0,0]; //default position for error return
_busCost = 100; //default price for bus teleport

//Error check
if(isNull _vendor OR EQUAL(_dest,"") OR (player distance _vendor > 10)) exitWith { hint "Please select other dest."; };

switch (_vendor) do 
	{
	case almyraBus : //NPC bus name
	{
		switch (_dest) do {
			case "kavala" : { _busCost = 4060; _destPos = getMarkerPos "MarkerBus_kavala"; };
			default {[];};
		};
	};
	default {[];};
};
if(EQUAL(count _destPos,0)) exitWith { hint "Dest. position not set"; };
if(CASH < _busCost) exitWith { hint format ["You dont have cash for this Bus transfer, price: %1", _busCost]; };

disableUserInput true;
titleText ["You fell asleep on the bus","BLACK",3];
sleep 3;
SUB(CASH,_busCost);
player setPos [SEL(_destPos,0), SEL(_destPos,1), SEL(_destPos,2)];
titleText ["You have woken up at your destination","BLACK IN",3];
hint "Thank you for using Public Bus Transport!";
disableUserInput false;