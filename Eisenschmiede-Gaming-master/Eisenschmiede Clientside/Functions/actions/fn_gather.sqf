#include "..\script_macros.hpp"
/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if (player getVariable "surrender") exitWith {};
if(isNil "ES_action_gathering") then {ES_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","pilze_1","meth_1","speed_1","illmed_1","schwarz_1","kohle_1","wein_1","holz_1","eisen_1","uran_1","rye_1","hops_1","yeast_1","banana_1","suger_1","kakao_1","oliven_1","muscheln_1","korallen_1","kokos_1","kokos_2","kakao_1","kakao_2"];
_zone = "";

if(ES_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
ES_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(EQUAL(_zone,"")) exitWith {ES_action_inUse = false;};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = ["apple",3];};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = ["peach",3];};
	case (_zone in ["heroin_1"]): {_gather = ["heroin_unprocessed",1];};
	case (_zone in ["cocaine_1"]): {_gather = ["cocaine_unprocessed",1];};
	case (_zone in ["weed_1"]): {_gather = ["cannabis",1];};
	
	case (_zone in ["pilze_1"]): {_gather = ["pilze_unrefined",1];};
	case (_zone in ["meth_1"]): {_gather = ["meth_unrefined",2];};
	case (_zone in ["speed_1"]): {_gather = ["speed_unrefined",3];};	
	case (_zone in ["illmed_1"]): {_gather = ["illmed_unrefined",2];};
	case (_zone in ["schwarz_1"]): {_gather = ["schwarz_unrefined",3];};
	case (_zone in ["wein_1"]): {_gather = ["wein_unrefined",2];};
	case (_zone in ["holz_1"]): {_gather = ["holz_unrefined",2];};	
	case (_zone in ["eisen_1"]): {_gather = ["eisen_unrefined",2];};
	case (_zone in ["uran_1"]): {_gather = ["uran_unrefined",2];};
	
	case (_zone in ["rye_1"]): {_gather = ["rye",2];};
	case (_zone in ["yeast_1"]): {_gather = ["yeast",2];};
	case (_zone in ["hops_1"]): {_gather = ["hops",2];}; 
	
	case (_zone in ["banana_1"]): {_gather = ["bananen",2];};
	case (_zone in ["suger_1"]): {_gather = ["zuckeru",2];};
	case (_zone in ["kokos_1","kokos_2"]): {_gather = ["kokosu",2];};
	case (_zone in ["kakao_1","kakao_2"]): {_gather = ["kakaou",2];}; 
	
	case (_zone in ["oliven_1"]): {_gather = ["olivenu",2];};
	case (_zone in ["muscheln_1"]): {_gather = ["muscheln",2];};
	case (_zone in ["korallen_1"]): {_gather = ["korallen",2];}; 
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [SEL(_gather,0),SEL(_gather,1),ES_carryWeight,ES_maxWeight] call ES_fnc_calWeightDiff;
if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"};
ES_action_inUse = true;

for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,SEL(_gather,0),_diff] call ES_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText,"VirtualItems",SEL(_gather,0),"displayName");
	titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
	["Rohstoffesammeln"] call ES_fnc_xp_add;
};

ES_action_inUse = false;