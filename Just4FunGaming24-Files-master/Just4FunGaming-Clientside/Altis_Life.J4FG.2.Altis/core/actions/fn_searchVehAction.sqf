// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_vehicle", "_users", "_message"];

_vehicle = cursorTarget;

if( !(_vehicle isKindOf "Car" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship") ) exitWith {};

_users = _vehicle getVariable ["users", []];

if( _users isEqualTo [] ) exitWith {
    deleteVehicle _vehicle;
};

if( XY_actionInUse ) exitWith {};
XY_actionInUse = true;
hint "Fahrzeug wird untersucht und Halter abgefragt...";
uisleep 10;
XY_actionInUse = false;

if( player distance _vehicle > 10 || !(alive player) || !(alive _vehicle) ) exitWith {
    hint localize "Das Fahrzeug ist weg und konnte nicht überprüft werden";
};

_message = "";
{
    private _addon = "";
    if( playerSide isEqualTo east ) then {
        private _playerName = _x;
        private _online = "Nein";
        {
            if( (_x getVariable[ "realName", name _x ]) isEqualTo _playerName ) exitWith {
                _online = "Ja";
            };
        } forEach allPlayers;

        _addon = format[ " (Online: %1)", _online ];
    };

    _message = format[ "%1%2%3<br/>", _message, _x, _addon ];

} forEach _users;

_message = format[ "%1<br/>Mietwagen: %2<br/>Radarwarner: %3<br/>Chip-Tuning: %4 (Illegal: %5)",
        _message,
        [ "Nein", "Ja" ] select (_vehicle getVariable["dbInfo", -1] isEqualTo -1),
        [ "Nein", "Ja" ] select (_vehicle getVariable["radarwarner", false]),
        [ "Nein", "Ja" ] select (_vehicle getVariable["chip.enabled", false]),
        [ "Nein", "Ja" ] select (_vehicle getVariable["chip.enabled", false] && { _vehicle getVariable["chip.type", 0] > 2 })
    ];

hint parseText format["<t color='#FF0000' size='2'>Fahrzeuginfo</t><br/><t color='#FFD700' size='1.5'>Besitzer</t><br/><br/>%1", _message];