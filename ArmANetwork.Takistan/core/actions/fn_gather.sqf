#include <macro.h>

/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_resourceZones","_zone","_exp","_level"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","mushrooms_1","khat_1","flowers_1","wool_1","meth_1"];
_legal = ["apple","peach","flowers","wool"];
_zone = "";
_exp = "";
_level = "";

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(EQUAL(_zone,"")) exitWith {life_action_gathering = false;};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = ["apple",3]; _exp = 30; _level = 0};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = ["peach",3]; _exp = 30; _level = 0};
	case (_zone in ["heroin_1"]): {_gather = ["heroin_unprocessed",1]; _exp = 150; _level = 0};
	case (_zone in ["cocaine_1"]): {_gather = ["cocaine_unprocessed",1]; _exp = 150; _level = 0};
	case (_zone in ["weed_1"]): {_gather = ["cannabis",1]; _exp = 100; _level = 0};
	case (_zone in ["mushrooms_1"]): {_gather = ["mushrooms",2]; _exp = 150; _level = 0};
	case (_zone in ["khat_1"]): {_gather = ["khat",2]; _exp = 150; _level = 0};
	case (_zone in ["flowers_1"]): {_gather = ["flowers",2]; _exp = 30; _level = 0};
	case (_zone in ["wool_1"]): {_gather = ["wool",2]; _exp = 30; _level = 0};
	case (_zone in ["meth_1"]): {_gather = ["meth_unprocessed",1]; _exp = 150; _level = 0};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [SEL(_gather,0),SEL(_gather,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_gathering = true;

_sleep = 3.5;
if(skill_civ_brawny && ((SEL(_gather,0)) in _legal)) then {_sleep = 1.5};

for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep _sleep;
};

if(([true,SEL(_gather,0),_diff] call life_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText,"VirtualItems",SEL(_gather,0),"displayName");
	titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
};

life_action_gathering = false;
_exp = round(random(_exp));
[true,_exp] spawn life_fnc_expConfig;
