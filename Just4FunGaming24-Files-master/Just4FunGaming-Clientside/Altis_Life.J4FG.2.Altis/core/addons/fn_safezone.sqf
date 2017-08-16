// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _zone = getMarkerPos "other_safezone_kavala";
private _size = getMarkerSize "other_safezone_kavala";
_size = (_size select 0) min (_size select 1);
private _inside = false;

private _airWarnings = 0;

while { true } do {

    // Disable safezone announce when there is an active attack on kavala
    private _ctfActive = ctfKavala getVariable["ctfActive", false];
    private _ctfCaptured = ctfKavala getVariable["ctfCaptured", false];

    private _distance = _zone distance2D player;

    if ( _distance < _size && !_inside ) then {
        _inside = true;

        if( _ctfActive ) exitWith {
            hint parseText "<t color='#FF0000' size ='3' align='center'>ACHTUNG</t><br/><t color='#FF0000' align='center' size='1'>KAVALA wird angegriffen! Sofort ergeben, ansonsten kann das Feuer eröffnet werden!</t>";
        };
        if( _ctfCaptured ) exitWith {
            hint parseText "<t color='#FF0000' size ='3' align='center'>ACHTUNG</t><br/><t color='#FF0000' align='center' size='1'>KAVALA ist in Rebellenhand, keine SAFEZONE!</t>";
        };
        hint parseText "<t color='#FF0000' size ='3' align='center'>Absolute Safezone</t><br/><t color='#00BB00' align='center' size='1'>ALLE illegalen Aktivitäten sind zu unterlassen!</t>";
    };

    private _vehicle = vehicle player;
    if( _distance < 750 && { !_ctfActive } && { !_ctfCaptured } && { playerSide isEqualTo civilian } && { _vehicle != player } && { (driver _vehicle) isEqualTo player } && { isEngineOn _vehicle } && { _vehicle isKindOf "Air" } && { (((getPos _vehicle) select 2) < 290 || speed _vehicle < 10) } ) then {

        _airWarnings = _airWarnings + 1;

        if( _airWarnings >= 4 ) then {
            if( local _vehicle ) then { _vehicle setFuel 0; } else { [ _vehicle, 0 ] remoteExec ["setFuel", _vehicle]; };
            [0, format["%1 wurde der Sprit geklaut, weil er über Kavala gehovert ist", profileName]] remoteExec ["XY_fnc_broadcast"];
            _airWarnings = 0;
            uisleep 90;
        } else {
            [1, format[ "<t color='#FF0000' size ='2' align='center'>Flugverbotszone</t><br/><t color='#00BB00' align='center' size='1'>Das Fliegen unterhalb 300m oder das Hovern über Kavala ist verboten<br/><br/>Warnung %1 von 3</t>", _airWarnings ]] remoteExec ["XY_fnc_broadcast", crew _vehicle];
            uisleep 25;
        };
    };

    if ( _zone distance player > _size && _inside ) then {
        _inside = false;
        hint "ACHTUNG: Du hast die Safezone verlassen";
    };

    // Sleep based on distance:
    uisleep ([1, 15] select ( _distance > 2000 ));
};