// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// Initializes a resource processor
// Adds the "process" and "buy license" action to a processor-object

if( !hasInterface ) exitWith {};

diag_log format[ "<IP> Initialize: %1", _this ];

with missionNamespace do {
    _this spawn {

        private _source = param[0, objNull, [objNull]];
        private _processorName = param[1, "", [""]];

        // Wait until mission is initialized
        waitUntil { !(isNil "XY_sessionCompleted") && { XY_sessionCompleted } };

        if( _source isEqualTo objNull || _processorName isEqualTo "" ) exitWith {};

        _source allowDamage false;
        _source enableSimulation true;

        private _processor = objNull;
        {
            if( (_x select 0) isEqualTo _processorName ) exitWith {
                _processor = _x;
            };
        } forEach XY_resourceProcessors;

        if( _processor isEqualTo objNull ) exitWith {
            diag_log format["<ERROR> initializeProcessor called, but processor %1 was not found", _processorName];
        };

        _source addAction[_processor select 6, XY_fnc_processAction, _processorName, 0, false, true, "", '!XY_actionInUse'];

        [_source, format["license_civ_%1", _processorName]] call XY_fnc_initializeLicenseSeller;
    };
};