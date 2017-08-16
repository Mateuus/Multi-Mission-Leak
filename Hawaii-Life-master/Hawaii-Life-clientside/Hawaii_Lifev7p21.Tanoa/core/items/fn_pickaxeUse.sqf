#include "..\..\script_macros.hpp"
/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
if(animationState player in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"]) exitWith {};

private["_mine","_diff","_itemName","_illegalItems","_pause"];
_illegalItems = ["magmas","uuran"];
_mine = "";


switch (true) do {
	case (player distance (getMarkerPos "magmas_1") < 60): {_mine = ["magmas",2];};
	case (player distance (getMarkerPos "uran_1") < 60): {_mine = ["uuran",2];};
	case (player distance (getMarkerPos "copper_1") < 60): {_mine = ["copperr",2];};
	case (player distance (getMarkerPos "iron_1") < 60): {_mine = ["iron",2];};
	case (player distance (getMarkerPos "coal_1") < 60): {_mine = ["coal",2];};
	default {""};
};
//Mine check
if(EQUAL(_mine,"")) exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [SEL(_mine,0),SEL(_mine,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"};
if(life_action_pickaxeUse) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_pickaxeUse = true;

_pause = 2.52 - (0.02*life_EXPLevel);

for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep _pause;
};

if(([true,SEL(_mine,0),_diff] call life_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName");
	titleText[format[localize "STR_ISTR_Pick_Success",(localize _itemName),_diff],"PLAIN"];

	if(_mine in _illegalItems) then {
		[7] call life_fnc_updateEXP;
	} else {
		[5] call life_fnc_updateEXP;
	};
};


life_action_pickaxeUse = false;