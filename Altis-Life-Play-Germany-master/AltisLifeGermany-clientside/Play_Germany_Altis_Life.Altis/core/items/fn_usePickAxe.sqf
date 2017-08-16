#include <macro.h>
/*
    File: fn_pickaxeUse.sqf
    Author: Bryan "Tonic" Boardwine
        Mod: blaster

    Description:
    Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_markerName","_distanceToMarker","_trashRandom","_random","_currentItem","_currentChance","_psum","_lootFactor","_item","_diff","_item","_itemName"];
if(PG_mining) exitWith {};
PG_mining = true;

_mine = "";

for "_i" from 0 to ((count PGSERV_res_loot) - 1) do
{
    _markerName = SEL(PGSERV_res_loot, _i) select 0;

    _distanceToMarker = ((getMarkerPos _markerName) distance (vehicle player));

    if (_distanceToMarker < 40) exitWith
    {
        _mine = SEL(PGSERV_res_loot, _i) select 2; // select pickaxe loot array at position 2
    };
};


//Mine check
if(EQUAL(_mine,"")) exitWith {hint localize "STR_MS_NotNear"; PG_mining = false;};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh"; PG_mining = false;};

_trashRandom = floor(random 101);
if (_trashRandom <= 9) then {
    // chance by 9% that we will collect some trash
    _mine = PGSERV_res_loot_trash;
};

/*****************************************************************
 * Select random item
 * ***************************************************************/
_random = floor(random (100));
_item = "";
_psum = 0;

{
    _currentItem = SEL(_x, 0);
    _currentChance = SEL(_x, 1);

    _psum = _psum + _currentChance;
    if (_psum >= _random) exitWith { _item = _currentItem; };
} foreach _mine;
/*****************************************************************/

if(EQUAL(_item,"")) exitWith {hint "Gathering Bug: _item not set"; PG_mining = false;};

// TODO: exp system
_lootFactor = (round(random 2)+1); //number to give favor 2

_diff = [_item,_lootFactor,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"; PG_mining = false;};

life_action_inUse = true;
life_interrupted = false;

player say3D "pickaxe";

for "_i" from 0 to 2 do {
    player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
    uiSleep 2.5;
    if (life_interrupted) exitWith {};
};

if (!life_interrupted) then {
    if(([true,_item,_diff] call life_fnc_handleInv)) then {
        _itemName = M_CONFIG(getText,"VirtualItems",_item,"displayName");
        titleText[format[localize "STR_ISTR_Pick_Success",(localize _itemName),_diff],"PLAIN"];
    };
};

life_action_inUse = false;
life_thirst = life_thirst - 2;

if (life_thirst < 30) then   {
	if (life_thirst < 20) then   {
		if (life_thirst < 10) then   {
			hint localize "STR_NOTF_DrinkMSG_1";
		} else {
			hint localize "STR_NOTF_DrinkMSG_2";
		};
	} else {
		hint localize "STR_NOTF_DrinkMSG_3";
	};
};

[] call life_fnc_hudUpdate;

PG_mining = false;
if (life_interrupted) then {
    life_interrupted = false;
} else {
    // repeat gathering when action was not interrupted
    [] spawn life_fnc_usePickAxe;
};
