/*
    File: fn_gpsPointSelected.sqf
	
    Description:
    Sorts out the gps point selected and does a map zoom.
*/
disableSerialization;
private ["_control","_selection","_gpCfg","_gp"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_selection = [_this,1,0,[0]] call BIS_fnc_param;

_gpCfg = [playerSide] call life_fnc_gpsPointCfg;
_gp = _gpCfg select _selection;
[((findDisplay 48500) displayCtrl 48502),1,0.1,getMarkerPos (_gp select 0)] call life_fnc_setMapPosition;
life_gps_point = _gp select 0;


ctrlSetText[48501,format ["%2: %1",_gp select 1,localize "STR_location_CSP"]];