/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private["_itemArray","_uniform","_vest","_backpack","_goggles","_headgear","_items","_prim","_seco","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_bMags","_vMags","_handle"];
_itemArray = lhm_gear;

waitUntil {!(isNull (findDisplay 46))};

[] call lhm_fnc_stripDownPlayer;

if(_itemArray isEqualTo []) exitWith
{

    switch(playerSide) do
    {
        case west: {
            [] call lhm_fnc_copLoadout;
        };

        case civilian: {
            [] call lhm_fnc_civLoadout;
        };

        case independent: {
            [] call lhm_fnc_medicLoadout;
        };

        case east: {
            [] call lhm_fnc_secLoadout;
        };

    };
    diag_log "::lhm Client:: No Gear found - Standard-Loadout loaded";
};

_uniform = _itemArray param [0,"",[""]];
_vest = _itemArray param [1,"",[""]];
_backpack =  _itemArray param [2,"",[""]];
_goggles = _itemArray param [3,"",[""]];
_headgear = _itemArray param [4,"",[""]];
_items = _itemArray param [5,[],[[]]];
_prim = _itemArray param [6,"",[""]];
_seco = _itemArray param [7,"",[""]];
_uItems = _itemArray param [8,[],[[]]];
_uMags = _itemArray param [9,[],[[]]];
_bItems = _itemArray param [10,[],[[]]];
_bMags = _itemArray param [11,[],[[]]];
_vItems = _itemArray param [12,[],[[]]];
_vMags = _itemArray param [13,[],[[]]];
_pItems = _itemArray param [14,[],[[]]];
_hItems = _itemArray param [15,[],[[]]];
_yItems = _itemArray param [16,[],[[]]];

if(_goggles != "") then {_handle = [_goggles,true,false,false,false] spawn lhm_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_headgear != "") then {_handle = [_headgear,true,false,false,false] spawn lhm_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn lhm_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_vest != "") then {_handle = [_vest,true,false,false,false] spawn lhm_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn lhm_fnc_handleItem; waitUntil {scriptDone _handle};};
{_handle = [_x,true,false,false,false] spawn lhm_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;

{player addItemToUniform _x;} foreach (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} foreach (_uMags);
{player addItemToVest _x;} foreach (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} foreach (_vMags);
{player addItemToBackpack _x;} foreach (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} foreach (_bMags);
lhm_maxWeight = 100;

{
    _item = [_x,1] call lhm_fnc_varHandle;
    [true,_item,1] call lhm_fnc_handleInv;
} foreach (_yItems);

lhm_maxWeight = 24;

//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if(_prim != "") then {_handle = [_prim,true,false,false,false] spawn lhm_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_seco != "") then {_handle = [_seco,true,false,false,false] spawn lhm_fnc_handleItem; waitUntil {scriptDone _handle};};

{
    if (_x != "") then {
        player addPrimaryWeaponItem _x;
    };
} foreach (_pItems);
{
    if (_x != "") then {
        player addHandgunItem _x;
    };
} foreach (_hItems);