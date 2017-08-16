#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater"];

if(life_action_inUse) exitWith {};

_curTarget = cursorObject;
life_action_inUse = true;

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if!(isNull objectParent player) exitWith {}; //He's in a vehicle, cancel!

//Jagdscript
if(playerside == civilian) then {
	_animalcheck = nearestObjects [player,["Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Rabbit_F"],3];
	{if (!alive _x) exitWith {[_x] spawn life_fnc_gutAnimal;}} forEach _animalcheck;

	if(life_action_inUse) exitWith {};
	if(life_interrupted) exitWith {life_interrupted = false};
};

//Hausmenü
if(_curTarget isKindOf "House_F" && (player distance _curTarget < 12)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

//Wiederbelebung
if(cursortarget isKindOf "Man" && (!alive cursortarget) && playerSide == independent && ("Medikit" in (items player))) exitWith {[cursortarget,0] call life_fnc_revivePlayer;};

//Interaktionsmenü sonst Aufhebscripts
if(isPlayer cursortarget && cursortarget isKindOf "Man" && player distance cursortarget < 3 && !dialog) then {

	switch(playerside) do {
		case west: {[cursortarget] call life_fnc_copInteractionMenu;};
		case independent: {[cursortarget] call life_fnc_ahwInteractionMenu;};
		case civilian: {if(cursortarget getVariable["restrained",false]) then {[cursortarget] call life_fnc_civInteractionMenu;}};
	};

} else {

private["_isVehicle","_miscItems","_money"];
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F"];
_money = "Land_Money_F";

	if(_isVehicle) then {
		if(!dialog && player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {[_curTarget] call life_fnc_vInteractionMenu};
	} else {
		if((typeOf _curTarget) in _miscItems) then {
			private["_handle"];
			_handle = [_curTarget] spawn life_fnc_pickupItem;
			waitUntil {sleep 0.1; scriptDone _handle};
		} else {
			if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
				private["_handle"];
				_curTarget setVariable["inUse",TRUE,TRUE];
				_handle = [_curTarget] spawn life_fnc_pickupMoney;
				waitUntil {sleep 0.1; scriptDone _handle};
			};
		};
	};
};