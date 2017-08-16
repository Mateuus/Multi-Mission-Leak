/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Catches a fish if it is the players cursorTarget
*/

private["_tempNum","_fish","_name","_type"];
_fish = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(!(_fish isKindOf "Fish_Base_F")) exitWith {};
if(player distance _fish > 3.5) exitWith {};
_type = (typeOf _fish);
switch(_type) do
{
	case "Salema_F": {_name = "salema"};
	case "Ornate_random_F" : {_name = "ornate"};
	case "Mackerel_F" : {_name = "mackerel"};
	case "Tuna_F" : {_name = "tuna"};
	case "Mullet_F" : {_name = "mullet"};
	case "CatShark_F" : {_name = "catshark"};
	case "Turtle_F" : {_name = "turtle"};
	default {_name = ""};
};

if(_name == "") exitWith {};

if(([_name,1] call DS_fnc_itemWeight) > (DS_maxWeight - DS_currentWeight))exitwith{hint "You do not have enough space to catch this fish"};
[_name,true,1] call DS_fnc_handleInventory;
deleteVehicle _fish;
titleText[format["You have caught a %1",_name],"PLAIN"];
[2,true] spawn DS_fnc_moralAlter;

if((DS_infoArray select 13) == 9)then {
	_tempNum = (DS_infoArray select 14) + 1;
	if(_tempNum > 19)then {
		[0] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [14,_tempNum];
	};
};

if((DS_infoArray select 13) == 43)then {
	_tempNum = (DS_infoArray select 14) + 1;
	if(_tempNum > 199)then {
		[0] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [14,_tempNum];
	};
};