// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _vehicle = param[0, objNull, [objNull]];
if( _vehicle isEqualTo objNull ) exitWith {};

closeDialog 0; // Close the interaction menu

//Find out what processor we're near and get its configuration
private _sourceItems = [];
private _targetItem = "";
private _duration = 0;
{
    private _processor = _x;
    {
        if( (_x find "processor_") > -1 && (_x find (_processor select 0) > -1) && player distance (getMarkerPos _x) < 30 ) exitWith {
            _sourceItems = _processor select 1;
            _targetItem = _processor select 2;
            _duration = _processor select 3;
        };
    } forEach allMapMarkers;

    if( !(_sourceItems isEqualTo []) ) exitWith {};

} forEach XY_resourceProcessors;

if( _sourceItems isEqualTo [] || _targetItem isEqualTo "" || _duration <= 0 ) exitWith {
    hint "Es ist kein Verarbeiter in der Nähe";
};

private _targetItemConfig = [_targetItem] call XY_fnc_itemConfig;

// Min device mine duration
_duration = _duration / 5;

if( (_vehicle getVariable ["lockedUntil", 0]) > servertime || { [_vehicle] call XY_fnc_inUse } ) exitWith {
    hint "Der Gerät ist bereits beschäftigt oder in Benutzung";
};
_vehicle setVariable ["lockedUntil", servertime + 180, true];

hint "Der Gerät verarbeitet...";

private _eventInterval = 30;
private _nextEvent = time + _eventInterval;
private _nextSound = time;
private _iterations = 0;

while { !(isNull _vehicle) && alive _vehicle && !([_vehicle] call XY_fnc_inUse) && _eventInterval > 0 } do {

    if(isEngineOn _vehicle) exitWith {
        hint "Verarbeiten abgebrochen";
    };
    if( fuel _vehicle <= 0.025 ) exitWith {
        hint "Kein Treibstoff mehr";
    };
    if( _nextSound <= time ) then {
        {
            if( _vehicle distance _x < 250 ) then {
                [_vehicle, "deviceprocess"] remoteExec ["say3D", _x];
            };
        } forEach allPlayers;
        _nextSound = time + 8.05;
    };

    if( time >= _nextEvent ) then {

        // Retrieve trunk contents
        private _vInv = _vehicle getVariable [ "trunk", [[], 0] ];
        private _trunkItems = _vInv select 0;
        private _trunkWeight = _vInv select 1;

        private _sourceItemsAvailable = 0;
        {
            private _sourceItemIndex = [_x, _trunkItems] call XY_fnc_index;

            if( _sourceItemIndex == -1 ) exitWith {
                _sourceItemsAvailable = 0;
            };
            _tmp = (_trunkItems select _sourceItemIndex) select 1;

            if( _sourceItemsAvailable == 0 || _tmp < _sourceItemsAvailable ) then {
                _sourceItemsAvailable = _tmp;
            };

        } forEach _sourceItems;

        if( _sourceItemsAvailable < 1 ) exitWith {
            hint "Der Gerät hat keine Rohstoffe mehr";
            _eventInterval = -1;
        };

        // Process event!
        _eventInterval = _duration max (_eventInterval - 1.5);
        _nextEvent = time + _eventInterval;

        // Reduce fuel...
        private _fuel = 0 max (fuel _vehicle) - 0.008;
        if( local _vehicle ) then { _vehicle setFuel _fuel; } else { [ _vehicle, _fuel ] remoteExec ["setFuel", _vehicle]; };

        private _sum = _sourceItemsAvailable min (round( 1 + (random 7) ));

        // Remove unprocessed items...
        {
            private _sourceItemIndex = [_x, _trunkItems] call XY_fnc_index;
            private _count = (_trunkItems select _sourceItemIndex) select 1;

            if( _count - _sum < 1 ) then {
                _trunkItems set[_sourceItemIndex, -1];
                _trunkItems = _trunkItems - [-1];
            } else {
                _trunkItems set[_sourceItemIndex, [_x, _count - _sum]];
            }

        } forEach _sourceItems;

        // Add processed items...
        private _val = 0;
        private _targetItemIndex = [_targetItem, _trunkItems] call XY_fnc_index;
        if( _targetItemIndex == -1 ) then {
            _trunkItems pushBack [_targetItem, _sum];
        } else {
            _val = _trunkItems select _targetItemIndex select 1;
            _trunkItems set[_targetItemIndex, [_targetItem, _val + _sum]];
        };

        private _message = "";
        {
            _config = [_x] call XY_fnc_itemConfig;
            _message = format["%1 %2x %3", _message, _sum, _config select 2];

        } forEach _sourceItems;

        systemChat format[ "Der Gerät hat%1 verarbeitet (%2 %3 gesamt)", _message, _val + _sum, _targetItemConfig select 2 ];

        [_vehicle, _trunkItems] call XY_fnc_updateTrunk;
        if( _iterations mod 4 isEqualTo 0 ) then {
            [_vehicle] remoteExec [ "XYDB_fnc_updateVehicle", XYDB];
            _vehicle setVariable ["lockedUntil", servertime + (_eventInterval * 5), true];
        };
        _iterations = _iterations + 1;
    };

    uisleep 0.1;
};

uisleep 1;

[_vehicle] remoteExec [ "XYDB_fnc_updateVehicle", XYDB];
_vehicle setVariable ["lockedUntil", 0, true];
[_vehicle, true] call XY_fnc_inUse;