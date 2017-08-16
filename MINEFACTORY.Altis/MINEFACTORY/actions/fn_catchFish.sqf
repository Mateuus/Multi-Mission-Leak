#include "..\..\script_macros.hpp"
/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a fish that is near by.
*/
private["_fish","_type","_typeName"];
_fish = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _fish) exitWith {}; //Object passed is null?
if(player distance _fish > 3.5) exitWith {};

switch(true) do {
	case ((typeOf _fish) == "Salema_F"): {_typeName =  "Salema"; _type = "salema_raw";};
	case ((typeOf _fish) == "Ornate_random_F") : {_typeName =  "Ornate"; _type = "ornate_raw";};
	case ((typeOf _fish) == "Mackerel_F") : {_typeName =  "Makrele"; _type = "mackerel_raw";};
	case ((typeOf _fish) == "Tuna_F") : {_typeName =  "Thunfisch"; _type = "tuna_raw";};
	case ((typeOf _fish) == "Mullet_F") : {_typeName =  "Barbe"; _type = "mullet_raw";};
	case ((typeOf _fish) == "CatShark_F") : {_typeName =  "Katzenhai"; _type = "catshark_raw";};
	case ((typeOf _fish) == "Turtle_F") : {_typeName =  "Schildkrote"; _type = "turtle_raw";};
	default {_type = ""};
};

if(EQUAL(_type,"")) exitWith {}; //Couldn't get a type

if(([true,_type,1] call life_fnc_handleInv)) then {
	deleteVehicle _fish;
	titleText[format[( "Du hast einen %1 gefangen"),_typeName],"PLAIN"];
};
