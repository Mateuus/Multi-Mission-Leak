// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( (vest player) != "V_HarnessOGL_brn") exitWith {};

if( player distance (getMarkerPos "thwImpoundedVehicles_1") < 75 || player distance (getMarkerPos "thwImpoundedVehicles_2") < 75 || player distance (getMarkerPos "thwImpoundedVehicles_3" ) < 30 || player distance (getMarkerPos "other_safezone_kavala" ) < 180 || player distance (getMarkerPos "other_safezone_pyrgos" ) < 350 ) exitWith {
    hint "Deine Bombe hat eine Fehlfunktion und du bekommst einen starken Stromschlag. Gute Nacht!";
    player unassignItem "V_HarnessOGL_brn";
    player removeItem "V_HarnessOGL_brn";
    sleep 5;
    player setDamage 1;
    [0, format["%1 wollte einen Selbstmord begehen aber hat dabei nur sein eigenes Leben verloren!", profileName]] remoteExec ["XY_fnc_broadcast"];
};

private _action = [
    "Willst du den Knaller wirklich zünden? ACHTUNG: Du darst dies nur in einem RP und nicht in einer Safezone tun!",
    "Zünden?",
    "ZÜNDEN!",
    "ABBRUCH"
] call BIS_fnc_guiMessage;

if( !_action ) exitWith {};

[0, format["%1 hat ein Selbstmordattentat begangen!", profileName]] remoteExec ["XY_fnc_broadcast"];
player unassignItem "V_HarnessOGL_brn";
player removeItem "V_HarnessOGL_brn";
[getPos player] remoteExec ["XY_fnc_bomb", 2];

uisleep 1;
if( alive player ) then {
    player setDamage 1;
};