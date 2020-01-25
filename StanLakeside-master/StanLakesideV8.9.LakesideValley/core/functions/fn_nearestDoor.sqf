/*
	
	
	Description:
	Fetches the nearest door of the building the player is looking
	at.
*/
private["_house","_door","_numOfDoors"];
_house = param [0,ObjNull,[ObjNull]];
if(isNull _house) exitWith {0};
if(!(_house isKindOf "House_F")) exitWith {0};

_door = 0;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_i" from 1 to _doors do {
	_selectionPos = _house selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _house modelToWorld _selectionPos;
	if(player distance _worldSpace < 2.4) exitWith {_door = _i};
};

_door;
