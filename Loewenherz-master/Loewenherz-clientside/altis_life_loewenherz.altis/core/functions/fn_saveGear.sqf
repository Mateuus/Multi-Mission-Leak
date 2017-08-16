/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka

    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_return = [];

_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;

_return pushBack primaryWeapon player;
_return pushBack handgunWeapon player;
/*
if(playerSide == west || playerSide == east || playerSide == civilian && {(call lhm_save_civ)}) then {
    _return pushBack primaryWeapon player;
    _return pushBack handgunWeapon player;
} else {
    _return pushBack [];
    _return pushBack [];
};
*/
_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

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

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if(_bag && !_handled) then
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
    ["lhm_inv_cornmeal",lhm_inv_cornmeal],
	["lhm_inv_beerp",lhm_inv_beerp],
	["lhm_inv_whiskey",lhm_inv_whiskey],
	["lhm_inv_rye",lhm_inv_rye],
	["lhm_inv_hops",lhm_inv_hops],
	["lhm_inv_yeast",lhm_inv_yeast],
	["lhm_inv_bottles",lhm_inv_bottles],
	["lhm_inv_bottledshine",lhm_inv_bottledshine],
	["lhm_inv_bottledbeer",lhm_inv_bottledbeer],
	["lhm_inv_bottledwhiskey",lhm_inv_bottledwhiskey],
	["lhm_inv_moonshine",lhm_inv_moonshine],
	["lhm_inv_mash",lhm_inv_mash],
	["lhm_inv_tracker",lhm_inv_tracker],
	["lhm_inv_tracker2",lhm_inv_tracker2],
	["lhm_inv_lzigarette",lhm_inv_lzigarette],
	["lhm_inv_krauser",lhm_inv_krauser],
	["lhm_inv_rooth",lhm_inv_rooth],
	["lhm_inv_malle",lhm_inv_malle],
	["lhm_inv_stoivesant",lhm_inv_stoivesant],
	["lhm_inv_sensor",lhm_inv_sensor],
	["lhm_inv_sensor1",lhm_inv_sensor1],
	["lhm_inv_graffiti",lhm_inv_graffiti],
	["lhm_inv_geocatch",lhm_inv_geocatch],
	["lhm_inv_gas",lhm_inv_gas],
	["lhm_inv_hacken",lhm_inv_hacken],
	["lhm_inv_woodu",lhm_inv_woodu],
	["lhm_inv_woodp",lhm_inv_woodp],
	["lhm_inv_axe",lhm_inv_axe],
	["lhm_inv_egg",lhm_inv_egg],
	["lhm_inv_oilu",lhm_inv_oilu],
	["lhm_inv_oilp",lhm_inv_oilp],
	["lhm_inv_heroinu",lhm_inv_heroinu],
	["lhm_inv_heroinp",lhm_inv_heroinp],
	["lhm_inv_cannabis",lhm_inv_cannabis],
	["lhm_inv_marijuana",lhm_inv_marijuana],
	["lhm_inv_apple",lhm_inv_apple],
	["lhm_inv_rabbit",lhm_inv_rabbit],
	["lhm_inv_salema",lhm_inv_salema],
	["lhm_inv_ornate",lhm_inv_ornate],
	["lhm_inv_mackerel",lhm_inv_mackerel],
	["lhm_inv_tuna",lhm_inv_tuna],
	["lhm_inv_mullet",lhm_inv_mullet],
	["lhm_inv_catshark",lhm_inv_catshark],
	["lhm_inv_turtle",lhm_inv_turtle],
	["lhm_inv_fishingpoles",lhm_inv_fishingpoles],
	["lhm_inv_water",lhm_inv_water],
	["lhm_inv_donuts",lhm_inv_donuts],
	["lhm_inv_turtlesoup",lhm_inv_turtlesoup],
	["lhm_inv_coffee",lhm_inv_coffee],
	["lhm_inv_fuelF",lhm_inv_fuelF],
	["lhm_inv_fuelE",lhm_inv_fuelE],
	["lhm_inv_pickaxe",lhm_inv_pickaxe],
	["lhm_inv_copperore",lhm_inv_copperore],
	["lhm_inv_ironore",lhm_inv_ironore],
	["lhm_inv_ironr",lhm_inv_ironr],
	["lhm_inv_copperr",lhm_inv_copperr],
	["lhm_inv_sand",lhm_inv_sand],
	["lhm_inv_salt",lhm_inv_salt],
	["lhm_inv_saltr",lhm_inv_saltr],
	["lhm_inv_glass",lhm_inv_glass],
	["lhm_inv_tbacon",lhm_inv_tbacon],
	["lhm_inv_lockpick",lhm_inv_lockpick],
	["lhm_inv_redgull",lhm_inv_redgull],
	["lhm_inv_peach",lhm_inv_peach],
	["lhm_inv_diamond",lhm_inv_diamond],
	["lhm_inv_coke",lhm_inv_coke],
	["lhm_inv_cokep",lhm_inv_cokep],
	["lhm_inv_diamondr",lhm_inv_diamondr],
	["lhm_inv_spikeStrip",lhm_inv_spikeStrip],
	["lhm_inv_rock",lhm_inv_rock],
	["lhm_inv_cement",lhm_inv_cement],
	["lhm_inv_blastingcharge",lhm_inv_blastingcharge],
	["lhm_inv_boltcutter",lhm_inv_boltcutter],
	["lhm_inv_defusekit",lhm_inv_defusekit],
	["lhm_inv_storagesmall",lhm_inv_storagesmall],
	["lhm_inv_storagebig",lhm_inv_storagebig],
	["lhm_inv_roadbarrier1",lhm_inv_roadbarrier1],
	["lhm_inv_roadcone1",lhm_inv_roadcone1],
	["lhm_inv_card",lhm_inv_card],
	["lhm_inv_uran",lhm_inv_uran],
	["lhm_inv_uranwaste",lhm_inv_uranwaste],
	["lhm_inv_tabak",lhm_inv_tabak],
	["lhm_inv_zigarette",lhm_inv_zigarette],
	["lhm_inv_kidney",lhm_inv_kidney],
	["lhm_inv_container",lhm_inv_container],
	["lhm_inv_protest",lhm_inv_protest],
    ["lhm_inv_tourniquet",lhm_inv_tourniquet],
    [ "lhm_inv_Israeli_bandage",lhm_inv_Israeli_bandage],
    ["lhm_inv_combat_gauze",lhm_inv_combat_gauze],
    ["lhm_inv_druckverband",lhm_inv_druckverband],
    ["lhm_inv_morphin",lhm_inv_morphin],
    ["lhm_inv_tabletten",lhm_inv_tabletten],
    ["lhm_inv_schiene",lhm_inv_schiene]
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(call lhm_save_yinv) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

lhm_gear = _return;
