scriptName "fn_createMarker";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_createMarker.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_createMarker.sqf"

_object = param[0,objNull,[objNull]];

// Ex
if (isNull _object) exitWith {};

// Fetch text
_text = getText(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "MapConfiguration" >> "text");

// Create marker
_marker = createMarker ["mav_convoy_marker",[(getPos _object) select 0,(getPos _object) select 1]];
_marker setMarkerType "b_unknown";
_marker setMarkerText _text;

// Create loop until the vehicle does not exist anymore to update the marker position
_object spawn {
	while {(!isNull _this)} do {
		sleep 0.1;
		"mav_convoy_marker" setMarkerPos (getPos _this);
	};
};