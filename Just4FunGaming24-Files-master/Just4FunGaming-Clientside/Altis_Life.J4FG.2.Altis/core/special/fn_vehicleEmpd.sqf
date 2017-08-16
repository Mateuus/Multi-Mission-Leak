// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_vehicle", "_source", "_escaped"];

_vehicle =  [ _this, 0, objNull, [objNull] ] call BIS_fnc_param;
_source  =  [ _this, 1, objNull, [objNull] ] call BIS_fnc_param;

if( isNull _vehicle || isNull _source ) exitWith {};

if( _vehicle getVariable["emp.active", false] ) exitWith {};
_vehicle setVariable ["emp.active", true, true];

[1, "<t color='#FF0000' size ='3' align='center'>EMP AKTIV</t><br/><t color='#FF0000' size ='1' align='center'>!!! SOFORT LANDEN !!!</t>"] remoteExec [ "XY_fnc_broadcast", crew _vehicle ];

_escaped = false;
for[ {_i = 0}, {_i < 8}, {_i = _i + 1} ] do {
    _vehicle say3D "empwarn";
    uisleep 3.35;

    hintSilent parseText format["<t color='#FF0000' size ='3' align='center'>EMP AKTIV</t><br/><t color='#FF0000' size ='1' align='center'>!!! SOFORT LANDEN !!!</t><br/><t align='center'>Entfernung zur Quelle: %1m<br/>Erfolgreiche Flucht bei 400m</t>", round (player distance _source)];

    if( (player distance _source) > 400 ) exitWith {
        _escaped = true;
    };
};

if( _escaped ) exitWith {
    _vehicle setVariable ["emp.active", false, true];
    format ["<EMP> %1 (%2) EMP escaped from %3 (%4) @ %5", profileName, getPlayerUID player, name _source, getPlayerUID _source, mapGridPosition player] remoteExec ["XY_fnc_log", 2];
    hint "Du konntest aus dem EMP-Bereich flüchten";
    [1, "<t color='#FF0000' size ='3' align='center'>EMP FEHLSCHLAG</t><br/><t color='#FF0000' size ='1' align='center'>Das Ziel konnte flüchten</t>"] remoteExec [ "XY_fnc_broadcast", _source];
};

format ["<EMP> %1 (%2) EMP hit from %3 (%4) @ %5", profileName, getPlayerUID player, name _source, getPlayerUID _source, mapGridPosition player] remoteExec ["XY_fnc_log", 2];
[1, "<t color='#0000FF' size ='3' align='center'>EMP ERFOLGREICH</t><br/><t color='#0000FF' size ='1' align='center'>Das Ziel wurde deaktiviert</t>"] remoteExec [ "XY_fnc_broadcast", _source];

hint "Die Turbine wurde für 2 Minuten deaktiviert";

_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
sleep (2 * 60);
_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];

_vehicle setVariable ["emp.active", false, true];