// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// based on work by Tonic

disableSerialization;

private _shopItems = (findDisplay 2400) displayCtrl 2401;
private _playerItems = (findDisplay 2400) displayCtrl 2402;

//Purge list
lbClear _shopItems;
lbClear _playerItems;

private _shopData = [];
{
    if( (_x select 0) isEqualTo XY_shopType ) exitWith {
        _shopData = _x select 1;
    };
} forEach XY_virtShops;

if( _shopData isEqualTo [] ) exitWith {};

ctrlSetText[ 2403, format["%1", _shopData select 0] ];

{
    private _config = [ _x ] call XY_fnc_itemConfig;
    if( !(_config isEqualTo []) ) then {

        private _price = _config select 3;
        if( _price > 0 && call (_config select 7) ) then {
            _shopItems lbAdd format[ "[%1€] %2", [_price] call XY_fnc_numberText, _config select 2 ];
            _shopItems lbSetData [(lbSize _shopItems) - 1, _x];
            _shopItems lbSetValue [(lbSize _shopItems) - 1, _price];
        };
    };
} forEach (_shopData select 1);

{
    private _config = [ _x ] call XY_fnc_itemConfig;
    if( !(_config isEqualTo []) ) then {
        _val = missionNameSpace getVariable [_config select 6, 0];

        private _price = _config select 4;
        if(_val > 0) then {
            _playerItems lbAdd format[ "[%1€] %2x %3", [_price] call XY_fnc_numberText, _val, _config select 2];
            _playerItems lbSetData [(lbSize _playerItems) - 1, _x];
        };
    };
} forEach (_shopData select 1);