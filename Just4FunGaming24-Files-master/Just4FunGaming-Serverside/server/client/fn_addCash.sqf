// fn_addCash.sqf
// by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// used to silently add cash to the client by the server

private[ "_amount", "_toBank", "_announce", "_message" ];

if( !params[
        [ "_amount",   0,    [0]     ],
        [ "_toBank",   true, [false] ],
        [ "_announce", 0,    [0]     ]
    ]) exitWith {};

if( _toBank ) then {
    XY_CA = XY_CA + _amount;
    _message = format["Du hast %1€ auf's Bankkonto erhalten", [_amount] call XY_fnc_numberText];
} else {
    XY_CC = XY_CC + _amount;
    _message = format["Du hast %1€ Bargeld erhalten", [_amount] call XY_fnc_numberText];
};
[0] call XY_fnc_updatePartial;

if( _announce != 0 ) then {
    systemChat _message;
};

if( _announce isEqualTo 2 ) then {
    hint parseText format["<t align='center' size='1' color='#DDDDDD'>%1</t>", _message];
};