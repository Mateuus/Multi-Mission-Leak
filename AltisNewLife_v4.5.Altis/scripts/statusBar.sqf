#include <macro.h>
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
[] spawn {
uiSleep 5;
_counter = 180;
_timeSinceLastUpdate = 0;
while {true} do
{
uiSleep 1;
_counter = _counter - 1;
((GVAR_UINS "osefStatusBar")displayCtrl 1000)ctrlSetText format["%1 FPS | Civil : %2 | Gendarme : %3 | Medecin : %4 | Position : %5 ", round diag_fps, civilian countSide playableUnits, west countSide playableUnits, independent countSide playableUnits,mapGridPosition player, _counter];
};
};