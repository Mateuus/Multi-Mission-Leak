// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( XY_sessionCompleted ) exitWith {};

cutText["Erstelle Spielerdaten...", "BLACK FADED"];
0 cutFadeOut 9999999;

XY_isFirstJoin = true;

[player, profileName, XY_CC, XY_CA] remoteExec ["XYDB_fnc_insertRequest", XYDB];