#include "..\script_macros.hpp"
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater"];
_curTarget = cursorTarget;
if(ES_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(ES_interrupted) exitWith {ES_interrupted = false;};
if(ES_action_gathering) exitWith {};
_isWater = surfaceIsWater (visiblePositionASL player);

//Check if the player is near an ATM.
if((call ES_fnc_nearATM) && {!dialog}) exitWith {
	[] call ES_fnc_atmMenu;
};

if(isNull _curTarget) exitWith {
	if(_isWater) then {
		private "_fish";
		_fish = (nearestObjects[visiblePosition player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call ES_fnc_catchFish;
		};
	} else {
		_animal = [position player, ["Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F"], 3.5] call ES_fnc_nearestObjects;
		if (count _animal > 0) then {
			_animals = _animal select 0;
			if (!alive _animals) then {
				[_animals] call ES_fnc_gutAnimal;
			};
		} else {
			if(playerSide == civilian && !ES_action_gathering) then {
				_handle = [] spawn ES_fnc_gather;
				waitUntil {scriptDone _handle};
				ES_action_gathering = false;
			};
		};
	};
};

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call ES_fnc_houseMenu;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
ES_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	ES_action_inUse = false;
};

if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide == independent}) exitWith {
	//Hotfix code by ins0
	if((playerSide == independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call ES_fnc_FeuerwehrInteractionMenu;
	};
};

//Check if it's a dead body.
//if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide in [west,independent]}) exitWith {
	//Hotfix code by ins0
	//if(((playerSide == blufor && {(EQUAL(ES_SETTINGS(getNumber,"revive_cops"),1))}) || playerSide == independent) && {"Medikit" in (items player)}) then {
		//[_curTarget] spawn ES_fnc_revivePlayer;
	//};
//};


//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if((_curTarget getVariable ["restrained",false]) && !dialog && playerSide == west) then {
		[_curTarget] call ES_fnc_copInteractionMenu;
	};
	if((_curTarget getVariable ["restrained",false]) && !dialog && playerSide in [civilian,east]) then {
		[_curTarget] call ES_fnc_civInteractionMenu;
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	
	_isVehicle = if((_curTarget isKindOf "landVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air") || (_curTarget isKindOf "Pod_Heli_Transport_04_base_F") || (_curTarget isKindOf "Slingload_base_F")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";
	
	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < SEL(SEL(boundingBox _curTarget,1),0)+2) then {
				[_curTarget] call ES_fnc_vInteractionMenu;
			};
		};
	} else {
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if(EQUAL((typeOf _curTarget),"Turtle_F") && !alive _curTarget) then {
				private "_handle";
				_handle = [_curTarget] spawn ES_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				private "_handle";
				_handle = [_curTarget] spawn ES_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then {
				[_curTarget,player,false] remoteExec ["ES_fnc_pickupAction",2];
			} else {
				//It wasn't a misc item so is it money?
				if(EQUAL((typeOf _curTarget),_money) && {!(_curTarget getVariable ["inUse",false])}) then {
					[_curTarget,player,true] remoteExec ["ES_fnc_pickupAction",2];
				};
			};
		};
	};
};