// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_vehicle"];

_vehicle =  [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};

if( _vehicle getVariable["emp.active", false] ) exitWith {};
_vehicle setVariable ["emp.active", true, true];

[1, "<t color='#FF0000' size ='3' align='center'>EMP WARNUNG</t><br/><t color='#00FF00' size ='1' align='center'>SCHNELL LANDEN ODER FLÜCHTEN<t>"] remoteExec [ "XY_fnc_broadcast", crew _vehicle ];

for[ {_i = 0}, {_i < 5}, {_i = _i + 1} ] do {
    _vehicle say3D "empwarn";
    uisleep 3.35;
};

_vehicle setVariable ["emp.warned", true, true];
_vehicle setVariable ["emp.active", false, true];