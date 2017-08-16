/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens or closes the closest house door to a player
*/

private ["_door","_doors","_locked"];

params [["_house",objNull,[objNull]]];

if(isNull _house)exitWith{};
if(!(_house isKindOf "House_F"))exitWith{};

_door = 0;
_doors = getNumber (configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");

for "_i" from 1 to _doors do {
	_selectionPos = _house selectionPosition format ["Door_%1_trigger",_i];
	_worldSpace = _house modelToWorld _selectionPos;
	if(player distance _worldSpace < 2.4)exitWith{_door = _i};
};

if(_door isEqualTo 0)exitWith{};

_locked = _house getVariable [format ["bis_disabled_door_%1",_door],0];

if(_locked isEqualTo 0)then {
	_house setVariable [format ["bis_disabled_door_%1",_door],1,true];
	_house animateSource [format ["Door_%1_sound_source",_door],0];
	systemChat "Door locked";
} else {
	_house setVariable [format ["bis_disabled_door_%1",_door],0,true];
	_house animateSource [format ["Door_%1_sound_source",_door],1];
	systemChat "Door unlocked";
};