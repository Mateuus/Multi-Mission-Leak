#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_fish","_money","_miscItems","_handle"];
if(dialog) exitWith {};
if(vehicle player != player) exitWith {};
if(life_action_inUse) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false;};
_curTarget = cursorTarget;
_fish = ((nearestObjects[getPos player,["Fish_Base_F"],3]) select 0);
_turtle = ((nearestObjects[getPos player,["Turtle_F"],3]) select 0);
_money = ((nearestObjects[getPos player,["Land_Money_F"],2]) select 0);
_spikestrip = ((nearestObjects[getPos player,["Land_Razorwire_F"],2]) select 0);
_miscItems = ((nearestObjects[getPos player,["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"],2]) select 0);

// Checkt ob ein Spieler im Wasser ist und ein Fisch in der nähe schwimmt
if((surfaceIsWater (getPosASL player)) && !isNil "_fish") exitWith
{
	[_fish] call life_fnc_catchFish;
};
if((surfaceIsWater (getPosASL player)) && !isNil "_turtle") exitWith
{
	[_turtle] call life_fnc_catchTurtle;
};

// Liegt Geld vor dir?
if(!isNil "_money") exitWith {
	_money setVariable["inUse",TRUE,TRUE];
	[_money] spawn life_fnc_pickupMoney;
};

// Ist vor dir ein Item, dass du aufheben möchtest?
if(!isNil "_miscItems") exitWith {
	[_miscItems] spawn life_fnc_pickupItem;
};

// Ist vor dir ein Spikestrip, dass du aufheben möchtest?
if(!isNil "_spikestrip" && playerSide == west) exitWith {
	[_spikestrip] spawn life_fnc_packupSpikes;
};

//Checkt ob etwas im Cursor Target ist
if(isNull _curTarget) exitWith {};

// Ist vor dir die Bank?!
if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

// Ist vor dir ein toter Mensch? Und bist du Cop oder Sani
if(_curTarget isKindOf "Man" && {!alive _curTarget}) exitWith {
	if(((playerSide == west && {(call life_revive_cops)}) || playerSide == independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call life_fnc_revivePlayer;
	};
}; 
//Ist vor dir ein gefesselter oder gezippter Mensch)
if(isPlayer _curTarget && _curTarget isKindOf "Man") exitWith {
	if(((_curTarget getVariable["Re-strained",false]) || (_curTarget getVariable["zipped",false])) && !dialog && playerSide == west) then {
		[_curTarget] call life_fnc_copInteractionMenu;
	};
	if((_curTarget getVariable["Re-strained",false]) && !dialog && playerSide == civilian && cursorTarget distance player < 2.5) then {
		[_curTarget] call life_fnc_civInteractionMenu;
			}; 
				if((_curTarget getVariable["Re-strained",false]) && !dialog && playerSide == independent && cursorTarget distance player < 2.5) then {
		[_curTarget] call life_fnc_arsInteractionMenu;
			}; 
	};
// Steht vor dir ein Fahrzeug?
if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) exitWith {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
				[_curTarget] call life_fnc_vInteractionMenu;
			};
	};
// Ist vor dir ein Tier?
if((typeOf _curTarget) in ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"]) exitWith {
	if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then {
				[_curTarget] spawn life_fnc_catchTurtle;
			} else {
				[_curTarget] spawn life_fnc_catchFish;
			};
};