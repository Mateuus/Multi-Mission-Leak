#include "..\..\script_macros.hpp"
/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item","_restrictedClothing","_restrictedWeapons"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?
_restrictedClothing = LIFE_SETTINGS(getArray,"restricted_uniforms");
_restrictedWeapons = LIFE_SETTINGS(getArray,"restricted_weapons");

switch(playerSide) do
{
	case civilian: {
		if(EQUAL(LIFE_SETTINGS(getNumber,"restrict_clothingPickup"),1)) then {
			if(_item in _restrictedClothing) then {
				[_item,false,false,false,false] call life_fnc_handleItem;
			};
		};
		if(EQUAL(LIFE_SETTINGS(getNumber,"restrict_weaponPickup"),1)) then {
			if(_item in _restrictedWeapons) then {
				[_item,false,false,false,false] call life_fnc_handleItem;
			};
		};
	};
};