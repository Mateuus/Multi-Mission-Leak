private ["_object"]; 
 
_object = cursorTarget; 
if (isNull _object) exitWith {}; 
 
if (vehicle player != player) exitWith {Hint "Du kannst dies nicht im Fahrzeug tun!"}; 
 
hint "Wählen Sie nun den Spieler aus dem Sie diese Basis zuweisen möchten und bestätigen Sie"; 
 
createDialog "lhm_owner_gang_dialog"; 
waitUntil {!(isNil "lhm_flagpole_gangId")}; 
hint "Vorgang war erfolgreich!"; 
[_object] spawn build_fnc_setOwnerGang;