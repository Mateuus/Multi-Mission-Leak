/*
    File: fn_spawnMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl","_camtime"];
disableSerialization;
_camTime = 5;

if (life_is_arrested) exitWith {
    [] call life_fnc_respawned;
};

if (life_respawned) then {
    [] call life_fnc_respawned;
};
//cutText["","BLACK FADED"];
cutText ["","BLACK IN"];
//cam = "camera" camCreate [3260.87, 12813.7, 65]; // kavala bay
//cam = "camera" camCreate [16142, 16749, 65]; // Federal reserve
cam = "camera" camCreate [3859, 12699, 65]; // kavala hospital
cam camSetFOV 1.900;
cam camSetTarget player;
//cam cameraEffect ["internal", "RIGHT FRONT"];
cam cameraEffect ["internal", "FRONT"];
showCinemaBorder false;
cam camCommit 0;

if (!(createDialog "life_spawn_selection")) exitWith {[] call life_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

_spCfg = [playerSide] call life_fnc_spawnPointCfg;

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
    _ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
    _ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
    _ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
} forEach _spCfg;

_sp = _spCfg select 0; //First option is set by default

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];
