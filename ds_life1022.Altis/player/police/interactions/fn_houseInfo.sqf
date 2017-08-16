/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Stops escorting target
*/

private ["_house","_owner"];


_house = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _house) exitWith {};

_owner = _house getVariable["house_owner",[]];

hint "Searching Database For Owner Details...";
sleep 3;

if(_owner isEqualTo [])exitWith
	{
	hint "There is no information on record about the owner of this property";
	};

_ownersName = _owner select 1;
hint format ["This house is owned by %1. If this person is wanted this house may be raided",_ownersName];
systemchat format ["This house is owned by %1. If this person is wanted this house may be raided",_ownersName];