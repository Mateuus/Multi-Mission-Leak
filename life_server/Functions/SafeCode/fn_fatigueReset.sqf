/*
    File: fn_fatigueReset.sqf
    Author: Itsyuka
    
    Description:
    Stop the fatigue from going higher than what ever you set it to (Fucking BI Devs, shouldn't be doing this).
*/

[] spawn {
    while {true} do {
        if (life_fatigue < getFatigue player) then {
            player setFatigue life_fatigue;
        };
        sleep 1.5;
    };
};