/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Sets up items from a build box
*/
private["_pos","_object"];

_pos = (position player);
closeDialog 0;
_object = (_this select 0) createVehicle [0,0,0];
_object attachTo[player,[0,2.5,0.7]];
_object allowDamage false;
if((_this select 0) == "Land_WoodenBox_F")then
	{
	_object setVariable ["buildBox",true,true];
	}
	else
	{
	_object setVariable ["buildItem",true,true];
	};

DS_spikeAction = player addAction["Place Object",{if(!isNull DS_spikestrip) then {detach DS_spikestrip; DS_spikestrip = ObjNull;}; player removeAction DS_spikeAction; DS_spikeAction = nil;},"",999,false,false,"",'!isNull DS_spikestrip'];
DS_spikestrip = _object;
waitUntil {isNull DS_spikestrip};
if(!isNil "DS_spikeAction") then {player removeAction DS_spikeAction;};
if(isNull _object) exitWith {DS_spikestrip = ObjNull;};
if((_this select 0) == "Land_PierLadder_F")then
	{
	//_object setPosAGLS [(getPos _object select 0),(getPos _object select 1),1.5];
	KK_fnc_setPosAGLS = 
		{
		params ["_obj", "_pos", "_offset"];
		_offset = _pos select 2;
		if (isNil "_offset") then {_offset = 0};
		_pos set [2, worldSize]; 
		_obj setPosASL _pos;
		_pos set [2, vectorMagnitude (_pos vectorDiff getPosVisual _obj) + _offset];
		_obj setPosASL _pos;
		};
	[_object, [(getPos _object select 0),(getPos _object select 1),1.5]] call KK_fnc_setPosAGLS;
	_object allowDamage true;
	}
	else
	{
	_object setPos [(getPos _object select 0),(getPos _object select 1),0];
	};

if((_this select 0) == "Land_WoodenBox_F")then
	{
	DS_keyRing pushBack _object;
	hint "Scroll on the box to interact with, first walk 10m away then return";
	};
if((_this select 0) == "C_Rubberboat")then
	{
	DS_keyRing pushBack _object;
	};
/*	
if((_this select 0) == "Land_Net_Fence_Gate_F")then
	{
	DS_keyRing pushBack _object;
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (_this select 0) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do {
			_object setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};
	};
*/
if(_object distance _pos > 25)exitWith	
	{
	deletevehicle _object;
	hint "You tried placing an item too far from the build box";
	};