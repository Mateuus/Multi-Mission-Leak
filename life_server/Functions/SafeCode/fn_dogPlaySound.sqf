/*
	File: fn_dogPlaySound.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Plays a 3D sound in the area of the dog
*/
sound 		= _this select 0;
dog1 		= _this select 1;

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
sound = _soundPath + format ["sounds\dog\%1.ogg", sound];

publicvariable "sound";
publicvariable "dog1";
//[{dog1 say3d sound},"bis_fnc_spawn",true] spawn bis_fnc_mp;
playSound3D [sound, dog1, false, getPos dog1, 10, 1, 125]