params [
	["_player", objnull, [objnull]]
];

_markerPanic = createMarkerLocal ["_markerPanic", getPos _player];
_markerPanic setMarkerTypeLocal "mil_warning";
_markerPanic setMarkerColorLocal "ColorRed";
_markerPanic setMarkerTextLocal "PANIC BUTTON USED!";

uiSleep 60;
deleteMarkerLocal _markerPanic;