/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Moves the map in the spawn control to the marker location the player is clicked on
*/
disableSerialization;
private["_spawnScreen","_commit","_zoom","_markerLoc"];

_spawnScreen = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_commit = [_this,1,1,[0]] call BIS_fnc_param;
_zoom = [_this,2,0.1,[0]] call BIS_fnc_param;
_markerLoc = [_this,3,[],[[]]] call BIS_fnc_param;
if((isNull _spawnScreen)||(count _markerLoc == 0))exitWith {};

_spawnScreen ctrlMapAnimAdd[_commit,_zoom,_markerLoc];
ctrlMapAnimCommit _spawnScreen;