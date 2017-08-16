#include "..\..\macros.hpp"
/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = param [0,"Unknown Medic",[""]];
_reviveCost = DWEV_SETTINGS(getNumber,"revive_fee");

[DWEV_save_gear] spawn DWEV_fnc_loadDeadGear;
DWEV_corpse setVariable["realname",nil,true];
[DWEV_corpse] remoteExec ["DWEV_fnc_corpse",-2];
_dir = getDir DWEV_corpse;
hint format["%1 hat dich wiederbelebt und eine Gebühr von %2€ wurde dir von deinem Bankkonto abgebucht.",_medic,[_reviveCost] call DWEV_fnc_numberText];
DWEV_carryWeight = 0;
closeDialog 0;
DWEV_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy DWEV_deathCamera;

[getPlayerUID player,0, side player] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen	

if(dwf_atmcash > _reviveCost) then 
{
	dwf_atmcash = dwf_atmcash - _reviveCost;
} 
else 
{
	dwf_atmcash = 0;
};

player setDir _dir;
player setPosASL (visiblePositionASL DWEV_corpse);
DWEV_corpse setVariable["Revive",nil,TRUE];
DWEV_corpse setVariable["name",nil,TRUE];

[DWEV_corpse] remoteExec ["DWEV_fnc_corpse",-2];

deleteVehicle DWEV_corpse;
DWEV_corpse = Nil;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[player, uniform player] call DWEV_fnc_equipTextures;
[player, backpack player] call DWEV_fnc_equipTextures;
//[3] call SOCK_fnc_updatePartial; // wird beim tot schon gespeichert
//[6] call SOCK_fnc_updatePartial; // wird beim tot schon gespeichert