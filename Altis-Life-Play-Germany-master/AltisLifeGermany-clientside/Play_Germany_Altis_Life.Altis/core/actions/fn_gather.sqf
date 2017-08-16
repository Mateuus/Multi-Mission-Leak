#include <macro.h>
/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
if(isNil "life_action_gathering_counter") then {life_action_gathering_counter = 0;};
private["_gather","_itemWeight","_diff","_itemName","_resourceZones","_zone"];

_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","resarea_drugs_heroin","resarea_drugs_cocaine","resarea_drugs_cannabis","resarea_oilfield","resarea_oilrig","uranium_mine","resarea_frogs",
"resarea_hopfen","resarea_getreide","resarea_zuckerrohr"];

_zone = "";

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_action_gathering_counter > 0) exitWith {};
life_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 40) exitWith {_zone = _x;};
} foreach _resourceZones;

if(EQUAL(_zone,"")) exitWith {life_action_gathering = false;};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = ["apple",3];};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = ["peach",3];};
	case (_zone in ["resarea_drugs_heroin"]): {_gather = ["heroin_unprocessed",1];};
	case (_zone in ["resarea_drugs_cocaine"]): {_gather = ["cocaine_unprocessed",1];};
	case (_zone in ["resarea_drugs_cannabis"]): {_gather = ["cannabis",1];};
	case (_zone in ["resarea_oilfield","resarea_oilrig"]): {_gather = ["oil_unprocessed",1];};
	case (_zone in ["uranium_mine"]): {_gather = ["uranium_ore",1];};
	case (_zone in ["resarea_frogs"]): {_gather = ["frogs",1 + floor random 3];};
	case (_zone in ["resarea_hopfen"]): {_gather = ["hopfen",2];};
	case (_zone in ["resarea_getreide"]): {_gather = ["getreide",3];};
	case (_zone in ["resarea_zuckerrohr"]): {_gather = ["zuckerrohr",1 + floor random 2];};
	default {""};
};

//gather check??
if(vehicle player != player) exitWith {};
sleep random 1;
life_action_gathering_counter = life_action_gathering_counter + 1;

_diff = [SEL(_gather,0),SEL(_gather,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"; life_action_gathering_counter = 0; life_action_gathering = false;};
life_action_gathering = true;

for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uiSleep 2.5;
};
sleep (random 1);
if(life_action_gathering_counter > 1) exitWith {};

if(playerSide == civilian) then {
	if(dialog) exitWith {};
	if(([true,SEL(_gather,0),_diff] call life_fnc_handleInv)) then {
		_itemName = M_CONFIG(getText,"VirtualItems",SEL(_gather,0),"displayName");
		titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
	};
};
life_action_gathering_counter = 0;
life_action_gathering = false;
