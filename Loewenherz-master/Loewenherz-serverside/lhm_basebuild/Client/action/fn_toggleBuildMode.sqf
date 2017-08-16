if (vehicle player != player) exitWith {Hint "Du kannst dies nicht im Fahrzeug tun!"}; 
 
if (lhm_gangarea_buildmode) then { 
 lhm_gangarea_buildmode = false; 
 ["Bau Modus : AUS", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
} else { 
 lhm_gangarea_buildmode = true; 
 ["Bau Modus : AN", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
};