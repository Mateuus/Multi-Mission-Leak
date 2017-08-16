/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up items from a building box
*/

private ["_pos","_distance","_object"];

params ["_item"];

closeDialog 0;

_pos = (position player);
_distance = if((player getVariable ["medic",false])||(player getVariable ["mechanic",false]))then{80}else{30};
_object = _item createVehicle [0,0,0];
_object attachTo [player,[0,2.5,0.7]];
_object allowDamage false;

if(_item isEqualTo "Land_WoodenBox_F")then {
	_object setVariable ["buildBox",true,true];
} else {
	if(playerSide isEqualTo civilian)then {
		_object setVariable ["buildItemCiv",true,true];
	} else {
		_object setVariable ["buildItem",true,true];
	};
};

_object setVariable ["name",(name player),true];
DS_spikeAction = player addAction ["Place Object",{if(!isNull DS_spikestrip)then{detach DS_spikestrip; DS_spikestrip = objNull;};player removeAction DS_spikeAction;DS_spikeAction = nil;},"",999,false,false,"",'!isNull DS_spikestrip'];
DS_spikestrip = _object;
waitUntil {isNull DS_spikestrip};
if(!isNil "DS_spikeAction")then{player removeAction DS_spikeAction;};
if(isNull _object)exitWith{DS_spikestrip = objNull;};

if(_item isEqualTo "Land_PierLadder_F")then {
	KK_fnc_setPosAGLS = {
		params ["_obj", "_pos", "_offset"];
		_offset = _pos select 2;
		if(isNil "_offset")then{_offset = 0};
		_pos set [2,worldSize];
		_obj setPosASL _pos;
		_pos set [2,vectorMagnitude (_pos vectorDiff getPosVisual _obj) + _offset];
		_obj setPosASL _pos;
	};

	[_object,[(getPos _object select 0),(getPos _object select 1),1.5]] call KK_fnc_setPosAGLS;
	_object allowDamage true;
} else {
	_object setPos [(getPos _object select 0),(getPos _object select 1),0];
};

if(_item isEqualTo "Land_WoodenBox_F")then {
	DS_keyRing pushBack _object;
	hint "Scroll on the box to interact with it";
};

if(_item isEqualTo "C_Rubberboat")then {
	DS_keyRing pushBack _object;
};

if(_item isEqualTo "Land_HBarrier_Big_F")then {
	hint "Reminder\n\nH Barriers are only allowed to be used on location during terrorist missions";
};

if(_object distance _pos > _distance)exitWith {
	deleteVehicle _object;
	hint "You tried placing an item too far from the building box";
};