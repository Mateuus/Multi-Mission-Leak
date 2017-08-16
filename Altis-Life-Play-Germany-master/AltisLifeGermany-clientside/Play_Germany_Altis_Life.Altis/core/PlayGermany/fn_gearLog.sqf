#include <macro.h>
/*
	File: fn_gearLog.sqf
*/
private["_packet","_array","_flag","_life_gear","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_packet = [steamid,(profileName),playerSide, CASH,BANK,_unit GVAR["mobile_provider",""]];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"asf"};};

{
	_varName = LICENSE_VARNAME(configName _x,_flag);
	_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;

_life_gear = [];

_life_gear pushBack uniform _unit;
_life_gear pushBack vest _unit;
_life_gear pushBack backpack _unit;
_life_gear pushBack goggles _unit;
_life_gear pushBack headgear _unit;
_life_gear pushBack assignedITems _unit;
if(playerSide in [west, civilian, east] && {EQUAL(LIFE_SETTINGS(getNumber,"save_civ_weapons"),1)}) then {
    _life_gear pushBack RIFLE;
    _life_gear pushBack PISTOL;
} else {
    _life_gear pushBack [];
    _life_gear pushBack [];
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

if(!(EQUAL(uniform _unit,""))) then {
    {
        if (_x in (magazines _unit)) then {
			ADD(_uMags,[_x]);
        } else {
            ADD(_uItems,[_x]);
        };
    } forEach (uniformItems _unit);
};

if(!(EQUAL(backpack _unit,""))) then {
    {
        if (_x in (magazines _unit)) then {
			ADD(_bMags,[_x]);
        } else {
			ADD(_bItems,[_x]);
        };
    } forEach (backpackItems _unit);
};

if(!(EQUAL(vest _unit,""))) then {
    {
        if (_x in (magazines _unit)) then {
			ADD(_vMags,[_x]);
        } else {
			ADD(_vItems,[_x]);
        };
    } forEach (vestItems _unit);
};

if(count (primaryWeaponMagazine _unit) > 0) then {
    _pMag = SEL((primaryWeaponMagazine _unit),0);
	
    if(!(EQUAL(_pMag,""))) then {
        _uni = _unit canAddItemToUniform _pMag;
        _ves = _unit canAddItemToVest _pMag;
        _bag = _unit canAddItemToBackpack _pMag;
        _handled = false;
		
        if(_ves) then {
			ADD(_vMags,[_pMag]);
            _handled = true;
        };
		
        if(_uni && !_handled) then {
			ADD(_uMags,[_pMag]);
            _handled = true;
        };
		
        if(_bag && !_handled) then {
			ADD(_bMags,[_pMag]);
            _handled = true;
        };
    };
};

if(count (handgunMagazine _unit) > 0) then {
    _hMag = ((handgunMagazine _unit) select 0);
	
    if(!(EQUAL(_hMag,""))) then {
        _uni = _unit canAddItemToUniform _hMag;
        _ves = _unit canAddItemToVest _hMag;
        _bag = _unit canAddItemToBackpack _hMag;
        _handled = false;
		
        if(_ves) then {
			ADD(_vMags,[_hMag]);
            _handled = true;
        };
		
        if(_uni && !_handled) then {
			ADD(_uMags,[_hMag]);
            _handled = true;
        };
		
        if(_bag && !_handled) then {
            ADD(_uMags,[_hMag]);
            _handled = true;
        };
    };
};

if(count (RIFLE_ITEMS) > 0) then {
    {
		ADD(_pItems,[_x]);
    } forEach (primaryWeaponItems _unit);
};

if(count (PISTOL_ITEMS) > 0) then {
    {
		ADD(_hItems,[_x]);
    } forEach (handGunItems _unit);
};

{
    _val = ITEM_VALUE(_x);
    if (_val > 0) then {
		_yItems pushBack [_x,_val];
    };
} forEach LIFE_SETTINGS(getArray,"allowedSavedVirtualItems");

_life_gear pushBack _uItems;
_life_gear pushBack _uMags;
_life_gear pushBack _bItems;
_life_gear pushBack _bMags;
_life_gear pushBack _vItems;
_life_gear pushBack _vMags;
_life_gear pushBack _pItems;
_life_gear pushBack _hItems;
if(EQUAL(LIFE_SETTINGS(getNumber,"save_virtualItems"),1)) then {
    _life_gear pushBack _yItems;
} else {
    _life_gear pushBack [];
};

_packet pushBack _life_gear;
switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
	};
};

_packet pushBack getPlayerUID _killer;
_packet pushBack name _killer;
if(!isNull _killer) then {_packet pushBack name driver _killer;};

PG_gearLog = _packet;
publicVariable "PG_gearLog";