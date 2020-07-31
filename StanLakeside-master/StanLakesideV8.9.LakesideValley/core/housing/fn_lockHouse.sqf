/*
	
	
	Description:
	Unlocks / locks the house.
*/
private["_house"];
_house = param [0,ObjNull,[ObjNull]];
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

_state = _house getVariable["locked",true];
if(_state) then {
	_house setVariable["locked",false,true];
	[localize "STR_House_StorageUnlock", false] spawn domsg;
} else {
	_house setVariable["locked",true,true];
	[localize "STR_House_StorageLock", false] spawn domsg;
};