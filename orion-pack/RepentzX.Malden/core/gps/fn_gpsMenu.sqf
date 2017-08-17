/*
    File: fn_gpsMenu.sqf

    Description:
    Initializes the gps point selection menu.
*/
private ["_gpCfg","_gp","_ctrl"];
disableSerialization;

0 cutFadeOut 9999999;

if (!(createDialog "life_gps_selection")) exitWith {[] call life_fnc_gpsMenu;};
_gpCfg = [playerSide] call life_fnc_gpsPointCfg;

_ctrl = ((findDisplay 48500) displayCtrl 48510);
{
    _ctrl lnbAddRow[(_gpCfg select _ForEachIndex) select 1,(_gpCfg select _ForEachIndex) select 0,""];
    _ctrl lnbSetPicture[[_ForEachIndex,0],(_gpCfg select _ForEachIndex) select 2];
    _ctrl lnbSetData[[_ForEachIndex,0],(_gpCfg select _ForEachIndex) select 0];
} forEach _gpCfg;

_gp = _gpCfg select 0; //First option is set by default

[((findDisplay 48500) displayCtrl 48502),1,0.1,getMarkerPos (_gp select 0)] call life_fnc_setMapPosition;
life_gps_point = _gp select 0;

ctrlSetText[48501,format ["%2: %1",_gp select 1,localize "STR_location_CSP"]];