/*
	Author: Bryan "Tonic" Boardwine, Bloodwyn

	Description:
	Fetches the nearest door of the building the player is looking
	at.
*/
private ["_b","_doors","_door","_smallestdistance","_selPos","_worldSpace","_distance"];

_b = param [0,ObjNull,[ObjNull]];
_door = 0;

if(isNull _b) exitWith {hint "Fehler 1";};
if(!(_b isKindOf "House_F")) exitWith {hint "Fehler 2";};

_doors = 1;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _b) >> "NumberOfDoors");


//Find the nearest door
_smallestdistance=10;
for "_i" from 1 to _doors do {
	_selPos = _b selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _b modelToWorld _selPos;
	_distance=player distance _worldSpace;
		if(_distance < 4.5) then {
			if(_distance < _smallestdistance)then{
				_smallestdistance=_distance;
				_door = _i;
			};
		};
};

_door;
