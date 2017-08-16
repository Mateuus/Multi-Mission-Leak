/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Randomizes a players body type (Mainly to remove custom faces from non-donors
*/

private ["_randomFace"];

if(DS_donorLevel > 0)exitwith {};
_rand = round random 33;
DS_realEstateArray set [27,_rand];
_randomFace = DS_faceArray select _rand;
[player,_randomFace] remoteExec ["HUNT_fnc_setupBody",2];
[] call DS_fnc_compileData;