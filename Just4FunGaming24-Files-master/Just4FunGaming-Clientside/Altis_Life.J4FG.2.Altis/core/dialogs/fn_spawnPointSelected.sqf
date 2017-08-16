/*
    File: fn_spawnPointSelected.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;

private _control = param[0, controlNull, [controlNull]];
private _selection = param[1, 0, [0]];

private _sp = (call XY_fnc_spawnPointCfg) select _selection;
[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call XY_fnc_setMapPosition;
XY_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];