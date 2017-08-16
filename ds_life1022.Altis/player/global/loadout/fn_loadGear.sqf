private ["_itemArray","_handle"];

if(isNil "DS_gear")then{DS_gear = []};

_itemArray = DS_gear;
waitUntil {!(isNull (findDisplay 46))};

_handle = [] spawn DS_fnc_removeGear;
waitUntil {scriptDone _handle};

if((playerSide isEqualTo civilian)&&(_itemArray isEqualTo []))exitWith {
    if(!((headGear player) isEqualTo ""))then{removeHeadgear player;};
    if(!((goggles player) isEqualTo ""))then{removeGoggles player;};

	_uniforms = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_tricolour","U_C_Poor_1"];
	_randUniform = (selectRandom _uniforms);
	player addUniform _randUniform;
    
    player linkItem "ItemMap";
    player linkItem "ItemCompass";
};

if((playerSide isEqualTo west)&&(_itemArray isEqualTo []))exitWith {
    [] spawn DS_cop_copDefault;
};

_itemArray params [
    "_uniform",
    "_vest",
    "_backpack",
    "_goggles",
    "_headgear",
    ["_assignedItems",[]],
    "_primary",
    "_handgun",
    "_secondary",
    ["_uniformItems",[]],
    ["_uniformMags",[]],
    ["_vestItems",[]],
    ["_vestMags",[]],
    ["_backpackItems",[]],
    ["_backpackMags",[]],
    ["_primaryItems",[]],
    ["_handgunItems",[]],
    ["_secondaryItems",[]],
    ["_yInventoryItems",[]]
];

//Add the player's clothing
if(!(_goggles isEqualTo ""))then{_handle = [_goggles] spawn DS_fnc_equipItem;waitUntil {scriptDone _handle};};
if(!(_headgear isEqualTo ""))then{_handle = [_headgear] spawn DS_fnc_equipItem;waitUntil {scriptDone _handle};};
if(!(_uniform isEqualTo ""))then{_handle = [_uniform] spawn DS_fnc_equipItem;waitUntil {scriptDone _handle};};
if(!(_vest isEqualTo ""))then{_handle = [_vest] spawn DS_fnc_equipItem;waitUntil {scriptDone _handle};};
if(!(_backpack isEqualTo ""))then{_handle = [_backpack] spawn DS_fnc_equipItem;waitUntil {scriptDone _handle};};

//Add the player's assigned items
{_handle = [_x] spawn DS_fnc_equipItem;waitUntil {scriptDone _handle};} forEach _assignedItems;

//Add the player's uniform items & mags
{player addItemToUniform _x;} forEach _uniformItems;
{(uniformContainer player) addItemCargoGlobal [_x,1];} forEach _uniformMags;

//Add the player's vest items & mags
{player addItemToVest _x;} forEach _vestItems;
{(vestContainer player) addItemCargoGlobal [_x,1];} forEach _vestMags;

//Add the player's backpack items & mags
{player addItemToBackpack _x;} forEach _backpackItems;
{(backpackContainer player) addItemCargoGlobal [_x,1];} forEach _backpackMags;

//Update the player's carry weight
if(!((backpack player) isEqualTo ""))then {
	_cfg = getNumber (configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
	_load = round (_cfg / 8);
	DS_maxWeight = (24 + _load);
	if(!(playerSide isEqualTo civilian))then{(backpackContainer player) setObjectTextureGlobal [0,""];};
};

//Add the player's Y inventory items
{
    [(_x select 0),true,(_x select 1),true] call DS_fnc_handleInventory;
} forEach (_yInventoryItems);

//Add the player's weapons
if(!(_primary isEqualTo ""))then{_handle = [_primary] spawn DS_fnc_equipItem;waitUntil {scriptDone _handle};};
if(!(_handgun isEqualTo ""))then{_handle = [_handgun] spawn DS_fnc_equipItem;waitUntil {scriptDone _handle};};
if(!(_secondary isEqualTo ""))then{_handle = [_secondary] spawn DS_fnc_equipItem;waitUntil {scriptDone _handle};};

//Add the player's primary weapon attachments
{
    if(!(_x isEqualTo ""))then {
        player addPrimaryWeaponItem _x;
    };
} forEach _primaryItems;

//Add the player's handgun attachments
{
    if(!(_x isEqualTo ""))then {
        player addHandgunItem _x;
    };
} forEach _handgunItems;

//Add the player's secondary weapon attachments
{
    if(!(_x isEqualTo ""))then {
        player addSecondaryWeaponItem _x;
    };
} forEach _secondaryItems;

//Update the player's textures
[] call DS_fnc_copUniform;