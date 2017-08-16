#include "..\..\script_macros.hpp"
/*
    File: fn_clothingMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and initializes the clothing store menu.
    Started clean, finished messy.
*/

params ["","","",["_shop","",[""]]];

if (_shop isEqualTo "") exitWith {};
if !(player isEqualTo vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

/* License check & config validation */
if !(isClass(missionConfigFile >> "Clothing" >> _shop)) exitWith {}; //Bad config entry.

private _shopSide = M_CONFIG(getText,"Clothing",_shop,"side");
private _conditions = M_CONFIG(getText,"Clothing",_shop,"conditions");

private _exit = false;

private "_flag";

if !(_shopSide isEqualTo "") then {
    _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};

if (_exit) exitWith {};

_exit = [_conditions] call life_fnc_levelCheck;
if !(_exit) exitWith {hint localize "STR_Shop_Veh_NoLicense";};
/* Open up the menu */
createDialog "Life_Clothing";
disableSerialization;

(findDisplay 3100) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {closeDialog 0; [] call life_fnc_playerSkins;}"]; //Fix Custom Skin after ESC


//Cop / Civ Pre Check
if (_shop in ["bruce","dive","reb","kart"] && {!(playerSide isEqualTo civilian)}) exitWith {hint localize "STR_Shop_NotaCiv"; closeDialog 0;};
if (_shop isEqualTo "reb" && {!license_civ_rebel}) exitWith {hint localize "STR_Shop_NotaReb"; closeDialog 0;};
if (_shop isEqualTo "cop" && {!(playerSide isEqualTo west)}) exitWith {hint localize "STR_Shop_NotaCop"; closeDialog 0;};
if (_shop isEqualTo "dive" && {!license_civ_dive}) exitWith {hint localize "STR_Shop_NotaDive"; closeDialog 0;};


private ["_pos","_oldPos","_oldDir","_oldBev","_testLogic","_nearVeh","_light"];
private ["_ut1","_ut2","_ut3","_ut4","_ut5"];

_pos = getPosATL player;
life_clothing_store = _shop;

/* Store license check */
if (isClass(missionConfigFile >> "Licenses" >> life_clothing_store)) then {
    _flag = M_CONFIG(getText,"Licenses",life_clothing_store,"side");
    _displayName = M_CONFIG(getText,"Licenses",life_clothing_store,"displayName");
    if !(LICENSE_VALUE(life_clothing_store,_flag)) exitWith {
        hint format [localize "STR_Shop_YouNeed",localize _displayName];
        closeDialog 0;
    };
};
//initialize camera view
life_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_shop_cam cameraEffect ["Internal", "Back"];
life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
life_shop_cam camSetPos (player modelToWorld [1,4,2]);
life_shop_cam camSetFOV .33;
life_shop_cam camSetFocus [50, 0];
life_shop_cam camCommit 0;
life_cMenu_lock = false;

if (isNull (findDisplay 3100)) exitWith {};

private _list = (findDisplay 3100) displayCtrl 3101;
private _filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";

_filter lbSetCurSel 0;

life_oldClothes = uniform player;
life_olduniformItems = uniformItems player;
life_oldBackpack = backpack player;
life_oldVest = vest player;
life_oldVestItems = vestItems player;
life_oldBackpackItems = backpackItems player;
life_oldGlasses = goggles player;
life_oldHat = headgear player;

[] call life_fnc_playerSkins;

waitUntil {isNull (findDisplay 3100)};
life_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_shop_cam;
life_clothing_filter = 0;
if (isNil "life_clothesPurchased") exitWith {
    life_clothing_purchase = [-1,-1,-1,-1,-1];
    if !(life_oldClothes isEqualTo "") then {player addUniform life_oldClothes;} else {removeUniform player};
    if !(life_oldHat isEqualTo "") then {player addHeadgear life_oldHat} else {removeHeadgear player;};
    if !(life_oldGlasses isEqualTo "") then {player addGoggles life_oldGlasses;} else {removeGoggles player};
    if !(backpack player isEqualTo "") then {
        if (life_oldBackpack isEqualTo "") then {
            removeBackpack player;
        } else {
            removeBackpack player;
            player addBackpack life_oldBackpack;
            clearAllItemsFromBackpack player;
            if (count life_oldBackpackItems > 0) then {
                {
                    [_x,true,true] call life_fnc_handleItem;
                    true
                } count life_oldBackpackItems;
            };
        };
    };

    if (count life_oldUniformItems > 0) then {
        {
            [_x,true,false,false,true] call life_fnc_handleItem;
            true
        } count life_oldUniformItems;
    };

    if (vest player != "") then {
        if (life_oldVest isEqualTo "") then {
            removeVest player;
        } else {
            player addVest life_oldVest;
            if (count life_oldVestItems > 0) then {
                {
                    [_x,true,false,false,true] call life_fnc_handleItem;
                    true
                } count life_oldVestItems;
            };
        };
    };
    [] call life_fnc_playerSkins;
};
life_clothesPurchased = nil;

//Check uniform purchase.
if ((life_clothing_purchase select 0) isEqualTo -1) then {
    if (life_oldClothes != uniform player) then {player addUniform life_oldClothes;};
};
//Check hat
if ((life_clothing_purchase select 1) isEqualTo -1) then {
    if (life_oldHat != headgear player) then {
        if (life_oldHat isEqualTo "") then {
            removeHeadGear player;
        } else {
            player addHeadGear life_oldHat;
        };
    };
};
//Check glasses
if ((life_clothing_purchase select 2) isEqualTo -1) then {
    if (life_oldGlasses != goggles player) then {
        if (life_oldGlasses isEqualTo "") then  {
            removeGoggles player;
        } else {
            player addGoggles life_oldGlasses;
        };
    };
};
//Check Vest
if ((life_clothing_purchase select 3) isEqualTo -1) then {
    if (life_oldVest != vest player) then {
        if (life_oldVest isEqualTo "") then {removeVest player;} else {
            player addVest life_oldVest;
            {
                [_x,true,false,false,true] call life_fnc_handleItem;
                true
            } count life_oldVestItems;
        };
    };
};

//Check Backpack
if ((life_clothing_purchase select 4) isEqualTo -1) then {
    if (life_oldBackpack != backpack player) then {
        if (life_oldBackpack isEqualTo "") then {removeBackpack player;} else {
            removeBackpack player;
            player addBackpack life_oldBackpack;
            {
                [_x,true,true] call life_fnc_handleItem;
                true
            } count life_oldBackpackItems;
        };
    };
};

life_clothing_purchase = [-1,-1,-1,-1,-1];
[] call life_fnc_saveGear;
