#include "..\script_macros.hpp"
/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;
ES_corpse = _corpse;

ES_deathWeapons = [];
{
	ES_deathWeapons pushBack (weaponsItems _x);
	deleteVehicle _x;
} forEach nearestObjects [ES_corpse, ["WeaponHolderSimulated", "WeaponHolder","GroundWeaponHolder"], 20];

//Set some vars on our new body.
_unit setVariable ["restrained",FALSE,TRUE];
_unit setVariable ["Escorting",FALSE,TRUE];
_unit setVariable ["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable ["steam64id",getPlayerUID player,true]; //Reset the UID.
_unit setVariable ["realname",profileName,true]; //Reset the players name.
_unit setVariable["missingOrgan",FALSE,TRUE]; //I DONT KNOW WHY SOMETIMES THEY ARE CAPS or not
_unit setVariable["hasOrgan",FALSE,TRUE]; 

_unit addRating 1e12; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

[] call ES_fnc_setupActions;
[_unit,ES_sidechat,playerSide] remoteExec ["ES_fnc_managesc",2];
if(EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),0)) then {player enableFatigue false;};