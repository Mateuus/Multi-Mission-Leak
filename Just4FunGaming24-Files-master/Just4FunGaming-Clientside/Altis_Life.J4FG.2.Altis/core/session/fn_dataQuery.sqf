// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( XY_sessionCompleted ) exitWith {};

cutText[ "Lade Spielerdaten...", "BLACK FADED"];
0 cutFadeOut 999999999;

[player, playerSide] remoteExec ["XYDB_fnc_queryRequest", XYDB];