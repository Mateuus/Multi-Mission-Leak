/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Testing the server playing sounds rather than the client
*/

private ["_soundPath","_soundToPlay"];

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + format ["extras\sounds\%1.ogg",(_this select 1)];

playSound3D [_soundToPlay,(_this select 0)];