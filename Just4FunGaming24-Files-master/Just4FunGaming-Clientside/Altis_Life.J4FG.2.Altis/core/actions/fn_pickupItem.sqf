// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_obj", "_item", "_config", "_diff"];

if( !params[ ["_obj", objNull, [objNull]] ] ) exitWith {};

if( player distance _obj > 5 ) exitWith {};

_item = _obj getVariable ["item", []];
if( _item isEqualTo [] ) exitWith {};

_config = [_item select 0] call XY_fnc_itemConfig;

_diff = [ _item select 0, _item select 1, XY_carryWeight, XY_maxWeightCurrent] call XY_fnc_calcWeightDiff;
if( _diff <= 0 ) exitWith {
    hint localize "STR_NOTF_InvFull"
};

// Attach UID
if( !(_obj getVariable["owner", ""] isEqualTo "") ) exitWith {};
_obj setVariable["owner", getPlayerUID player, true];

player playMove "AinvPknlMstpSlayWrflDnon";

// Delay pickup randomly to prevent duping
sleep (random 2.5);
if( !(_obj getVariable["owner", ""] isEqualTo (getPlayerUID player)) ) exitWith {
    hint "Ein anderer Spieler versucht grad ebenfalls den Koffer aufzuheben";
    _obj setVariable["owner", "", true];
};

if( playerSide isEqualTo west && _config select 5 && !((_item select 0) in ["tracker", "spikeStrip"]) ) exitWith {

    private _value = round((_config select 4) * 0.5);

    hint format[ localize "STR_NOTF_PickedEvidence", _config select 2, [ _value ] call XY_fnc_numberText ];
    XY_CC = XY_CC + _value;
    [0] call XY_fnc_updatePartial;
    deleteVehicle _obj;
};

hint format[localize "STR_NOTF_Picked", _diff, _config select 2];
XY_forceSaveTime = time + 8;

if( _diff != _item select 1 ) exitWith {
    if( ([ true, _config select 0, _diff ] call XY_fnc_handleInv) ) then {
        _obj setVariable[ "item", [ _item select 0, ((_item select 1) - _diff) ], true];
    };
    _obj setVariable["owner", "", true];
};

[ true, _item select 0, _item select 1 ] call XY_fnc_handleInv;
hint format[ localize "STR_NOTF_Picked", _diff, _config select 2];
deleteVehicle _obj;