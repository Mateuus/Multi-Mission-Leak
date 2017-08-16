params [
    ["_value", -1, [true, 0]]
];

if (_value isEqualTo -1) exitWith {};

private _ret = if (_value isEqualType true) then {
    [0, 1] select _value;
} else {
    [false, true] select _value;
};

_ret;