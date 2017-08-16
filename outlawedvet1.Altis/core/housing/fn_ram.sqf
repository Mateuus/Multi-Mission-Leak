#include "..\..\script_macros.hpp"
/*
	Author: RPGforYOU
	Name: fn_ram.sqf
	
	Description:
	Allows swat to bang down the door?
*/
if(playerSide != west) exitWith { hint "You are not in Swat or the Army, so you have no idea what this item actually is!"};
if((FETCH_CONST(life_swatlevel) < 0) or (FETCH_CONST(life_armylevel) < 0)) exitWith { hint "You are not in Swat or the Army, so you have no idea what this item actually is!"};

private["_house","_door","_title","_titleText","_uid"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};

_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};

_door = [_house] call life_fnc_nearestDoor;
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"};
if((_house getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

_house animate [format["door_%1_rot",_door],1];
_house setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.

[0,"STR_RPG4YOU_ram",true,[(_house getVariable "house_owner") select 1]] remoteExecCall ["life_fnc_broadcast"];




