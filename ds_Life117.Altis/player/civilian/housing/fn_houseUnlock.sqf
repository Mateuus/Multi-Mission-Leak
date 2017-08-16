/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Unlocks a door at a players house
*/
private ["_property","_doors","_door","_lockedState"];

_door = 0;
_property = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _property) then {_doors = 0};
if(!(_property isKindOf "House_F")) then {_doors = 0};
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _property) >> "numberOfDoors");
for "_i" from 1 to _doors do {
	_selectionPos = _property selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _property modelToWorld _selectionPos;
	if(player distance _worldSpace < 2.4) exitWith {_door = _i};
};

if(_door == 0)exitwith{};
_lockedState = _property getVariable [format["bis_disabled_door_%1",_door],0];
if(_lockedState == 0)then
	{
	_property setVariable[format["bis_disabled_door_%1",_door],1,true];
	_property animate [format["door_%1_rot",_door],0];
	systemchat "Door locked";
	}
	else
	{
	_property setVariable[format["bis_disabled_door_%1",_door],0,true];
	_property animate [format["door_%1_rot",_door],1];
	systemchat "Door unlocked";
	};
	
	












