/*
    File: fn_civFetchGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire

    Description:
    Saves the players gear for syncing to the database for persistence.
*/
private["_ret","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_ret = [];

_ret set[count _ret,uniform player];
_ret set[count _ret,vest player];
_ret set[count _ret,backpack player];
_ret set[count _ret,goggles player];
_ret set[count _ret,headgear player];
_ret set[count _ret,assignedItems player];
_ret set[count _ret,primaryWeapon player];
_ret set[count _ret,handGunWeapon player];

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if (count (primaryWeaponMagazine player) > 0 ) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if (_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if (_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if (_uni AND !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if (_bag AND !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if (count (handgunMagazine player) > 0 ) then
{
    _hMag = ((handgunMagazine player) select 0);
    if (_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if (_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if (_uni AND !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if (_bag AND !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

{
  _name = (_x select 0);
  _val = (_x select 1);
  if (_val > 0) then {
    for "_i" from 1 to _val do {
      _yItems = _yItems + [_name];
    };
  };
} forEach [
  ["life_inv_oil_u",life_inv_oil_u],
  ["life_inv_oil_p",life_inv_oil_p],
  ["life_inv_heroin_u",life_inv_heroin_u],
  ["life_inv_heroin_p",life_inv_heroin_p],
  ["life_inv_cannabis",life_inv_cannabis],
  ["life_inv_marijuana",life_inv_marijuana],
  ["life_inv_apple",life_inv_apple],
  ["life_inv_rabbit",life_inv_rabbit],
  ["life_inv_salema",life_inv_salema],
  ["life_inv_ornate",life_inv_ornate],
  ["life_inv_mackerel",life_inv_mackerel],
  ["life_inv_tuna",life_inv_tuna],
  ["life_inv_mullet",life_inv_mullet],
  ["life_inv_catshark",life_inv_catshark],
  ["life_inv_turtle",life_inv_turtle],
  ["life_inv_water",life_inv_water],
  ["life_inv_donuts",life_inv_donuts],
  ["life_inv_turtlesoup",life_inv_turtlesoup],
  ["life_inv_coffee",life_inv_coffee],
  ["life_inv_fuelF",life_inv_fuelF],
  ["life_inv_fuelE",life_inv_fuelE],
  ["life_inv_pickaxe",life_inv_pickaxe],
  ["life_inv_copper_u",life_inv_copper_u],
  ["life_inv_iron_u",life_inv_iron_u],
  ["life_inv_iron_p",life_inv_iron_p],
  ["life_inv_sugar_u",life_inv_sugar_u],
  ["life_inv_sugar_p",life_inv_sugar_p],
  ["life_inv_rice_u",life_inv_rice_u],
  ["life_inv_rice_p",life_inv_rice_p],
  ["life_inv_copper_p",life_inv_copper_p],
  ["life_inv_sand",life_inv_sand],
  ["life_inv_salt_u",life_inv_salt_u],
  ["life_inv_salt_p",life_inv_salt_p],
  ["life_inv_glass",life_inv_glass],
  ["life_inv_tbacon",life_inv_tbacon],
  ["life_inv_lockpick",life_inv_lockpick],
  ["life_inv_redgull",life_inv_redgull],
  ["life_inv_peach",life_inv_peach],
  ["life_inv_diamond_u",life_inv_diamond_u],
  ["life_inv_cocaine_u",life_inv_cocaine_u],
  ["life_inv_cocaine_p",life_inv_cocaine_p],
  ["life_inv_diamond_p",life_inv_diamond_p],
  ["life_inv_spikeStrip",life_inv_spikeStrip],
  ["life_inv_rock",life_inv_rock],
  ["life_inv_cement",life_inv_cement],
  ["life_inv_goldbar",life_inv_goldbar],
  ["life_inv_blastingcharge",life_inv_blastingcharge],
  ["life_inv_boltcutter",life_inv_boltcutter],
  ["life_inv_defusekit",life_inv_defusekit],
  ["life_inv_storagesmall",life_inv_storagesmall],
  ["life_inv_storagebig",life_inv_storagebig],
  ["life_inv_cornmeal",life_inv_cornmeal],
  ["life_inv_beerp",life_inv_beerp],
  ["life_inv_whiskey",life_inv_whiskey],
  ["life_inv_rye",life_inv_rye],
  ["life_inv_hops",life_inv_hops],
  ["life_inv_yeast",life_inv_yeast],
  ["life_inv_bottles",life_inv_bottles],
  ["life_inv_bottledshine",life_inv_bottledshine],
  ["life_inv_bottledbeer",life_inv_bottledbeer],
  ["life_inv_bottledwhiskey",life_inv_bottledwhiskey],
  ["life_inv_moonshine",life_inv_moonshine],
  ["life_inv_mash",life_inv_mash],
  ["life_inv_zipties",life_inv_zipties],
  ["life_inv_present",life_inv_present],
  ["life_inv_ration_small",life_inv_ration_small],
  ["life_inv_ration_big",life_inv_ration_big],
  ["life_inv_salad",life_inv_salad],
  ["life_inv_bubblegum",life_inv_bubblegum],
  ["life_inv_tobacco",life_inv_tobacco],
  ["life_inv_watermelon",life_inv_watermelon],
  ["life_inv_silver_u",life_inv_silver_u],
  ["life_inv_silver_p",life_inv_silver_p],
  ["life_inv_cmeth_u_1",life_inv_cmeth_u_1],
  ["life_inv_cmeth_u_2",life_inv_cmeth_u_2],
  ["life_inv_cmeth_u_3",life_inv_cmeth_u_3],
  ["life_inv_cmeth_p",life_inv_cmeth_p],
  ["life_inv_underwatercharge",life_inv_underwatercharge],
  ["life_inv_drill",life_inv_drill],
  ["life_inv_snapgun",life_inv_snapgun],
  ["life_inv_axe",life_inv_axe],
  ["life_inv_wood_u",life_inv_wood_u],
  ["life_inv_wood_p",life_inv_wood_p]
];

_ret set[count _ret,_uItems];
_ret set[count _ret,_uMags];
_ret set[count _ret,_bItems];
_ret set[count _ret,_bMags];
_ret set[count _ret,_vItems];
_ret set[count _ret,_vMags];
_ret set[count _ret,_pItems];
_ret set[count _ret,_hItems];
_ret set[count _ret,_yItems];

civ_gear = _ret;
