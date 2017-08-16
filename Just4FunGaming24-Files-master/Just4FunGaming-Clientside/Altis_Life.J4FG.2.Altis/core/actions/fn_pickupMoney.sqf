// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_obj", "_value"];

if( !params[ ["_obj", objNull, [objNull]] ] ) exitWith {};

if( player distance _obj > 5 ) exitWith {};

_value = (_obj getVariable[ "item", ["", 0] ]) select 1;
if( _value <= 0 ) exitWith {};

//Stop people picking up huge values of money which should stop spreading dirty money.
if( _value > 5000000 ) then {
    _value = round(_value * 0.3);
};

// Attach UID
if( !(_obj getVariable["owner", ""] isEqualTo "") ) exitWith {};
_obj setVariable["owner", getPlayerUID player, true];

player playMove "AinvPknlMstpSlayWrflDnon";

// Delay pickup randomly to prevent duping
sleep (random 2.5);
if( !(_obj getVariable["owner", ""] isEqualTo (getPlayerUID player)) ) exitWith {
    hint "Ein anderer Spieler versucht grad ebenfalls das Geld aufzuheben";
    _obj setVariable["owner", "", true];
};

deleteVehicle _obj;

hint format[localize "STR_NOTF_PickedMoney", [_value] call XY_fnc_numberText];
XY_CC = XY_CC + _value;
[0] call XY_fnc_updatePartial;

[getPlayerUID player, 3, format ["Hat %1€ vom Boden aufgehoben @ %2", [_value] call XY_fnc_numberText, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];