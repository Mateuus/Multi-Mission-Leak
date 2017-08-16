// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( !(playerSide isEqualTo civilian) ) exitWith {};

while {true} do {
    if( !(typeOf (vehicle player) isEqualTo "O_Heli_Transport_04_covered_F") && (currentVisionMode player) > 1 ) then {
            333 cutText ["Thermalsicht ist offline", "BLACK", 0.0001];
            waitUntil { currentVisionMode player < 2 };
            333 cutText ["", "PLAIN", 0.5];
    };
};