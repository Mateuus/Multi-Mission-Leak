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
    ["life_inv_spikeStrip", life_inv_spikeStrip],
	["life_inv_holzb", life_inv_holzb],
	["life_inv_sperre", life_inv_sperre],
	["life_inv_hut", life_inv_hut],
	["life_inv_band", life_inv_band],
	["life_inv_battery", life_inv_battery],
    ["life_inv_defusekit", life_inv_defusekit],
    ["life_inv_storagesmall", life_inv_storagesmall],
    ["life_inv_storagebig", life_inv_storagebig],
	["life_inv_scalpel", life_inv_scalpel],
	["life_inv_gpsTracker", life_inv_gpsTracker],
	["life_inv_tablette", life_inv_tablette],
	["life_inv_tablette2", life_inv_tablette2],
	["life_inv_tablette3", life_inv_tablette3],
	["life_inv_gegengift", life_inv_gegengift],
	["life_inv_verband", life_inv_verband],
	["life_inv_laterne", life_inv_laterne],
	["life_inv_jagdmesser", life_inv_jagdmesser],
	["life_inv_henraw", life_inv_henraw],
    ["life_inv_roosterraw", life_inv_roosterraw],
    ["life_inv_sheepraw", life_inv_sheepraw],
    ["life_inv_goatraw", life_inv_goatraw],
	["life_inv_rabbitraw", life_inv_rabbitraw],
	["life_inv_henmeat", life_inv_henmeat],
    ["life_inv_roostermeat", life_inv_roostermeat],
    ["life_inv_sheepmeat", life_inv_sheepmeat],
    ["life_inv_goatmeat", life_inv_goatmeat],
	["life_inv_seide", life_inv_seide],
	["life_inv_netz", life_inv_netz],
	["life_inv_timemachine", life_inv_timemachine],
	["life_inv_axt", life_inv_axt],
	["life_inv_holz", life_inv_holz],
	["life_inv_indigo", life_inv_indigo],
	["life_inv_baumwolle", life_inv_baumwolle],
	["life_inv_guthaben", life_inv_guthaben],
	["life_inv_detektor", life_inv_detektor],
	["life_inv_joghurt", life_inv_joghurt],
	["life_inv_pizza", life_inv_pizza],
	["life_inv_pressluft", life_inv_pressluft],
	["life_inv_ahwcart", life_inv_ahwcart],
	["life_inv_darkorb", life_inv_darkorb],
	["life_inv_darkuni", life_inv_darkuni],	
	["life_inv_quest1", life_inv_quest1],
	["life_inv_quest2", life_inv_quest2],
	["life_inv_quest3", life_inv_quest3],
	["life_inv_skelett", life_inv_skelett],
	["life_inv_feuerwerkr", life_inv_feuerwerkr],
	["life_inv_feuerwerkb", life_inv_feuerwerkb],
	["life_inv_feuerwerkg", life_inv_feuerwerkg],
	["life_inv_feuerwerkw", life_inv_feuerwerkw],
	["life_inv_feuerwerk", life_inv_feuerwerk],
	["life_inv_geschenk", life_inv_geschenk],
	["life_inv_wschokolade",life_inv_wschokolade],
	["life_inv_toiletpaper",life_inv_toiletpaper],
    ["life_inv_pumpe",life_inv_pumpe],
    ["life_inv_football",life_inv_football],
    ["life_inv_airhorn",life_inv_airhorn],
    ["life_inv_joint",life_inv_joint],
    ["life_inv_papier",life_inv_papier],
    ["life_inv_reifen",life_inv_reifen],
    ["life_inv_aluminium",life_inv_aluminium],
    ["life_inv_cable",life_inv_cable],
    ["life_inv_zschachtel_leer",life_inv_zschachtel_leer],
    ["life_inv_schrauben",life_inv_schrauben],
    ["life_inv_tabakblatt",life_inv_tabakblatt],  
    ["life_inv_zigarette",life_inv_zigarette],
    ["life_inv_zigarre",life_inv_zigarre],
    ["life_inv_blueprintsport",life_inv_blueprintsport],
    ["life_inv_blueprintifrit",life_inv_blueprintifrit],
    ["life_inv_blueprintqilin",life_inv_blueprintqilin],
    ["life_inv_blueprintprowler",life_inv_blueprintprowler],
    ["life_inv_blueprintcaesar",life_inv_blueprintcaesar],
    ["life_inv_blueprintscooter",life_inv_blueprintscooter],
    ["life_inv_blueprintorca",life_inv_blueprintorca],
    ["life_inv_schaufel",life_inv_schaufel],
    ["life_inv_goetzikopf",life_inv_goetzikopf],
    ["life_inv_goetzitorso",life_inv_goetzitorso],
    ["life_inv_goetziglied",life_inv_goetziglied],
    ["life_inv_bertramkopf",life_inv_bertramkopf],
    ["life_inv_bertramtorso",life_inv_bertramtorso],
    ["life_inv_bertramglied",life_inv_bertramglied],
    ["life_inv_momphredkopf",life_inv_momphredkopf],
    ["life_inv_momphredtorso",life_inv_momphredtorso],
    ["life_inv_momphredglied",life_inv_momphredglied],
    ["life_inv_ronkopf",life_inv_ronkopf],
    ["life_inv_rontorso",life_inv_rontorso],
    ["life_inv_ronglied",life_inv_ronglied],
    ["life_inv_johnkopf",life_inv_johnkopf],
    ["life_inv_johntorso",life_inv_johntorso],
    ["life_inv_johnglied",life_inv_johnglied],
    ["life_inv_goetzi",life_inv_goetzi],
    ["life_inv_bertram",life_inv_bertram],
    ["life_inv_momphred",life_inv_momphred],
    ["life_inv_ron",life_inv_ron],
    ["life_inv_john",life_inv_john],
    ["life_inv_lupe",life_inv_lupe],
    ["life_inv_volleyball",life_inv_volleyball]
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