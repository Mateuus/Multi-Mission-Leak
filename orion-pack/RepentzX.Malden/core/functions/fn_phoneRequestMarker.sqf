#include "..\..\script_macros.hpp"

private [_positionVar,_marker];
_positionVar = position player;
_marker = createMarker ["phoneRequestMarker", _positionVar];

"phoneRequestMarker" setMarkerColor "ColorRed";
"phoneRequestMarker" setMarkerText "Recent emergency phone call from or near this location!";
"phoneRequestMarker" setMarkerType "mil_warning";

sleep (2 * 60);
deleteMarker "phoneRequestMarker";