/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Players spawn menu
*/
disableSerialization; 
private ["_spawnLocs","_spawnPoint","_spawnList","_img","_textBox","_dialog"];
waitUntil {!(isNull (findDisplay 46))};
_dialog = findDisplay 666671;
_textBox = _dialog displayCtrl 1100;
_img = _dialog displayCtrl 1200;
if(DS_jailed)exitwith
	{
	[] call DS_fnc_respawnMe;
	};
/*	
if(DS_repawned)exitWith	
	{
	[] call DS_fnc_respawnMe:
	};
*/	
if(!(createDialog "spawnMenu")) exitWith {[] call DS_fnc_spawnMenuScreen;};

_spawnLocs = [] call DS_fnc_getSpawnPoints;

_spawnList = ((findDisplay 666671) displayCtrl 1500);
{
	_spawnList lnbAddRow[(_spawnLocs select _ForEachIndex) select 1,(_spawnLocs select _ForEachIndex) select 0,""];
	_spawnList lnbSetPicture[[_ForEachIndex,0],(_spawnLocs select _ForEachIndex) select 2];
	_spawnList lnbSetData[[_ForEachIndex,0],(_spawnLocs select _ForEachIndex) select 0];
}forEach _spawnLocs;

_spawnPoint = _spawnLocs select 0;//Zero by default

[((findDisplay 666671) displayCtrl 1800),1,0.1,getMarkerPos (_spawnPoint select 0)] call DS_fnc_moveSpawnMap;
DS_spawnPoint = _spawnPoint;












