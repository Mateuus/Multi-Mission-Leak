#include "..\..\script_macros.hpp"
/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for pickaxe in mining.
*/
if( life_actionRestrict ) exitWith { hint "Vous allez trop vite !"; };
life_actionRestrict = true;
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_log"];
_mine = "";

switch (true) do {
	case (player distance (getMarkerPos "copper_mine") < 30): {_mine = ["copper_unrefined",2];};
	case (player distance (getMarkerPos "iron_mine") < 30): {_mine = ["iron_unrefined",2];};
	case (player distance (getMarkerPos "salt_mine") < 120) : {_mine = ["salt_unrefined",4];};
	case (player distance (getMarkerPos "sand_mine") < 75) : {_mine = ["sand",5];};
	case (player distance (getMarkerPos "diamond_mine") < 50): {_mine = ["diamond_uncut",1];};
	case (player distance (getMarkerPos "rock_quarry") < 50): {_mine = ["rock",2];};
	case (player distance (getMarkerPos "oil_field_1") < 50): {_mine = ["oil_unprocessed",1];};
	case (player distance (getMarkerPos "phosphore_rouge_1") < 50): {_mine = ["phosphorerouge",1];};
	default {""};
};

//Mine check
if(EQUAL(_mine,"")) exitWith {life_actionRestrict = false;hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {life_actionRestrict = false;hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [SEL(_mine,0),SEL(_mine,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(EQUAL(_diff,0)) exitWith {life_actionRestrict = false;hint localize "STR_NOTF_InvFull"};

life_action_inUse = true;
for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	player say3D "pioche";
	sleep 2.5;
};

if(([true,SEL(_mine,0),_diff] call life_fnc_handleInv)) then {
	/*_itemName = M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName");
	titleText[format[localize "STR_ISTR_Pick_Success",(localize _itemName),_diff],"PLAIN"];*/
	_arr = [];
	_arr pushBack [SEL(_mine,0),_diff];
	[_arr] spawn life_fnc_receivedItemsUI;
};

life_action_inUse = false;
life_actionRestrict = false;
