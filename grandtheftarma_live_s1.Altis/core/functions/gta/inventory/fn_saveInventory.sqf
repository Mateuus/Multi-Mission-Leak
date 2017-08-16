/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
	["_unit", objNull, [objNull]],
  ["_saveVirtualItems", false, [true]]
];

private _inventory = [];
private _fnc_weaponMagazines = {
  params ["_weapon"];
  private _magazines = [];

  //--- Loop through
  {
    _x params ["_magazine", "_ammo", "", "", "_location"];

    if (_location == _weapon) then {
      _magazines pushBack [_magazine, _ammo];
    };
  } forEach magazinesAmmoFull _unit;

  _magazines
};

private _fnc_containerMagazines = {
  params ["_container"];
  private _magazines = [];

  {
    _x params ["_magazine", "_ammo"];
    private _maxAmmo = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");

    if (_maxAmmo > 1 && {_ammo < _maxAmmo}) then {
      _magazines pushBack [_magazine, _ammo];
    } else {
      _magazines pushBack _magazine;
    };
  } forEach magazinesAmmo _container;

  _magazines
};

//--- Weapons
{
  _inventory pushBack (if (_x == "") then {
    //--- Empty
    []
  } else {
    //--- Weapon, items and magazines
    [_x, _unit weaponAccessories _x, [_x] call _fnc_weaponMagazines]
  });
} forEach [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit];

//--- Uniform, Vest and Backpack
{
  _x params ["_class", "_container"];

  _inventory pushBack (if (isNull _container) then {
    //--- Empty
    []
  } else {
    private _containerItems = itemCargo _container;
    private _items = [];
    private _magazines = [_container] call _fnc_containerMagazines;
    private _blacklist = [];

    //--- Loop through container weapons and attachments
    {
      //--- Add to container items for processing
      _containerItems = _containerItems + _x;
    } forEach weaponsItemsCargo _container;

    //--- Trim empty elements from container items
    _containerItems = _containerItems - [[]];
    _containerItems = _containerItems - [""];

    //--- Loop through the container's inventory
    {
      //--- Handle weapon items array
      if (typeName _x == typeName []) then {
        //--- Magazine from weapon accessories
        _magazines pushBack _x;
      } else {
        //--- Item
        if (_x != "" && {!(_x in _blacklist)}) then {
          private _item = _x;
          private _count = {typeName _x == typeName "" && {_x == _item}} count _containerItems;

          //--- Push
          if (_count > 1) then {
            _items pushBack [_x, _count];
          } else {
            _items pushBack _x;
          };

          //--- Blacklist item
          _blacklist pushBack _x;
        };
      };
    } forEach _containerItems;

    //--- Weapon, items and magazines
    [_class, _items, _magazines]
  });
} forEach [[uniform _unit, uniformContainer _unit], [vest _unit, vestContainer _unit], [backpack _unit, backpackContainer _unit]];

//--- Assigned items, headgear and goggles
_inventory pushBack assignedItems _unit;
_inventory pushBack headgear _unit;
_inventory pushBack goggles _unit;

//--- Virtual items
if (_saveVirtualItems) then {
  private _virtualItems = [];

  {
    private _count = missionNamespace getVariable [_x, 0];

    if (_count > 0) then {
      _x = [_x, 1] call life_fnc_varHandle;
      _virtualItems pushBack [_x, _count];
    };
  } forEach [
    "life_inv_apple",
    "life_inv_axe",
    "life_inv_beerp",
    "life_inv_blastingcharge",
    "life_inv_boltcutter",
    "life_inv_bottledbeer",
    "life_inv_bottledshine",
    "life_inv_bottledwhiskey",
    "life_inv_bottles",
    "life_inv_bubblegum",
    "life_inv_cannabis",
    "life_inv_catshark",
    "life_inv_cement",
    "life_inv_cmeth_p",
    "life_inv_cmeth_u_1",
    "life_inv_cmeth_u_2",
    "life_inv_cmeth_u_3",
    "life_inv_cocaine_p",
    "life_inv_cocaine_u",
    "life_inv_coffee",
    "life_inv_copper_p",
    "life_inv_copper_u",
    "life_inv_cornmeal",
    "life_inv_defusekit",
    "life_inv_diamond_p",
    "life_inv_diamond_u",
    "life_inv_donuts",
    "life_inv_drill",
    "life_inv_fuelE",
    "life_inv_fuelF",
    "life_inv_glass",
    "life_inv_goldbar",
    "life_inv_goldbarp",
    "life_inv_greggs_cheesebacon",
    "life_inv_greggs_pasty",
    "life_inv_greggs_sausagebean",
    "life_inv_greggs_sausageroll",
    "life_inv_greggs_steakbake",
    "life_inv_heroin_p",
    "life_inv_heroin_u",
    "life_inv_hops",
    "life_inv_iron_p",
    "life_inv_iron_u",
    "life_inv_kebab",
    "life_inv_kfc_bucket",
    "life_inv_kfc_pepsi",
    "life_inv_kfc_popcorn",
    "life_inv_kfc_wings",
    "life_inv_kitkat",
    "life_inv_lockpick",
    "life_inv_mackerel",
    "life_inv_marijuana",
    "life_inv_mash",
    "life_inv_moonshine",
    "life_inv_mullet",
    "life_inv_naturalgas",
    "life_inv_oil_p",
    "life_inv_oil_u",
    "life_inv_ornate",
    "life_inv_peach",
    "life_inv_propane",
    "life_inv_pickaxe",
    "life_inv_rabbit",
    "life_inv_ration_big",
    "life_inv_ration_small",
    "life_inv_redgull",
    "life_inv_rice_p",
    "life_inv_rice_u",
    "life_inv_rock",
    "life_inv_rye",
    "life_inv_salad",
    "life_inv_salema",
    "life_inv_salt_p",
    "life_inv_salt_u",
    "life_inv_sand",
    "life_inv_silver_p",
    "life_inv_silver_u",
    "life_inv_snapgun",
    "life_inv_spikeStrip",
    "life_inv_storagebig",
    "life_inv_storagesmall",
    "life_inv_sugar_p",
    "life_inv_sugar_u",
    "life_inv_tbacon",
    "life_inv_tea",
    "life_inv_tobacco",
    "life_inv_tuna",
    "life_inv_turtle",
    "life_inv_turtlesoup",
    "life_inv_underwatercharge",
    "life_inv_water",
    "life_inv_watermelon",
    "life_inv_whiskey",
    "life_inv_wood_p",
    "life_inv_wood_u",
    "life_inv_yeast",
    "life_inv_zipties"
  ];

  //--- Push items to return
  _inventory pushBack _virtualItems;
};

_inventory
