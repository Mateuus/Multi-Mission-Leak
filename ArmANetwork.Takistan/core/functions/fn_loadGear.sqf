#include <macro.h>

/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private["_itemArray","_uniform","_vest","_backpack","_goggles","_headgear","_items","_prim","_seco","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_bMags","_vMags","_handle"];
_itemArray = life_gear;

[] call life_fnc_stripDownPlayer;

if(EQUAL(count _itemArray,0)) exitWith {
    switch(playerSide) do {
        case west: {
            [] call life_fnc_copLoadout;
        };

        case civilian: {
            [] call life_fnc_civLoadout;
        };

        case independent: {
            [] call life_fnc_medicLoadout;
        };
    };
};

_itemArray params
[
    ["_uniform","",[""]],
    ["_vest","",[""]],
    ["_backpack","",[""]],
    ["_goggles","",[""]],
    ["_headgear","",[""]],
    ["_items",[],[[]]],
    ["_prim","",[""]],
    ["_seco","",[""]],
    ["_uItems",[],[[]]],
    ["_uMags",[],[[]]],
    ["_bItems",[],[[]]],
    ["_bMags",[],[[]]],
    ["_vItems",[],[[]]],
    ["_vMags",[],[[]]],
    ["_pItems",[],[[]]],
    ["_hItems",[],[[]]],
    ["_yItems",[],[[]]]
];

if(!(EQUAL(_goggles,""))) then {[_goggles,true,false,false,false] call life_fnc_handleItem;};
if(!(EQUAL(_headgear,""))) then {[_headgear,true,false,false,false] call life_fnc_handleItem;};
if(!(EQUAL(_uniform,""))) then {[_uniform,true,false,false,false] call life_fnc_handleItem;};
if(!(EQUAL(_vest,""))) then {[_vest,true,false,false,false] call life_fnc_handleItem;};
if(!(EQUAL(_backpack,""))) then {[_backpack,true,false,false,false] call life_fnc_handleItem;};

/* Hotfix for losing virtual items on login */
if(!isNil {SEL(_this,0)}) then {
	ADD(life_maxWeight,(round(FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(backpack player),"maximumload") / 4)));
};

{[_x,true,false,false,false] call life_fnc_handleItem;} forEach _items;

{player addItemToUniform _x;} forEach (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} forEach (_uMags);
{player addItemToVest _x;} forEach (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} forEach (_vMags);
{player addItemToBackpack _x;} forEach (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} forEach (_bMags);
life_maxWeight = 100;

{
    [true,SEL(_x,0),SEL(_x,1)] call life_fnc_handleInv;
} forEach (_yItems);

life_maxWeight = 24;
//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if(!(EQUAL(_prim,""))) then {[_prim,true,false,false,false] call life_fnc_handleItem;};
if(!(EQUAL(_seco,""))) then {[_seco,true,false,false,false] call life_fnc_handleItem;};

{
    if (!(EQUAL(_x,""))) then {
        player addPrimaryWeaponItem _x;
    };
} forEach (_pItems);
{
    if (!(EQUAL(_x,""))) then {
        player addHandgunItem _x;
    };
} forEach (_hItems);
