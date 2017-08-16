#include <macro.h>
/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a fish that is near by.'
*/
private["_fish","_type","_name"];
_fish = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_fish isKindOf "Fish_Base_F")) exitWith {}; //Not a fishy!
if(player distance _fish > 3.5) exitWith {};
switch(true) do {
	case ((typeOf _fish) == "Salema_F"): {_type = "salema_raw"; _name = localize "STR_ANIM_Salema";};
	case ((typeOf _fish) == "Ornate_random_F") : {_type = "ornate_raw"; _name = localize "STR_ANIM_Ornate";};
	case ((typeOf _fish) == "Mackerel_F") : {_type = "mackerel_raw"; _name = localize "STR_ANIM_Mackerel";};
	case ((typeOf _fish) == "Tuna_F") : {_type = "tuna_raw"; _name = localize "STR_ANIM_Tuna";};
	case ((typeOf _fish) == "Mullet_F") : {_type = "mullet_raw"; _name = localize "STR_ANIM_Mullet";};
	case ((typeOf _fish) == "CatShark_F") : {_type = "catshark_raw"; _name = localize "STR_ANIM_Catshark";};
	default {_type = ""};
};

if(EQUAL(_type,"")) exitWith {}; //Couldn't get a type

if(([true,_type,1] call life_fnc_handleInv)) then {
	deleteVehicle _fish;
	titleText[format[(localize "STR_NOTF_Fishing"),_name],"PLAIN"];
};