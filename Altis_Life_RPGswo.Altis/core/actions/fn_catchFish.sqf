#include "..\..\macros.hpp"
/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Catches a fish that is near by.
*/
private["_fish","_type","_typeName","_schild"];
_fish = param [0,ObjNull,[ObjNull]];
if(player distance _fish > 3.5) exitWith {};
_schild = false;
switch(true) do
{
	case ((typeOf _fish) isEqualTo "Salema_F"): {_typeName =  "Salemafilet"; _type = "salema";};
	case ((typeOf _fish) isEqualTo "Ornate_random_F"): {_typeName =  "Ornatefilet"; _type = "ornate";};
	case ((typeOf _fish) isEqualTo "Mackerel_F"): {_typeName =  "Makrelenfilet"; _type = "mackerel";};
	case ((typeOf _fish) isEqualTo "Tuna_F"): {_typeName =  "Thunfisch Steak"; _type = "tuna";};
	case ((typeOf _fish) isEqualTo "Mullet_F"): {_typeName =  "Meeräschenfilet"; _type = "mullet";};
	case ((typeOf _fish) isEqualTo "CatShark_F"): {_typeName =  "Katzenhaifilet"; _type = "catshark";};
	case ((typeOf _fish) isEqualTo "Turtle_F"): {_typeName =  "Schildkrötenfleisch"; _type = "turtle"; _schild = true;};
	default {_type = ""};
};

if(_type isEqualTo "") exitWith {}; //Couldn't get a type

if (_schild) then
{
	if(player distance (getMarkerPos "Turtle_Area_1") < 350 OR player distance (getMarkerPos "Turtle_Area_2") < 350 OR player distance (getMarkerPos "Turtle_Area_3") < 350) then
	{
		if(([true,_type,1] call DWEV_fnc_handlelnv)) then
		{
			deleteVehicle _fish;
			titleText["Du hast etwas Schildkrötenfleisch gesammelt.","PLAIN"];
			player say3D "bag";
		};
	} else
	{
	deleteVehicle _fish;
	hint "Schildkröten kannst du nur im Naturschutzgebiet Fangen!";
	};	
}
else
{
	if(([true,_type,1] call DWEV_fnc_handlelnv)) then
	{
		deleteVehicle _fish;
		titleText[format["Du hast ein %1 gefangen.",_typeName],"PLAIN"];
		player say3D "bag";
	};
};