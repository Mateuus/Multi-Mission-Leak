// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _vehicle = param[ 0, objNull, [objNull] ];

if( isNull _vehicle ) exitWith {};

closeDialog 0; // Close the interaction menu

// Find out what zone we're near and get its configuration
private _zone = "";
private _item = "";
{
    {
        if(player distance (getMarkerPos _x) < 40) exitWith {
            _zone = _x;
        };
    } forEach (_x select 0);

    if( _zone != "" ) exitWith {
        _item = (_x select 1);
    };
} forEach XY_resourceZones;

if( _zone isEqualTo "" || _item isEqualTo "" ) exitWith {
    hint "Es sind keine Ressourcen in der Nähe";
};
if( (_vehicle getVariable ["lockedUntil", 0]) > servertime || { [_vehicle] call XY_fnc_inUse } ) exitWith {
    hint "Der Gerät ist bereits beschäftigt oder in Benutzung";
};
_vehicle setVariable ["lockedUntil", servertime + 180, true];

hint "Der Gerät sammelt...";

private _itemConfig = [_item] call XY_fnc_itemConfig;
private _itemWeight = _itemConfig select 1;

private _eventInterval = 30;
private _nextEvent = time + _eventInterval;
private _nextSound = time;
private _iterations = 0;

while { !(isNull _vehicle) && alive _vehicle && !([_vehicle] call XY_fnc_inUse) } do {

    if(isEngineOn _vehicle) exitWith {
        hint localize "STR_NOTF_ActionCancel";
    };
    if( fuel _vehicle <= 0.05 ) exitWith {
        hint localize "STR_NOTF_OutOfFuel";
    };
    private _weight = [_vehicle] call XY_fnc_vehicleWeight;
    if( ((_weight select 1) + _itemWeight) > (_weight select 0) ) exitWith {
        hint localize "STR_NOTF_DeviceFull";
    };
    if( _nextSound <= time ) then {
        {
            if( _vehicle distance _x < 250 ) then {
                [_vehicle, "device"] remoteExec ["say3D", _x];
            };
        } forEach allPlayers;
        _nextSound = time + 6.6;
    };

    if( time >= _nextEvent ) then {

        // Mining event!
        _eventInterval = 6 max (_eventInterval - 2.5);
        _nextEvent = time + _eventInterval;

        // Reduce fuel...
        private _fuel = 0 max ((fuel _vehicle) - 0.009);
        if( local _vehicle ) then { _vehicle setFuel _fuel; } else { [ _vehicle, _fuel ] remoteExec ["setFuel", _vehicle]; };

        // Retrieve trunk contents
        private _vInv = _vehicle getVariable [ "trunk", [[], 0] ];
        private _items = _vInv select 0;

        _weight = [_vehicle] call XY_fnc_vehicleWeight;
        // Calculate storable items...
        private _sum = [ _item, round( (8 + (random 20)) / _itemWeight ), _weight select 1, _weight select 0 ] call XY_fnc_calcWeightDiff;
        if(_sum < 1) exitWith {};

        private _val = 0;
        private _itemIndex = [_item, _items] call XY_fnc_index;
        if(_itemIndex == -1) then {
            _items pushBack [_item, _sum];
        } else {
            _val = _items select _itemIndex select 1;
            _items set[_itemIndex, [_item, _val + _sum]];
        };

        systemChat format[ "Der Gerät hat %1x %2 gesammelt (%3 gesamt)", _sum, _itemConfig select 2, _val + _sum];

        [_vehicle, _items] call XY_fnc_updateTrunk;
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