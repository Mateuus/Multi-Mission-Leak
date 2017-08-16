/*
	File: fn_civFetchGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches specific key items from the civilian for a persistent state.
*/
private["_ret","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_ret = [];
if(!(player getVariable["onkill",false])) then
{
_ret pushBack uniform player;
_ret pushBack vest player;
_ret pushBack backpack player;
_ret pushBack goggles player;
_ret pushBack headgear player;
_ret pushBack assignedItems player;
_ret pushBack primaryWeapon player;
_ret pushBack handGunWeapon player;
};
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

if(uniform player != "" && !(player getVariable["onkill",false])) then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "" && !(player getVariable["onkill",false])) then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "" && !(player getVariable["onkill",false])) then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && !(player getVariable["onkill",false])) then
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

if(count (handgunMagazine player) > 0 && !(player getVariable["onkill",false])) then
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

if(count (primaryWeaponItems player) > 0 && !(player getVariable["onkill",false])) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0 && !(player getVariable["onkill",false])) then
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
    ["EMonkeys_inv_apple", EMonkeys_inv_apple],
    ["EMonkeys_inv_rabbit", EMonkeys_inv_rabbit],
    ["EMonkeys_inv_salema", EMonkeys_inv_salema],
    ["EMonkeys_inv_ornate", EMonkeys_inv_ornate],
    ["EMonkeys_inv_mackerel", EMonkeys_inv_mackerel],
    ["EMonkeys_inv_tuna", EMonkeys_inv_tuna],
    ["EMonkeys_inv_mullet", EMonkeys_inv_mullet],
    ["EMonkeys_inv_catshark", EMonkeys_inv_catshark],
    ["EMonkeys_inv_fishingpoles", EMonkeys_inv_fishingpoles],
    ["EMonkeys_inv_water", EMonkeys_inv_water],
    ["EMonkeys_inv_donuts", EMonkeys_inv_donuts],
    ["EMonkeys_inv_turtlesoup", EMonkeys_inv_turtlesoup],
    ["EMonkeys_inv_coffee", EMonkeys_inv_coffee],
    ["EMonkeys_inv_fuelF", EMonkeys_inv_fuelF],
    ["EMonkeys_inv_fuelE", EMonkeys_inv_fuelE],
    ["EMonkeys_inv_pickaxe", EMonkeys_inv_pickaxe],
    ["EMonkeys_inv_tbacon", EMonkeys_inv_tbacon],
    ["EMonkeys_inv_lockpick", EMonkeys_inv_lockpick],
    ["EMonkeys_inv_redgull", EMonkeys_inv_redgull],
    ["EMonkeys_inv_peach", EMonkeys_inv_peach],
    ["EMonkeys_inv_spikeStrip", EMonkeys_inv_spikeStrip],
    ["EMonkeys_inv_defusekit", EMonkeys_inv_defusekit]
];

_ret pushBack _uItems;
_ret pushBack _uMags;
_ret pushBack _bItems;
_ret pushBack _bMags;
_ret pushBack _vItems;
_ret pushBack _vMags;
_ret pushBack _pItems;
_ret pushBack _hItems;
_ret pushBack [];


civ_gear = _ret;