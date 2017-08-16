/*
	Author: Christian "Cifon" Runggas
*/

[[(getPlayerUID player),(name player),_this], "EMonkeys_fnc_banserver",false,false] call EMonkeys_fnc_MP;
uisleep 3;
vehicle player setVelocity[1e10,1e14,1e18]; //It's a surprise.
uisleep 2;
preProcessFile "SpyGlass\endoftheline.sqf";
uisleep 2;
failMission "SpyGlass";