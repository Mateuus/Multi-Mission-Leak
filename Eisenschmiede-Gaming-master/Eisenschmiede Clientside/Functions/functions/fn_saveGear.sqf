#include "..\script_macros.hpp"
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

if (currentWeapon player in VerboteneWaffen) then {
    removeAllWeapons player;
};

if (vest player in VerboteneWesten) then {
    removevest player;
};

if (uniform player in VerboteneUniformen) then { _return pushBack ""; } else { _return pushBack uniform player; };

_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
if(playerSide == west || playerSide == civilian && {EQUAL(ES_SETTINGS(getNumber,"save_civ_weapons"),1)}) then {
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

if(!(EQUAL(uniform player,""))) then {
    {
        if (_x in (magazines player)) then {
			_uMags = _uMags + [_x];

        } else {
			_uItems = _uItems + [_x];

        };
    } forEach (uniformItems player);
};

if(!(EQUAL(backpack player,""))) then {
    {
        if (_x in (magazines player)) then {
			_bMags = _bMags + [_x];

        } else {
			_bItems = _bItems + [_x];

        };
    } forEach (backpackItems player);
};

if(!(EQUAL(vest player,""))) then {
    {
        if (_x in (magazines player)) then {
			_vMags = _vMags + [_x];

        } else {
			_vItems = _vItems + [_x];

        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then {
    _pMag = SEL((primaryWeaponMagazine player),0);
	
    if(!(EQUAL(_pMag,""))) then {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
		
        if(_ves) then {
			_vMags = _vMags + [_pMag];

            _handled = true;
        };
		
        if(_uni && !_handled) then {
			_uMags = _uMags + [_pMag];

            _handled = true;
        };
		
        if(_bag && !_handled) then {
			_bMags = _bMags + [_pMag];

            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then {
    _hMag = ((handgunMagazine player) select 0);
	
    if(!(EQUAL(_hMag,""))) then {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
		
        if(_ves) then {
		_vMags = _vMags + [_hMag];

            _handled = true;
        };
		
        if(_uni && !_handled) then {
			_uMags = _uMags + [_hMag];
            _handled = true;
        };
		
        if(_bag && !_handled) then {
			_uMags = _uMags + [_hMag];

            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then {
    {
		_pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handgunItems player) > 0) then {
    {
		_hItems = _hItems + [_x];

    } forEach (handGunItems player);
};

{
    _val = ITEM_VALUE(_x);
    if (_val > 0) then {
		_yItems pushBack [_x,_val];
    };
} forEach [
	"pickaxe","fuelEmpty","fuelFull", "spikeStrip", "lockpick", "defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts",
	"rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtleSoup","hen","rooster","sheep","goat","blaulicht","akkuschrauber","painkiller","Epinephrin","hund1","hund2","hund3","hund4","hund5",
	"hund6","hase","ziege","huhn","shaf","feuerl","schildd","grafittid","grafittidmit","grafittidope","lappi","gpstracker","head","pylone","tape","barriere","schranke","licht"
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(EQUAL(ES_SETTINGS(getNumber,"save_virtualItems"),1)) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

ES_gear = _return;