// File: fn_isNumber.sqf
private["_valid", "_value", "_compare"];

_value = _this select 0;
_valid = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
_array = [_value] call KRON_StrToArray;

_return = true;
{
    if( !(_x in _valid) ) exitWith {
        _return = false;
    };
} forEach _array;

_return;