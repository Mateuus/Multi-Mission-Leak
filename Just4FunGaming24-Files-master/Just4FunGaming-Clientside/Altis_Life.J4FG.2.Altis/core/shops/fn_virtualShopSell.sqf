// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( (lbCurSel 2402) == -1 ) exitWith {};

private _type = lbData[2402, (lbCurSel 2402)];
if( _type isEqualTo "" ) exitWith {};

private _config = [_type] call XY_fnc_itemConfig;
if( _config isEqualTo [] ) exitWith {};

private _amount = ctrlText 2405;
if( !([_amount] call XY_fnc_isnumber) ) exitWith {
    hint localize "STR_Shop_Virt_NoNum";
};
_amount = parseNumber (_amount);

if( !([false, _type, _amount] call XY_fnc_handleInv) ) exitWith {
    hint "So viele Items hast du nicht";
};

private _price = _config select 4;
_price = _price * _amount;

hint format[ "Du verkaufst %1x %2 für %3€", _amount, _config select 2, [_price] call XY_fnc_numberText];
XY_CC = XY_CC + _price;

private _found = false;
{
    if( _x select 0 == _type ) exitWith {
        _x set [1, (_x select 1) + _amount];
        _x set [2, (_x select 2) + _price];
        _found = true;
    };
} forEach XY_marketVolume;

if ( !_found ) then {
    XY_marketVolume pushBack [_type, _amount, _price];
};
XY_marketLastAction = time;

if( XY_shopType in ["drugs", "blackmarket"] ) then {

    private _sellers = XY_shopNPC getVariable["sellers", []];
    private _uid = getPlayerUID player;
    private _found = false;
    {
        if( (_x select 0) isEqualTo _uid ) exitWith {
            _found = true;
        };
    } forEach _sellers;

    if( !_found ) then {
        _sellers pushBack [_uid, profileName];
        XY_shopNPC setVariable["sellers", _sellers, true];
    };
};

XY_forceSaveTime = time + 8;
[] call XY_fnc_virtualShopUpdate;