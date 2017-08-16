// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

disableSerialization;

("SplashNoise" call BIS_fnc_rscLayer) cutRsc ["SplashNoise", "BLACK", 0, true];

createDialog "RscDisplayWelcome";

private _display = findDisplay 999999;
(_display displayCtrl 1100) ctrlSetStructuredText (parseText XY_ssv_welcome);

waitUntil{ sleep 1; isNull _display };