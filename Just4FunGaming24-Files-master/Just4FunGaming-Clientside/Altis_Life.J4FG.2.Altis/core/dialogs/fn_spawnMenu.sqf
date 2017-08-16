/*
    File: fn_spawnMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;

if(XY_isArrested) exitWith {
    [] call XY_fnc_respawned;
};

if(XY_respawned) then {
    [] call XY_fnc_respawned;
};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

if(!(createDialog "XY_dialog_spawnSelection")) exitWith {
    [] call XY_fnc_spawnMenu;
};
(findDisplay 38500) displaySetEventHandler ["keyDown", "_this call XY_fnc_displayHandler"];

private _spCfg = call XY_fnc_spawnPointCfg;

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
    _ctrl lnbAddRow[_x select 1, _x select 0, ""];
    _ctrl lnbSetPicture[[_forEachIndex, 0], _x select 2];
    _ctrl lnbSetData[[_forEachIndex, 0], _x select 0];
} forEach _spCfg;

private _sp = _spCfg select 0;

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call XY_fnc_setMapPosition;
XY_spawn_point = _sp;

ctrlSetText[38501, format["%2: %1", _sp select 1, localize "STR_Spawn_CSP"]];