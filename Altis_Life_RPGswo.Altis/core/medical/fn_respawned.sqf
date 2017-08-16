#include "..\..\macros.hpp"
/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
DWEV_use_atm = TRUE;
DWEV_hunger = 100;
DWEV_thirst = 100;
DWEV_carryWeight = 0;
dwf_cash = 0;
DWEV_respawned = false;
player playMove "amovpercmstpsnonwnondnon";


[getPlayerUID player,0, side player] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen	
if (isNil "DWEV_playerRespawned") then {DWEV_playerRespawned = true;};
if (isNil "DWEV_playerDeathTime") then {DWEV_playerDeathTime = serverTime;};

if (!DWEV_playerRespawned && ((side player) != independent)) then // NLR Marker setzen
{
		[false,DWEV_playerDeathPos,DWEV_playerDeathTime] spawn DWEV_fnc_nlrMarker;
};
 

DWEV_corpse setVariable["Revive",nil,TRUE];
DWEV_corpse setVariable["name",nil,TRUE];
DWEV_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new life'
switch((side player)) do
{
	case west: 		{ [] call DWEV_fnc_copLoadout; };
	case civilian: 	{ [] call DWEV_fnc_civLoadout; };
	case independent: { [] call DWEV_fnc_medicLoadout; };
	case east: { [] call DWEV_fnc_opforLoadout; };
};

if(!isNull DWEV_corpse) then 
{
	private["_containers"];
	DWEV_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[DWEV_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers;
	//hideBody DWEV_corpse;
	deleteVehicle DWEV_corpse;
	DWEV_corpse = Nil;
};

DWEV_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy DWEV_deathCamera;

if(DWEV_is_arrested) exitWith 
{
//	hint "Restliche Zeit absitzen.";
	DWEV_is_arrested = false;
	[player,TRUE] spawn DWEV_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

if(DWEV_removeWanted) then 
{
	[getPlayerUID player] remoteExec ["DWEV_fnc_wantedRemove",2];
};

[] call SOCK_fnc_updateRequest;