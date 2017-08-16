// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// Initializes a license seller
// Adds the "buy license" action to an object

if( !hasInterface ) exitWith {};

diag_log format[ "<LS> Initialize: %1", _this ];

with missionNamespace do {
    _this spawn {

        private _source = param[0, objNull, [objNull]];
        private _licenseName = param[1, "", [""]];

        // Wait until mission is initialized
        waitUntil { !(isNil "XY_sessionCompleted") && { XY_sessionCompleted } };

        private _license = objNull;
        {
            if( (_x select 0) isEqualTo _licenseName ) exitWith {
                _license = _x;
            };
        } forEach (XY_licenses + XY_training);

        if( _license isEqualTo objNull ) exitWith {
            diag_log format["<ERROR> initializeLicenseSeller called, but license %1 was not found", _licenseName];
        };

        private _licenseSide = switch( _license select 1 ) do {
            case( "cop" ): { "west" };
            case( "thw" ): { "east" };
            case( "med" ): { "independent" };
            default { "civilian" };
        };

        _source addAction[ format["%1 (%2€)", _license select 2, [_license select 3] call XY_fnc_numberText], XY_fnc_buyLicense, _licenseName, 0, false, true, "", format["!%1 && playerSide isEqualTo %2", _licenseName, _licenseSide]];
    };
};