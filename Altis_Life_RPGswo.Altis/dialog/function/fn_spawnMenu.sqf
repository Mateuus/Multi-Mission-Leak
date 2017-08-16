/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the spawn point selection menu.
*/
#include "..\..\macros.hpp"
private["_spCfg","_sp","_ctrl"];
disableSerialization;

DWEV_var_spawnInProcess = true;

if(DWEV_is_arrested) exitWith {
	[] call DWEV_fnc_respawned;
};

if(DWEV_respawned) then {
	[] call DWEV_fnc_respawned;
};
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
if(!(createDialog "DWEV_spawn_selection")) exitWith {[] call DWEV_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call DWEV_fnc_displayHandler"];

_spCfg = [(side player)] call DWEV_fnc_spawnPointCfg;

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
	_ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
	_ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
	_ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
} foreach _spCfg;

_sp = _spCfg select 0; //First option is set by default

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call DWEV_fnc_setMapPosition;
DWEV_spawn_point = _sp;

ctrlSetText[38501,format["Aktueller Spawnpunkt: %1",_sp select 1]];

// Spawnmenü Mesage Box Life Anzeige
[] spawn
{
	disableSerialization;
	_control = (getControl(38500,38503));
	_messageText = "";

	while {!(isNull (findDisplay 38500))} do
	{
		 if (_messageText != DWEV_SpawnMessage) then
		 {
			_messageText = DWEV_SpawnMessage;
			_control  ctrlSetStructuredText parseText format["%1",DWEV_SpawnMessage];
		 };
		 sleep 2;
	};
};


