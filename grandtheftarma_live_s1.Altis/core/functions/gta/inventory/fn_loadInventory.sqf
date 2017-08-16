/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
	["_unit", objNull, [objNull]],
	["_inventory", [], [[]]]
];

//--- Error checks
if (count _inventory <= 0) exitwith {};

//--- Explode data
_inventory params ["_primaryWeapon", "_secondaryWeapon", "_handgunWeapon", "_uniform", "_vest", "_backpack", "_assignedItems", "_headgear", "_goggles", "_virtualItems"];

//--- Error checks
if (count _inventory == 0) exitwith {false};

//--- Remove gear
removeAllAssignedItems _unit;
removeAllWeapons _unit;
removeHeadgear _unit;
removeGoggles _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;

//--- Primary, secondary and hangun weapons
{
  if (count _x > 0) then {
    _x params ["_weapon", "_items", "_magazines"];

    //--- Add weapon
    _unit addWeapon _weapon;

    //--- Remove weapon items
    switch _forEachIndex do {
      case 0: {removeAllPrimaryWeaponItems _unit};
      case 1: {{_unit removeSecondaryWeaponItem _x} forEach secondaryWeaponItems _unit}; //--- ArmA has no removeAllSecondaryWeaponItems command
      case 2: {removeAllHandgunItems _unit};
    };

    //--- Add weapon items
    {
      _unit addWeaponItem [_weapon, _x];
    } forEach _items;

    //--- Add magazines
    {
      _unit addWeaponItem [_weapon, [_x select 0, _x select 1]];
    } forEach _magazines;
  };
} forEach [_primaryWeapon, _secondaryWeapon, _handgunWeapon];

//--- Uniform, vest and backpack
{
  if (count _x > 0) then {
    _x params ["_class", "_items", "_magazines"];

    //--- Add apparel
    switch _forEachIndex do {
      case 0: {_unit forceAddUniform _class};
      case 1: {_unit addVest _class};
      case 2: {_unit addBackpack _class};
    };

    //--- Determine container
    private _container = [uniformContainer player, vestContainer player, backpackContainer player] select _forEachIndex;

    //--- Add items
    {
      if (typeName _x == typeName []) then {
        _container addItemCargo [_x select 0, _x select 1];
      } else {
        _container addItemCargo [_x, 1];
      };
    } forEach _items;

    //--- Add magazines
    {
      if (typeName _x == typeName []) then {
        _container addMagazineAmmoCargo [_x select 0, 1, _x select 1];
      } else {
        _container addMagazineCargo [_x, 1];
      };
    } forEach _magazines;
  };
} forEach [_uniform, _vest, _backpack];

//--- Assigned items
{
	if (getNumber (configFile >> "CfgWeapons" >> _x >> "type") == 4096) then {
		_unit addWeapon _x;
	} else {
		_unit linkItem _x;
	};
} forEach _assignedItems;

//--- Add headgear
_unit addHeadgear _headgear;

//--- Add goggles
_unit addGoggles _goggles;

//--- Virtual items
if (!isNil "_virtualItems") then {
  //--- Add virtual items
  {
    [true, _x select 0, _x select 1] call life_fnc_handleInv;
  } foreach _virtualItems;
};

//--- Apply textures
[ [ player, uniform player, uniformContainer player ], "GTA_fnc_setUnitTextures" ] call GTA_fnc_remoteExec;

true
