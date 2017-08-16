#include "..\..\script_macros.hpp"
/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_resourceZones","_zone","_log"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","tabac_1","phosphore_rouge_1","ephedrine_1","dechet_1"];
_zone = "";

if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_inUse = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(EQUAL(_zone,"")) exitWith {life_action_inUse = false;};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = ["apple",7];};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = ["peach",7];};
	case (_zone in ["heroin_1"]): {_gather = ["heroin_unprocessed",1];};
	case (_zone in ["cocaine_1"]): {_gather = ["cocaine_unprocessed",1];};
	case (_zone in ["weed_1"]): {_gather = ["cannabis",1];};
	case (_zone in ["tabac_1"]): {_gather = ["tabacf",2];};
	case (_zone in ["ephedrine_1"]): {_gather = ["ephedrine",4];};
	case (_zone in ["dechet_1"]): {_gather = ["dechet",4];};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [SEL(_gather,0),SEL(_gather,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;

for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	player say3D "gather";
	sleep 2.5;
};

if(([true,SEL(_gather,0),_diff] call life_fnc_handleInv)) then {
	/*_itemName = M_CONFIG(getText,"VirtualItems",SEL(_gather,0),"displayName");
	titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];*/
	_arr = [];
	_arr pushBack [SEL(_gather,0),_diff];
	[_arr] spawn life_fnc_receivedItemsUI;
};

life_action_inUse = false;
