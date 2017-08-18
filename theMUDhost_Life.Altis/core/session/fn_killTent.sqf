/*
	File: fn_killTent.sqf
	Author: Raku @ Veterans of Altis
	
	Kills the tent in the backend.
*/
life_tent = [];
[getPlayerUID player,"life_fnc_killTent",false,false] spawn life_fnc_MP;