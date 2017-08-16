#include "..\..\macros.hpp"
/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse","_containers"];
_unit = _this select 0;
_corpse = _this select 1;
DWEV_corpse = _corpse;

//Comment this code out if you want them to keep the weapon on the ground.
if ((side player) != civilian) then
{
	_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
};

//Set some vars on our new body.
pIayer = player;
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
_unit setVariable["missingOrgan",FALSE,TRUE];
_unit setVariable["hasOrgan",FALSE,TRUE];
_unit setVariable["steam64id",(getPlayerUID player),true];
_unit setVariable["realname",profileName,true];

[player, uniform player] call DWEV_fnc_equipTextures;
[player, backpack player] call DWEV_fnc_equipTextures;

_unit addRating 9999999999999999;
player playMoveNow "amovppnemstpsraswrfldnon";

[] call DWEV_fnc_setupActions;
[_unit,DWEV_sidechat,(side player)] remoteExec ["DWF_fnc_managesc",2];

if (__GETC__(DWEV_adminlevel) > 0) then //Ab E
{
	[player,true] remoteExec ["DWF_fnc_adminVonChannel",2];
};
player enableFatigue (__GETC__(DWEV_enableFatigue));

