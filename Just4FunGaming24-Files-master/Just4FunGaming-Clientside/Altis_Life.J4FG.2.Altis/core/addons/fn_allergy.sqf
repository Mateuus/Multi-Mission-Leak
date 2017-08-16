// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
// Medical system - Allergies against different painkillers

_playerID = getPlayerUID player;
_end = [_playerID, 1] call KRON_StrRight;

if ( _end == "2" || _end == "4" || _end == "6" ) then {
    XY_medAllergies pushBack "amadol";
} else {
    XY_medAllergies pushBack "metamizol";
};
if ( _end == "1" || _end == "5" || _end == "9" ) then {
    XY_medAllergies pushBack "oxycodon";
} else {
    XY_medAllergies pushBack "morphin";
};