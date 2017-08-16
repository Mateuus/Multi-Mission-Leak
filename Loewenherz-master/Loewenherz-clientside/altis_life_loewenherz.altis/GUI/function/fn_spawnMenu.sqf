/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;

if(lhm_is_arrested == 1 || lhm_is_arrested == 2) exitWith {
	[] call lhm_fnc_respawned;
};

if(lhm_respawned) then {
	[] call lhm_fnc_respawned;
};
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
if(!(createDialog "lhm_spawn_selection")) exitWith {[] call lhm_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call lhm_fnc_displayHandler"];

_spCfg = [playerSide] call lhm_fnc_spawnPointCfg;

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
	if ((count _x) > 0) then {
		_ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
		_ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
		_ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
	};
} foreach _spCfg;

_sp = _spCfg select 0; //First option is set by default

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call lhm_fnc_setMapPosition;
lhm_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];