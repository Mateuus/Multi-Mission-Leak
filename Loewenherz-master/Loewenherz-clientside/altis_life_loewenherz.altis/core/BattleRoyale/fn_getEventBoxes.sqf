/*
	File: fn_getEventBoxes.sqf
	Author: Bloodwyn

	Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.

	Description:
	Gets event boxes?
*/
_return=[];

{
	if((_x getVariable ["owner_PID","0"])==getPlayerUID player)then{
		_return pushBack _x;
		_x setVariable ["realname","dein Schließfach",false];
	};
}foreach nearestObjects [player,["Box_NATO_Wps_F"],500];

_return;