// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

scriptName "XY_fnc_cleanup";

private _nextCleanup = time;

{
    if( !( simulationEnabled _x) )then {
        _x setVariable["x.ds", true];
    };
} forEach (entities "All");

private _eventCode = {
    (_this select 0) enableSimulation true;
    (_this select 0) setVariable ["x.disabledUntil", time + 15];
};

while {true} do {

    uisleep 2 + (random 2);

    // ---
    // fed workaround
    XY_FED_DOME setVariable["bis_disabled_Door_1", 1];
    XY_FED_DOME setVariable["bis_disabled_Door_2", [1, 0] select (fed_bank getVariable["door.open.2", false])];
    XY_FED_DOME setVariable["bis_disabled_Door_3", [1, 0] select (fed_bank getVariable["door.open.3", false])];

    XY_FED_RSB setVariable["bis_disabled_Door_1", [1, 0] select (fed_bank getVariable["door.open.1", false])];
    // ---

    private _vehicle = vehicle player;

    if( _vehicle getVariable["unusable", false] ) then {
        player action ["EJECT", _vehicle];
    };

    if( _vehicle isKindOf "Air" ) then {
        XY_lastAirVehicle = time;
    };

    private _slingload = getSlingLoad _vehicle;
    if( !(isNull _slingload) && { !(_slingload getVariable["rope.allow", true]) } ) exitWith {
        hint "Das darfst du nicht heben";
        _vehicle setSlingLoad objNull;
    };

    // support THW abandon vehicles display
    if( _vehicle != player && { serverTime - (_vehicle getVariable ["lastUseTime", 0]) > 120 } ) then {
        _vehicle setVariable[ "lastUseTime", serverTime, true ];
    };
    if( _vehicle != player ) then {
        _vehicle setVariable ["lastUsedByMe", time ];
    };

    if( time >= _nextCleanup ) then {
        _nextCleanup = time + 60;
        {
            if( local _x && { count units _x == 0 } ) then {
                deleteGroup _x;
            };
        } foreach allGroups;
    };

    {
        private _o = agent _x;
        if( (_o isKindOf "Snake_random_F") || (_o isKindOf "Rabbit_F")) then {
            deleteVehicle _o;
        };
    } forEach agents;

    // WORKAROUND: Check if inventory size fits true size
    private _trueWeight = 0;
    {
        _trueWeight = _trueWeight + ((missionNameSpace getVariable [_x select 6, 0]) * (_x select 1));
    } forEach XY_virtItems;
    XY_carryWeight = _trueWeight;

    // Disable simulation for objects in far distances
    if( !(isNil "XY_ssv_X") && { XY_ssv_X > 0 } )then {
        private _camPos = positionCameraToWorld [0, 0, 0];
        private _pPos = getPos player;
        private _time = time;
        {
            if( !(_x getVariable["x.ds", false]) )then {

                if( !(_x getVariable ["x.evh", false]) )then {
                    _x addEventHandler ["GetIn", _eventCode];
                    _x addEventHandler ["Damaged", _eventCode];
                    _x addEventHandler ["EpeContactStart", _eventCode];
                    _x setVariable ["x.evh", true];
                };

                if( (_camPos distance2D _x) > XY_ssv_X && { (_pPos distance2D _x) > XY_ssv_X } && !(local _x) && { !(isPlayer _x) } && { (vectorMagnitude velocity _x) < 0.1 } && { (_x getVariable["x.disabledUntil", 0]) < time } )then {
                    if( simulationEnabled _x )then {
                        _x enableSimulation false;
                    };
                } else {
                    if( !(simulationEnabled _x) )then {
                        _x enableSimulation true;
                    };
                };
            };

        } forEach (entities "All");
    };
};