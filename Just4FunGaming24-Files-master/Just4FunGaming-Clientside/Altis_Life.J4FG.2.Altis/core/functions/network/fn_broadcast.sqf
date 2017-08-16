// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_type","_message"];

_type =     [ _this, 0, -1, [[], 0] ] call BIS_fnc_param;
_message =  [ _this, 1, "", [""]    ] call BIS_fnc_param;
_extra =    [ _this, 2, "", [""]    ] call BIS_fnc_param;
_duration = [ _this, 3, -1, [0]     ] call BIS_fnc_param;

if( isServer ) exitWith {
    diag_log format["XY_fnc_broadcast(%1)", _this];
};

if( _message isEqualTo "" ) exitWith {};

if( typeName _type != "ARRAY" ) then {
    _type = [_type];
};

for "_i" from 0 to (count _type) - 1 do {
    switch((_type select _i)) do {
        case 0: {
            systemChat _message;
        };
        case 1: {
            hint parseText format["%1", _message];
            if( _duration > 0 && _duration < 10 ) then {
                uisleep _duration;
                hintSilent "";
            };
        };
        case 2: {
            titleText[format["%1", _message], "PLAIN"];
        };
        case 3: {
            [parseText format["<t size='2'>BREAKING NEWS</t><br/>%1", _message], parseText (format["+++ %1 +++ %1 +++ %1 +++ %1 +++ %1 +++ %1 +++", _extra]) ] spawn BIS_fnc_AAN; 
            uisleep 25; 
            (uinamespace getvariable "BIS_AAN") closeDisplay 1;
        };
    };
};