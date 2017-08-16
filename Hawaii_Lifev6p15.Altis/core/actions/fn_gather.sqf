#include "..\..\script_macros.hpp"
/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for gathering.
*/
private["_gather","_itemWeight","_diff","_itemName","_resourceZones","_zone","_illegalItems"];
_illegalItems = ["palmenb","ucocain","umeth","hanf","uheroin","ulsd","coral"];
_resourceZones = ["peaches_1","peaches_2","peaches_3","peaches_4","ananas_1","ananas_2","ananas_3","ananas_4","banane_1","banane_2","banane_3","banane_4","algen_1","kokos_1","baumwolle_1","reis_1","nusse_1","kaffee_1","zuckerr_1","bambus_1","palmenb_1","cocain_1","meth_1","hanf_1","heroin_1","tabak_1","coral_1"];
_zone = "";

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(EQUAL(_zone,"")) exitWith {life_action_gather = false;};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = ["peach",4];};
	case (_zone in ["ananas_1","ananas_2","ananas_3","ananas_4"]): {_gather = ["ananas",4];};
	case (_zone in ["banane_1","banane_2","banane_3","banane_4"]): {_gather = ["banane",4];};
	case (_zone in ["algen_1"]): {_gather = ["algenr",3];};
	case (_zone in ["kokos_1"]): {_gather = ["kokos",3];};
	case (_zone in ["baumwolle_1"]): {_gather = ["uwolle",2];};
	case (_zone in ["reis_1"]): {_gather = ["ureis",3];};
	case (_zone in ["nusse_1"]): {_gather = ["unusse",3];};
	case (_zone in ["kaffee_1"]): {_gather = ["ukaffee",3];};
	case (_zone in ["zuckerr_1"]): {_gather = ["zuckerr",4];};
	case (_zone in ["bambus_1"]): {_gather = ["bambusr",4];};
	case (_zone in ["palmenb_1"]): {_gather = ["palmenb",2];};
	case (_zone in ["cocain_1"]): {_gather = ["ucocain",2];};
	case (_zone in ["meth_1"]): {_gather = ["umeth",2];};
	case (_zone in ["hanf_1"]): {_gather = ["hanf",2];};
	case (_zone in ["heroin_1"]): {_gather = ["uheroin",2];};
	case (_zone in ["tabak_1"]): {_gather = ["tabakr",4];};
	case (_zone in ["lsdf_1"]): {_gather = ["ulsd",2];};
	case (_zone in ["coral_1"]): {_gather = ["coral",2];};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [SEL(_gather,0),SEL(_gather,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_gather = true;

for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,SEL(_gather,0),_diff] call life_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText,"VirtualItems",SEL(_gather,0),"displayName");
	titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];

	if(_gather in _illegalItems) then {
		[5] call life_fnc_updateEXP;
	} else {
		[3] call life_fnc_updateEXP;
	};
};

life_action_gather = false;
life_action_gathering = false;
