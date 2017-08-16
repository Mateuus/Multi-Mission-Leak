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
private["_containers"];
_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers;
_unit SVAR ["Revive",FALSE,TRUE];
_unit SVAR["DeclaredDead",nil,true];
_unit SVAR ["realname",profileName,TRUE];
_unit SVAR ["restrained",FALSE,TRUE];
_unit SVAR ["Escorting",FALSE,TRUE];
_unit SVAR ["transporting",FALSE,TRUE];
_unit SVAR ["steam64id",steamid,true];
_unit addRating 1e12;
breakout "DeathLoop";
1 fadeSound 1;
player playMoveNow "amovppnemstpsraswrfldnon";
player setVariable ["tf_unable_to_use_radio", false];

//[] call life_fnc_setupActions;
if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),0)) then {player enableFatigue false;};
