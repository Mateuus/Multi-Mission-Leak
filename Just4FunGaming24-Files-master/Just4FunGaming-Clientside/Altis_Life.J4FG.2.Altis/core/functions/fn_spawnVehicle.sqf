// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _class =          param [ 0, "",          [""]          ];
private _spawnPositions = param [ 1, [],          [[]]          ];
private _price =          param [ 2, -1,          [0]           ];
private _color =          param [ 3, -1,          [0]           ];
private _vid =            param [ 4, -1,          [0]           ];
private _trunk =          param [ 5, [[], 0],     [[]]          ];
private _targetSide =     param [ 6, sideUnknown, [sideUnknown] ];
private _chipType =       param [ 7, -1,          [0]           ];
private _damage =         param [ 8, [],          [[]]          ];
private _fuel =           param [ 9, 1,           [0]           ];

if( _class isEqualTo "" || _spawnPositions isEqualTo [] || _price < 0 || _color < 0 || _targetSide isEqualTo sideUnknown ) exitWith {};

// Select spawnpoint
private _spawn = [];
{
    if( (nearestObjects[ _x select 0, [ "Car", "Ship", "Air" ], 7]) isEqualTo [] ) exitWith {
        _spawn = _x
    };
} forEach _spawnPositions;

if( _spawn isEqualTo [] ) exitWith {
    hint "Der Spawnpunkt ist blockiert";
    nil
};
// Vehicle spawned and ready: remove money
if( !([_price, [2, 0] select (_vid < 0) ] call XY_fnc_pay) ) exitWith {
    hint "Du hast zu wenig Geld";
    nil;
};

// Spawn
private _pos = _spawn select 0;

private _vehicle = createVehicle[_class, [0, 0, 1000], [], 500, "NONE"];
_vehicle setVariable ["BIS_enableRandomization", false, true];
_vehicle allowDamage false;
_vehicle lock 2;
// _vehicle setFuelCargo 0;
_vehicle setDir (_spawn select 1);
_vehicle setPos [_pos select 0, _pos select 1, (_pos select 2) + 0.5];
_vehicle setVectorUp (surfaceNormal _pos);

if( _class != "B_MRAP_01_hmg_F" ) then {
    {
        // Do not remove horn...
        if( _x != "SportCarHorn" && _x != "TruckHorn" && _x != "TruckHorn2" && _x != "TruckHorn3" && _x != "MiniCarHorn" && _x != "FakeHorn" && _x != "CarHorn" && _x != "CMFlareLauncher" && ( _targetSide != civilian || _x != "SmokeLauncher") ) then {
            _vehicle removeWeapon _x;
        };
    } forEach weapons _vehicle;
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

if( _class isEqualTo "B_Heli_Transport_01_F" ) then {
    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red", [1]];
    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red", [2]];
};

//Remove Copilot for Helicopter without Spotter-function
    if( _vehicle isKindOf "air" ) then {
        _vehicle  enableCopilot false;
    };

// Color
[_vehicle, _color] call XY_fnc_vehicleColor;

// Attach variables
_vehicle setVariable[ "usedBy", "", true ];
_vehicle setVariable[ "owner", getPlayerUID player, true ];
_vehicle setVariable[ "ownerName", profileName, true ];
_vehicle setVariable[ "users", [profileName], true ];
_vehicle setVariable[ "dbInfo", _vid, true ];
_vehicle setVariable[ "spawnTime", serverTime, true ];
_vehicle setVariable[ "lastUseTime", serverTime, true ];
_vehicle setVariable[ "trunk", _trunk, true];
_vehicle setVariable[ "side", _targetSide, true];
_vehicle setVariable[ "color", _color, true];

if( _chipType > 0 ) then {
    _vehicle setVariable ["chip.enabled", true, true];
    _vehicle setVariable ["chip.type", _chipType, true];
};

_vehicle setFuel _fuel;

// Special side-dependent stuff
switch( _targetSide ) do {
    case west: {
        [_vehicle, "cop_offroad", true] spawn XY_fnc_vehicleAnimate;
    };
    case civilian: {
        if( _class isEqualTo "C_Heli_Light_01_civil_F" ) then {
            [_vehicle, "civ_littlebird", true] spawn XY_fnc_vehicleAnimate;
        };
        if( _class isEqualTo "B_Heli_Light_01_F" ) then {
            [_vehicle, "reb_littlebird", true] spawn XY_fnc_vehicleAnimate;
        };
    };
    case independent: {
        [_vehicle, "med_offroad", true] spawn XY_fnc_vehicleAnimate;
    };
    case east: {
        [_vehicle, "thw_offroad", true] spawn XY_fnc_vehicleAnimate;
    };
};

// Add vehicle keys to keychain
XY_vehicles pushBack _vehicle;

// Register key server-side (Do not use _targetSide here!)
[player, playerSide, _vehicle] remoteExec ["XY_fnc_addToKeychain", 2];

// Add special equipment for non-civ
if( _targetSide != civilian ) then {

    // Every car has at least pylons
    _vehicle setVariable ["equipCarrier", 1, true];

    if( _targetSide isEqualTo east ) then {

        // Every THW has at least pylons and barriers
        _vehicle setVariable ["equipCarrier", 2, true];

        // THW HEMTT
        if( _class isEqualTo "B_Truck_01_transport_F" ) then {
            _vehicle setVariable ["equipCarrier", 5, true];
        };
        // THW EL
        if( _class isEqualTo "I_Truck_02_ammo_F" ) then {
            _vehicle setVariable ["equipCarrier", 6, true];
        };
    };

    // COP HEMTT BOX
    if( _class isEqualTo "I_Truck_02_ammo_F" ) then {
        _vehicle setVariable ["equipCarrier", 7, true];
    };
};

if( _targetSide != playerSide ) then {
    hint "Das Fahrzeug ist ausgeparkt; bitte gib den Schlüssel an den Besitzer weiter";
} else {
    hint "Dein Fahrzeug steht bereit!";
};

[_vehicle, _damage] spawn {
    sleep 2;
    (_this select 0) allowDamage true;

    {
        (_this select 0) setHitIndex[ _x select 0, _x select 1 ];
    } forEach (_this select 1);
};

player reveal _vehicle;

if( _vid >= 0) then {
[_vehicle] call XY_fnc_insureVehicle;
};

_vehicle;