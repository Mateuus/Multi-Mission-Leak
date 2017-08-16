/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Moves the map in the spawn control to the marker location the player is clicked on
*/
disableSerialization;
private["_spawnScreen","_index","_spawnLocs","_spawnPoint","_dialog","_img"];

_spawnScreen = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,0,[0]] call BIS_fnc_param;

_dialog = findDisplay 666671;
_textBox = _dialog displayCtrl 1100;
_img = _dialog displayCtrl 1200;

_spawnLocs = [] call DS_fnc_getSpawnPoints;
_spawnPoint = _spawnLocs select _index;
[((findDisplay 666671) displayCtrl 1800),1,0.1,getMarkerPos (_spawnPoint select 0)] call DS_fnc_moveSpawnMap;
DS_spawnPoint = _spawnPoint;

_textBox ctrlSetStructuredText parseText format ["%1 : %2",(_spawnPoint select 1),(_spawnPoint select 4)];
_img ctrlSetText format ["extras\textures\menus\%1.jpg",(_spawnPoint select 3)];