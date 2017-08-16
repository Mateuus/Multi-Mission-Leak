#include "..\..\macros.hpp"
/*
    File: fn_clothingMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and initializes the clothing store menu.
    Started clean, finished messy.
*/

params ["","","",["_shop","",[""]]];

if (_shop isEqualTo "") exitWith {};
if !(isNull objectParent player) exitWith {titleText["Du kannst das nicht tun während du in einem Fahrzeug sitzt!","PLAIN"];};

/* License check & config validation */
if !(isClass(missionConfigFile >> "Clothing" >> _shop)) exitWith {}; //Bad config entry.

private _shopTitle = M_CONFIG(getText,"Clothing",_shop,"title");
private _shopSide = M_CONFIG(getText,"Clothing",_shop,"side");
private _conditions = M_CONFIG(getText,"Clothing",_shop,"conditions");

private _exit = false;

private "_flag";

if !(_shopSide isEqualTo "") then {
    _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; case east: {"WSC"}; case civilian: {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};

if (_exit) exitWith {};

_exit = [_conditions] call DWEV_fnc_levelCheck;
if !(_exit) exitWith {hint "Du besitzt die benötigte Lizenz oder den Rang";};

//Save old inventory
DWEV_oldClothes = uniform player;
DWEV_olduniformItems = uniformItems player;
DWEV_oldBackpack = backpack player;
DWEV_oldVest = vest player;
DWEV_oldVestItems = vestItems player;
DWEV_oldBackpackItems = backpackItems player;
DWEV_oldGlasses = goggles player;
DWEV_oldHat = headgear player;

/* Open up the menu */
createDialog "DWEV_Clothing";
disableSerialization;

ctrlSetText [3103,_shopTitle];

(findDisplay 3100) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {closeDialog 0;}"]; //Fix Custom Skin after ESC

sliderSetRange [3107, 0, 360];

//Cop / Civ Pre Check
if (_shop in ["bruce","dive","reb","kart"] && {!(playerSide isEqualTo civilian)}) exitWith {hint "Du bist kein Zivilist!"; closeDialog 0;};
if (_shop == "reb" && {!lc_rebel}) exitWith {hint "Du hast keine Rebellenausbildung!"; closeDialog 0;};
if (_shop == "cop" && {!(playerSide isEqualTo west)}) exitWith {hint "Bewerbe dich jetzt als Polizist!"; closeDialog 0;};
if (_shop == "med" && {!(playerSide isEqualTo independent)}) exitWith {hint "Bewerbe dich jetzt als Feuerwehrmann!"; closeDialog 0;};
if (_shop == "dive" && {!lc_dive}) exitWith {hint "Du brauchst eine Taucherlizenz für diesen Shop!"; closeDialog 0;};

private ["_pos","_oldPos","_oldDir","_oldBev","_testLogic","_nearVeh","_light"];
private ["_ut1","_ut2","_ut3","_ut4","_ut5"];

if (DWEV_SETTINGS(getNumber,"clothing_noTP") isEqualTo 1) then {
    _pos = getPosATL player;
} else {
    if (DWEV_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        _pos = [1000,1000,10000];
    } else {
        _pos = switch _shop do {
            case "reb": {[13590,12214.6,0.00141621]};
            case "cop": {[12817.5,16722.9,0.00151062]};
            case "kart": {[14120.5,16440.3,0.00139236]};
            default {[17088.2,11313.6,0.00136757]};
        };
    };

    _oldDir = getDir player;
    _oldPos = visiblePositionASL player;
    _oldBev = behaviour player;

    _testLogic = "Logic" createVehicleLocal _pos;
    _testLogic setPosATL _pos;

    _nearVeh = _testLogic nearEntities ["AllVehicles", 20];

    if (DWEV_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        _ut1 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,5,10]);
        _ut1 attachTo [_testLogic,[0,5,5]];
        _ut1 setDir 0;
        _ut2 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [5,0,10]);
        _ut2 attachTo [_testLogic,[5,0,5]];
        _ut2 setDir (getDir _testLogic) + 90;
        _ut3 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [-5,0,10]);
        _ut3 attachTo [_testLogic,[-5,0,5]];
        _ut3 setDir (getDir _testLogic) - 90;
        _ut4 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,-5,10]);
        _ut4 attachTo [_testLogic,[0,-5,5]];
        _ut4 setDir 180;
        _ut5 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,0,10]);
        _ut5 attachTo [_testLogic,[0,0,0]];
        _ut5 setObjectTexture [0,"a3\map_data\gdt_concrete_co.paa"];
        detach _ut5;
        _ut5 setVectorDirAndUp [[0,0,-.33],[0,.33,0]];
    };

    _light = "#lightpoint" createVehicleLocal _pos;
    _light setLightBrightness 0.5;
    _light setLightColor [1,1,1];
    _light setLightAmbient [1,1,1];
    _light lightAttachObject [_testLogic, [0,0,0]];

    {
        if (_x != player) then {_x hideObject true;};
        true
    } count playableUnits;
    
    if (DWEV_SETTINGS(getNumber,"clothing_box") isEqualTo 0) then {
        {
            if (_x != player && _x != _light) then {_x hideObject true;};
            true
        } count _nearVeh;
    };

    if (DWEV_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        {
            _x setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,1)"];
            true
        } count [_ut1,_ut2,_ut3,_ut4];
    };

    player setBehaviour "SAFE";
    if (_shop == "dive") then {
        player setPosATL [-1000, -1000, 10];
        sleep 0.0005;
    };
    player attachTo [_testLogic,[0,0,0]];
    player switchMove "";
    player setDir 360;
};

DWEV_clothing_store = _shop;

/* Store license check */

if (isClass(missionConfigFile >> "Licenses" >> DWEV_clothing_store)) then
{
    _flag = M_CONFIG(getText,"Licenses",DWEV_clothing_store,"var");
    _displayName = M_CONFIG(getText,"Licenses",DWEV_clothing_store,"displayName");
	if !(LICENSE_VALUE(DWEV_clothing_store,_flag)) exitWith
	{
        hint format ["Du benötigst eine %1, um dieses Geschäft nutzen zu können!",_displayName];
        closeDialog 0;
    };
};
//initialize camera view
DWEV_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
DWEV_shop_cam cameraEffect ["Internal", "Back"];
DWEV_shop_cam camSetTarget (player modelToWorld [0,0,1]);
DWEV_shop_cam camSetPos (player modelToWorld [1,4,2]);
DWEV_shop_cam camSetFOV .33;
DWEV_shop_cam camSetFocus [50, 0];
DWEV_shop_cam camCommit 0;
DWEV_cMenu_lock = false;

if (isNull (findDisplay 3100)) exitWith {};

private _list = (findDisplay 3100) displayCtrl 3101;
private _filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_filter lbAdd "Kleidung";
_filter lbAdd "Kopfbedeckung";
_filter lbAdd "Brillen";
_filter lbAdd "Westen";
_filter lbAdd "Rucksäcke";

_filter lbSetCurSel 0;

[] spawn
{
	sleep 2;
	[player, uniform player] call DWEV_fnc_equipTextures;
	[player, backpack player] call DWEV_fnc_equipTextures;
};

waitUntil {isNull (findDisplay 3100)};
if (DWEV_SETTINGS(getNumber,"clothing_noTP") isEqualTo 0) then {
    {
        if (_x != player) then {_x hideObject false;};
        true
    } count playableUnits;
    if (DWEV_SETTINGS(getNumber,"clothing_box") isEqualTo 0) then {
        {
            if (_x != player && _x != _light) then {_x hideObject false;};
            true
        } count _nearVeh;
    };
    detach player;
    player setBehaviour _oldBev;
    player setPosASL _oldPos;
    player setDir _oldDir;
    if (DWEV_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        {
            deleteVehicle _x;
        } count [_testLogic,_ut1,_ut2,_ut3,_ut4,_ut5,_light];
    } else {
        {
            deleteVehicle _x;
            true
        } count [_testLogic,_light];
    };
};
DWEV_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy DWEV_shop_cam;
DWEV_clothing_filter = 0;
if (isNil "DWEV_clothesPurchased") exitWith {
    DWEV_clothing_purchase = [-1,-1,-1,-1,-1];
    if !(DWEV_oldClothes isEqualTo "") then {player addUniform DWEV_oldClothes;} else {removeUniform player};
    if !(DWEV_oldHat isEqualTo "") then {player addHeadgear DWEV_oldHat} else {removeHeadgear player;};
    if !(DWEV_oldGlasses isEqualTo "") then {player addGoggles DWEV_oldGlasses;} else {removeGoggles player};
    if !(backpack player isEqualTo "") then {
        if (DWEV_oldBackpack isEqualTo "") then {
            removeBackpack player;
        } else {
            removeBackpack player;
            player addBackpack DWEV_oldBackpack;
            clearAllItemsFromBackpack player;
            if (count DWEV_oldBackpackItems > 0) then {
                {
                    [_x,true,true] call DWEV_fnc_handleItem;
                    true
                } count DWEV_oldBackpackItems;
            };
        };
    };

    if (count DWEV_oldUniformItems > 0) then {
        {
            [_x,true,false,false,true] call DWEV_fnc_handleItem;
            true
        } count DWEV_oldUniformItems;
    };

    if (vest player != "") then {
        if (DWEV_oldVest isEqualTo "") then {
            removeVest player;
        } else {
            player addVest DWEV_oldVest;
            if (count DWEV_oldVestItems > 0) then {
                {
                    [_x,true,false,false,true] call DWEV_fnc_handleItem;
                    true
                } count DWEV_oldVestItems;
            };
        };
    };
    [] spawn
	{
	sleep 2;
	[player, uniform player] call DWEV_fnc_equipTextures;
	[player, backpack player] call DWEV_fnc_equipTextures;
	};
};
DWEV_clothesPurchased = nil;

//Check uniform purchase.
if ((DWEV_clothing_purchase select 0) isEqualTo -1) then {
    if (DWEV_oldClothes != uniform player) then {player addUniform DWEV_oldClothes;};
};
//Check hat
if ((DWEV_clothing_purchase select 1) isEqualTo -1) then {
    if (DWEV_oldHat != headgear player) then {
        if (DWEV_oldHat isEqualTo "") then {
            removeHeadGear player;
        } else {
            player addHeadGear DWEV_oldHat;
        };
    };
};
//Check glasses
if ((DWEV_clothing_purchase select 2) isEqualTo -1) then {
    if (DWEV_oldGlasses != goggles player) then {
        if (DWEV_oldGlasses isEqualTo "") then  {
            removeGoggles player;
        } else {
            player addGoggles DWEV_oldGlasses;
        };
    };
};
//Check Vest
if ((DWEV_clothing_purchase select 3) isEqualTo -1) then {
    if (DWEV_oldVest != vest player) then {
        if (DWEV_oldVest isEqualTo "") then {removeVest player;} else {
            player addVest DWEV_oldVest;
            {
                [_x,true,false,false,true] call DWEV_fnc_handleItem;
                true
            } count DWEV_oldVestItems;
        };
    };
};

//Check Backpack
if ((DWEV_clothing_purchase select 4) isEqualTo -1) then {
    if (DWEV_oldBackpack != backpack player) then {
        if (DWEV_oldBackpack isEqualTo "") then {removeBackpack player;} else {
            removeBackpack player;
            player addBackpack DWEV_oldBackpack;
            {
                [_x,true,true] call DWEV_fnc_handleItem;
                true
            } count DWEV_oldBackpackItems;
        };
    };
};

DWEV_clothing_purchase = [-1,-1,-1,-1,-1];
[] call DWEV_fnc_saveGear;