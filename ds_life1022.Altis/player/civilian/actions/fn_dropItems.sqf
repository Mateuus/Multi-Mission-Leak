/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Called when a civilian dies to drop his gear on the ground
*/

private ["_overWater","_pos","_briefcase","_items","_value","_itemWeight","_money","_tempNum"];

params ["_unit"];

_overWater = if(surfaceIsWater (getPos _unit))then{true}else{false};
_pos = _unit modelToWorld [0,3,0.1];
_items = [];

{
	_var = format ["DS_item_%1",_x];
	_value = missionNamespace getVariable _var;

	if(_value > 0)then {
		_items pushBack [_x,_value];
		missionNamespace setVariable [_var,0];
	};
} forEach DS_itemArray;

if(!(_items isEqualTo []))then {
	_briefcase = "Land_Suitcase_F" createVehicle [0,0,0];
	if(_overWater)then{_briefcase setPosASL _pos}else{_briefcase setPosATL _pos};

	_briefcase setVariable ["boot",[_items,0],true];
};

if(DS_coin > 0) then {
	if((DS_realEstateArray select 0) == 0)then {
		_money = "Land_Money_F" createVehicle [0,0,0];
		_money setVariable ["item",["money",DS_coin],true];
		if(_overWater)then{_money setPosASL _pos}else{_money setPosATL _pos};
		DS_coin = 0;
	} else {
		_tempNum = DS_realEstateArray select 0;
		_tempNum = _tempNum - 1;
		DS_realEstateArray set [0,_tempNum];
	};
};