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
if(playerSide == west || playerSide == civilian && {(call life_save_civ)}) then {
    _return pushBack primaryWeapon player;
    _return pushBack handgunWeapon player;
} else {
    _return pushBack [];
    _return pushBack [];
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
	["life_inv_apple", life_inv_apple],
	["life_inv_orange", life_inv_orange],
	["life_inv_strawberry", life_inv_strawberry],
	["life_inv_blueberry", life_inv_blueberry],
	["life_inv_chicken_meat", life_inv_chicken_meat],
	["life_inv_sheep_meat", life_inv_sheep_meat],
	["life_inv_goat_meat", life_inv_goat_meat],
	["life_inv_rabbit_meat", life_inv_rabbit_meat],
	["life_inv_fishingpoles", life_inv_fishingpoles],
	["life_inv_water", life_inv_water],
	["life_inv_donuts", life_inv_donuts],
	["life_inv_turtlesoup", life_inv_turtlesoup],
	["life_inv_coffee", life_inv_coffee],
	["life_inv_fuelF", life_inv_fuelF],
	["life_inv_fuelE", life_inv_fuelE],
	["life_inv_pickaxe", life_inv_pickaxe],
	["life_inv_chainsaw", life_inv_chainsaw],
	["life_inv_tbacon", life_inv_tbacon],
	["life_inv_lockpick", life_inv_lockpick],
	["life_inv_peach", life_inv_peach],
	["life_inv_spikeStrip", life_inv_spikeStrip],
	["life_inv_defusekit", life_inv_defusekit],
	["life_inv_storagesmall", life_inv_storagesmall],
	["life_inv_storagebig", life_inv_storagebig],
	["life_inv_bombdetect", life_inv_bombdetect],
	["life_inv_civdefusekit", life_inv_civdefusekit],
	["life_inv_bottledshine", life_inv_bottledshine],
	["life_inv_bottledbeer", life_inv_bottledbeer],
	["life_inv_bottledwhiskey", life_inv_bottledwhiskey],
	["life_inv_moonshine", life_inv_moonshine],
	["life_inv_mash", life_inv_mash],
	["life_inv_underwatercharge", life_inv_underwatercharge],
	["life_inv_tentciv", life_inv_tentciv],
	["life_inv_wood", life_inv_wood],
	["life_inv_joint", life_inv_joint],
	["life_inv_dogwhistle", life_inv_dogwhistle],
	["life_inv_gpstracker", life_inv_gpstracker],
	["life_inv_nitro", life_inv_nitro],
	["life_inv_vehAmmo", life_inv_vehAmmo],
	["life_inv_roadCone", life_inv_roadCone],
	["life_inv_roadBarrier", life_inv_roadBarrier],
	["life_inv_cncBarrier", life_inv_cncBarrier],
	["life_inv_cncBarrierL", life_inv_cncBarrierL],
	["life_inv_barGate", life_inv_barGate],
	["life_inv_mobileOutpost", life_inv_mobileOutpost],
	["life_inv_floodLightSingle", life_inv_floodLightSingle],
	["life_inv_floodLightDouble", life_inv_floodLightDouble],
	["life_inv_outpostHMG", life_inv_outpostHMG],
	
	["life_inv_copperRing", life_inv_copperRing],
	["life_inv_silverRing", life_inv_silverRing],
	["life_inv_goldRing", life_inv_goldRing],
	["life_inv_pearlNecklace", life_inv_pearlNecklace],
	["life_inv_emerald", life_inv_emerald],
	["life_inv_sapphire", life_inv_sapphire],
	["life_inv_ruby", life_inv_ruby],
	
	["life_inv_handgrip", life_inv_handgrip],
	["life_inv_trigger", life_inv_trigger],
	["life_inv_9mmCase", life_inv_9mmCase],
	["life_inv_9mmBullet", life_inv_9mmBullet],
	["life_inv_primer", life_inv_primer],
	["life_inv_gunpowder", life_inv_gunpowder],
	["life_inv_glasslens", life_inv_glasslens],
	["life_inv_electric", life_inv_electric],
	["life_inv_steeltube", life_inv_steeltube],
	["life_inv_chamber", life_inv_chamber],
	["life_inv_metalcase", life_inv_metalcase],
	["life_inv_556Case", life_inv_556Case],
	["life_inv_556Bullet", life_inv_556Bullet],
	["life_inv_65Case", life_inv_65Case],
	["life_inv_65Bullet", life_inv_65Bullet],
	["life_inv_762Case", life_inv_762Case],
	["life_inv_762Bullet", life_inv_762Bullet],
	["life_inv_408Case", life_inv_408Case],
	["life_inv_408Bullet", life_inv_408Bullet],
	["life_inv_leather", life_inv_leather],
	["life_inv_thread", life_inv_thread],
	["life_inv_heavythread", life_inv_heavythread],
	["life_inv_metalplate", life_inv_metalplate],
	["life_inv_needle", life_inv_needle],
	["life_inv_zipper", life_inv_zipper],
	["life_inv_45Case", life_inv_45Case],
	["life_inv_45Bullet", life_inv_45Bullet],
	["life_inv_explosive", life_inv_explosive],
	["life_inv_handCuffs", life_inv_handCuffs],
	["life_inv_handCuffKey", life_inv_handCuffKey]

];

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

life_gear = _return;
