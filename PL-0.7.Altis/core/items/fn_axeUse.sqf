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
	case (player distance (getMarkerPos "foret_mine") < 30): {_mine = ["bois",2];};
	default {""};
};

//Mine check
if(EQUAL(_mine,"")) exitWith {life_actionRestrict = false;hint localize "STR_ISTR_Axe_NotNear"};
if(vehicle player != player) exitWith {life_actionRestrict = false;hint localize "STR_ISTR_Axe_MineVeh";};

_diff = [SEL(_mine,0),SEL(_mine,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(EQUAL(_diff,0)) exitWith {life_actionRestrict = false;hint localize "STR_NOTF_InvFull"};

life_action_inUse = true;
for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	player say3D "hache";
	sleep 2.5;
};

if(([true,SEL(_mine,0),_diff] call life_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName");
	titleText[format[localize "STR_ISTR_Axe_Success",(localize _itemName),_diff],"PLAIN"];
};

life_action_inUse = false;
life_actionRestrict = false;