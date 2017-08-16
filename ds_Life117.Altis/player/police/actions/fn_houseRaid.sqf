/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	For cops to unlock a players house
	*/
private["_door","_property","_sleep"];

_door = 0;
_pos = (position player);
_sleep = 0.1;
_property = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _property) then {_doors = 0};
if(!(_property isKindOf "House_F")) then {_doors = 0};
if((player getVariable ["policeSquad",""]) == "Rapid Response")then{_sleep = 0.04;};
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _property) >> "numberOfDoors");

	_upp = "Forcing Locks";
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
			
	while{true} do
		{
		sleep _sleep;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(player distance _pos > 10)exitwith {};
		};
		
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	
DS_doingStuff = false;
if(player != vehicle player) exitWith {};	
if(player distance _pos > 10)exitwith {hint "You moved too far away"};

for "_i" from 1 to _doors do {
	_selectionPos = _property selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _property modelToWorld _selectionPos;
	if(player distance _worldSpace < 2.4) exitWith {_door = _i};
};
_property animate [format["door_%1_rot",_door],1];
_property setVariable[format["bis_disabled_Door_%1",_door],0,true];



