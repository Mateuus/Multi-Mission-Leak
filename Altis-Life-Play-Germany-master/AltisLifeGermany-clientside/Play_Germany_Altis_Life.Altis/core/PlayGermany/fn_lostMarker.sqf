/*
file: fn_lostMarker.sqf

Author: RafiQuak for Play Germany

Description:
creates a "lost" marker on the map for each person of the group/faction and deletes it again after 10min

*/
private["_name","_pos","_lostmarker"];
_name = _this select 0;
_pos = _this select 1;

_lostmarker = createMarkerLocal [format["%1_lostmarker",_name],_pos];
_lostmarker setMarkerShapeLocal "ICON";
_lostmarker setMarkerTypeLocal "mil_warning";
_lostmarker setMarkerColorLocal "ColorRed";
_lostmarker setMarkerTextLocal format["letzte bekannte Position von %1",_name];

uiSleep 600;
deleteMarkerLocal _lostmarker;



