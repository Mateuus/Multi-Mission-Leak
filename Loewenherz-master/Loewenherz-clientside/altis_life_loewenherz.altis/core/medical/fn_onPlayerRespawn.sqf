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
lhm_corpse = _corpse;

//Comment this code out if you want them to keep the weapon on the ground.
if (!LHM_VAR_PRUGE_START) then {
	private["_containers"];
	_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
};

//Set some vars on our new body.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["steam64ID",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable ["playerSurrender",false,true];
_unit setVariable["realname",profileName,true]; //Reset the players name.
_unit setVariable["missingOrgan",FALSE,TRUE]; //NEU!!!
_unit setVariable["hasOrgan",FALSE,TRUE]; // NEU!!!
_unit setVariable["lhm_finger",[true,true,true,true,true,true,true,true,true,true],TRUE]; //Neu cut Finger System

//Load our gear as a cop incase something horrible happens
if(playerSide != civilian) then {
	[] spawn lhm_fnc_loadGear;
};

_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

[] spawn lhm_fnc_setupActions;
[[_unit,lhm_sidechat,playerSide],"TON_fnc_managesc",false,false] call lhm_fnc_mp;
player enableFatigue (__GETC__(lhm_enableFatigue));