#include <macro.h>
/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

private["_containers"];
_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} foreach _containers;

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
_unit setVariable["steam64id",(getPlayerUID player),true];
_unit setVariable["realname",profileName,true]; 
_unit setVariable["missingOrgan",FALSE,TRUE];
_unit setVariable["hasOrgan",FALSE,TRUE];

_unit addRating 9999999999999999;
player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_setupActions;
[_unit,true,playerSide] remoteExecCall ["SOA_fnc_managesc",2];
player enableFatigue (__GETC__(life_enableFatigue));

[] call life_fnc_hudSetup;