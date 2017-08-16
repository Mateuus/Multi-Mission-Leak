waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
//systemChat format[" ", _rscLayer];
[] spawn {
sleep 3;
_counter = 360;
_timeSinceLastUpdate = 0;
while {true} do
{
sleep 3;
_counter = _counter - 1;
((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["TS3: 46.105.147.196:11153 | Polizisten: %1 | Zivilisten: %2 | ARS: %3", west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits];
};
};