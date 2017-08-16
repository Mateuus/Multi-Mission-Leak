/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Players spawn menu
*/

private ["_dialog","_textBox","_img","_spawnLocs","_spawnList","_spawnPoint"];

disableSerialization;

waitUntil {!(isNull (findDisplay 46))};

_dialog = findDisplay 666671;
_textBox = _dialog displayCtrl 1100;
_img = _dialog displayCtrl 1200;
if(DS_jailed)exitWith{[] call DS_fnc_respawnMe;};

createDialog "spawnMenu";

_spawnLocs = [] call DS_fnc_getSpawnPoints;
_spawnList = ((findDisplay 666671) displayCtrl 1500);

{
	_spawnList lnbAddRow [(_spawnLocs select _forEachIndex) select 1,(_spawnLocs select _forEachIndex) select 0,""];
	_spawnList lnbSetPicture [[_forEachIndex,0],(_spawnLocs select _forEachIndex) select 2];
	_spawnList lnbSetData [[_forEachIndex,0],(_spawnLocs select _forEachIndex) select 0];
} forEach _spawnLocs;

_spawnPoint = _spawnLocs select 0;

[((findDisplay 666671) displayCtrl 1800),1,0.1,getMarkerPos (_spawnPoint select 0)] call DS_fnc_moveSpawnMap;

DS_spawnPoint = _spawnPoint;