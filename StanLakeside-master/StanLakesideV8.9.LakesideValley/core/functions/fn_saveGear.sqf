/*
    File: fn_saveGear.sqf
    
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka
    
    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled","_launch","_launchItems","_lMag"];
_return = [];
_life_gear = str life_gear;
_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
_return pushBack primaryWeapon player;
_return pushBack handgunWeapon player;

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_launchItems= [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags pushBack _x;
        } else {
            _uItems pushBack _x;
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags pushBack _x;
        } else {
            _bItems pushBack _x;
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags pushBack _x;
        } else {
            _vItems pushBack _x;
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && !deadPlayer) then
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
            _vMags pushBack _pMag;
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags pushBack _pMag;
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags pushBack _pMag;
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && !deadPlayer) then
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
            _vMags pushBack _hMag;
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags pushBack _hMag;
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags pushBack _hMag;
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems pushBack _x;
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems pushBack _x;
    } forEach (handGunItems player);
};
_saveGear = 
[
    ["life_inv_bec", life_inv_bec],
    ["life_inv_medkit", life_inv_medkit],
    ["life_inv_mobilephone", life_inv_mobilephone],
    ["life_inv_panicbutton", life_inv_panicbutton],
    ["life_inv_tierope", life_inv_tierope],   
    ["life_inv_apple", life_inv_apple],
    ["life_inv_rabbit", life_inv_rabbit],
    ["life_inv_salema", life_inv_salema],
    ["life_inv_ornate", life_inv_ornate],
    ["life_inv_mackerel", life_inv_mackerel],
    ["life_inv_tuna", life_inv_tuna],
    ["life_inv_mullet", life_inv_mullet],
    ["life_inv_catshark", life_inv_catshark],
    ["life_inv_fishingpoles", life_inv_fishingpoles],
    ["life_inv_water", life_inv_water],
    ["life_inv_donuts", life_inv_donuts],
    ["life_inv_turtlesoup", life_inv_turtlesoup],
    ["life_inv_coffee", life_inv_coffee],
    ["life_inv_fuelF", life_inv_fuelF],
    ["life_inv_fuelE", life_inv_fuelE],
    ["life_inv_pickaxe", life_inv_pickaxe],
    ["life_inv_tbacon", life_inv_tbacon],
    ["life_inv_lockpick", life_inv_lockpick],
    ["life_inv_redgull", life_inv_redgull],
    ["life_inv_peach", life_inv_peach],
    ["life_inv_airkit", life_inv_airkit],
    ["life_inv_bandage", life_inv_bandage],
    ["life_inv_spikeStrip", life_inv_spikeStrip],
    ["life_inv_defusekit", life_inv_defusekit],
    ["life_inv_storagesmall", life_inv_storagesmall],
    ["life_inv_storagebig", life_inv_storagebig],
	["life_inv_condom",life_inv_condom],

    ["life_inv_cigarette",life_inv_cigarette],
    ["life_inv_cokep",life_inv_cokep],
    ["life_inv_methp",life_inv_methp],
    ["life_inv_MDMAp",life_inv_MDMAp],
    ["life_inv_marijuana",life_inv_marijuana],
	["life_inv_cleankit",life_inv_cleankit]
];





if(playerSide != civilian && playerSide != east) then {
	{
		_saveGear pushBack _x;
	} foreach 
	[
		["life_inv_RoadBlockWood", life_inv_RoadBlockWood],
		["life_inv_RoadCone", life_inv_RoadCone],
		["life_inv_RoadConeStrip", life_inv_RoadConeStrip],
		["life_inv_RoadConeB", life_inv_RoadConeB],
		["life_inv_RoadConeStripB", life_inv_RoadConeStripB]
	];
	if(playerSide == west) then {
		_saveGear pushBack ["life_inv_BarGate", life_inv_BarGate];
	};
};

{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems pushBack _name;
        };
    };
} forEach _saveGear;

if(count (secondaryWeaponMagazine player) > 0 && !deadPlayer) then
{
    _lMag = ((secondaryWeaponMagazine player) select 0);
    if(_lMag != "") then
    {
        _uni = player canAddItemToUniform _lMag;
        _ves = player canAddItemToVest _lMag;
        _bag = player canAddItemToBackpack _lMag;
        _handled = false;
        if(_ves) then
        {
            _vMags pushBack _lMag;
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags pushBack _lMag;
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags pushBack _lMag;
            _handled = true;
        };
    };
};

if(count (secondaryWeaponItems player) > 0) then
{
    {
		_launchItems pushBack _x;
    } forEach (secondaryWeaponItems player);
};

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(call life_save_yinv) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

_return pushBack secondaryWeapon player;
_return pushBack _launchItems;

life_gear = _return;
if(str life_gear == _life_gear) exitWith {};
player setVariable["gear",life_gear,true];