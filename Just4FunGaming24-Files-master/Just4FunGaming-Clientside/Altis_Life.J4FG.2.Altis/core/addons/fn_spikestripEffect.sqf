// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private ["_vehicle", "_spikeStrips"];

while { true } do {

    waitUntil { sleep 1; _vehicle = vehicle player; _vehicle != player && { player == driver _vehicle } && { _vehicle isKindOf "Car" } };

    // Solange der Spieler der Fahrer ist...
    while { alive player && { vehicle player == _vehicle } && { player == driver vehicle player } } do {

        _spikeStrips = nearestObjects[ player, ["Land_Razorwire_F"], 100 ];
        {
            if( (player distance _x) < 5 ) then {
                _vehicle setHitPointDamage["HitLFWheel", (0.65 + (random 1)) min 1 ];
                _vehicle setHitPointDamage["HitLF2Wheel", (0.55 + (random 1)) min 1 ];
                _vehicle setHitPointDamage["HitRFWheel", (0.6 + (random 1)) min 1 ];
                _vehicle setHitPointDamage["HitRF2Wheel", (0.75 + (random 1)) min 1 ];
                deleteVehicle _x;
            };
        } forEach _spikeStrips;

        uisleep ([0.1, 4] select (_spikeStrips isEqualTo []));
    };
};