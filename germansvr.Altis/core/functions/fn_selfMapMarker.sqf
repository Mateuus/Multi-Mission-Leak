/*
Filename: selfMapMarker.sqf
Author: Relentless
Description: Setzt einen Marker für den Spieler selbst auf die Karte
*/
while {visibleMap} do {
	sleep 0.5;
	_marker = "";
    if (visibleMap) then {
        _marker = createMarkerLocal [format["%1_marker",player],visiblePosition player];
        _marker setMarkerColorLocal "ColorGreen";
        _marker setMarkerTypeLocal "Mil_dot";
        _marker setMarkerTextLocal format ["%1", player getVariable["realname",name player]];
    };
    
    while {visibleMap} do {        
        _marker setMarkerPosLocal (visiblePosition player);
		sleep 0.02;
		if (!visibleMap) exitWith {};
    };
    deleteMarkerLocal _marker;
};