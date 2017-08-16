/*
    File: fn_medicMarkers.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Marks downed players on the map when it's open.
*/
private ["_markers","_units"];
_markers = [];
_units = [];

sleep 0.25;
if (visibleMap) then {
    {
        _down = _x getVariable ["esg_bewusstlos",false];
        if ( _down) then {
			if(round((_x getVariable ["esg_bewusstlos_delay",0]) - time) > 120) then {
				_units pushBack [_x,"ColorBlack"];
			} else {
				_units pushBack [_x,"ColorRed"];
			};
        };
    } forEach playableUnits;
	
    //Loop through and create markers.
    {
        _marker = createMarkerLocal [format ["%1_dead_marker",(_x select 0)],visiblePosition (_x select 0)];
        _marker setMarkerColorLocal (_x select 1);
        _marker setMarkerTypeLocal "loc_Hospital";
        _marker setMarkerTextLocal format ["Verwundeter: %1",((_x select 0) getVariable ["realname","Unknown Player"])];
        _markers pushBack _marker;
    } forEach _units;
    waitUntil {!visibleMap};
    {deleteMarkerLocal _x;} forEach _markers;
};