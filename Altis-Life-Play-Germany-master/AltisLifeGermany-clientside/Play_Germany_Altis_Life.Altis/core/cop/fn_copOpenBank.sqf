/*
	file: fn_copOpenBank.sqf

	Author: Play Germany, RafiQuak

	Description:
	Allows cops to (re)open the doors at the federal reserve bank.
	Created because of some very incompetent cops ;)
*/
private["_house","_door"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_door = [_house] call life_fnc_nearestDoor;

if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"};
if((_house getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

_house animate [format["door_%1_rot",_door],1];
_house animate [format["door_%1a_move",_door],1];
_house animate [format["door_%1b_move",_door],1];

_house setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.