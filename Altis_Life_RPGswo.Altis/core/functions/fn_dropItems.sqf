#include "..\..\macros.hpp"
/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private ["_obj","_unit","_item","_value"];
_unit = _this select 0;

{
	if (_x isEqualType "") then {_item = _x;} else {_item = configName _x};
    _value = ITEM_VALUE(_item);
    _itemName = ITEM_VARNAME(_item);
	
	switch (_item) do
	{
		case "water":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [(_pos select 0),(_pos select 1),0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				[_obj] remoteExecCall ["DWEV_fnc_simDisable",2];
				_obj setPos _pos;
				_obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
			};
		};
		
		case "tbacon":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [(_pos select 0),(_pos select 1),0];
				_obj = "Land_TacticalBacon_F" createVehicle _pos;
				[_obj] remoteExecCall ["DWEV_fnc_simDisable",2];
				_obj setPos _pos;
				_obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
			};
		};
		
		case "redgull":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [(_pos select 0),(_pos select 1),0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				[_obj] remoteExecCall ["DWEV_fnc_simDisable",2];
				_obj setPos _pos;
				_obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
			};
		};
		
		case "redshot":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [(_pos select 0),(_pos select 1),0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				[_obj] remoteExecCall ["DWEV_fnc_simDisable",2];
				_obj setPos _pos;
				_obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
			};
		};
		
		case "fuelE":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [(_pos select 0),(_pos select 1),0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				[_obj] remoteExecCall ["DWEV_fnc_simDisable",2];
				_obj setPos _pos;
				_obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
			};
		};
		
		case "fuelF":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [(_pos select 0),(_pos select 1),0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				[_obj] remoteExecCall ["DWEV_fnc_simDisable",2];
				_obj setPos _pos;
				_obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
			};
		};
		
		case "coffee":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [(_pos select 0),(_pos select 1),0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				[_obj] remoteExecCall ["DWEV_fnc_simDisable",2];
				_obj setPos _pos;
				_obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
			};
		};
		
		case "dwf_cash":
		{
			if(dwf_cash > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [(_pos select 0),(_pos select 1),0];
				_obj = "Land_Money_F" createVehicle _pos;
				_obj setVariable ["item",["money",missionNamespace getVariable [_item,0]],true];
				_obj setPos _pos;
				[_obj] remoteExecCall ["DWEV_fnc_simDisable",2];
                missionNamespace setVariable ["dwf_cash",0];
			};
		};
		
		default
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [(_pos select 0),(_pos select 1),0];
				_obj = "Land_Suitcase_F" createVehicle _pos;
				[_obj] remoteExecCall ["DWEV_fnc_simDisable",2];
				_obj setPos _pos;
				_obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
			};
		};
	};
} forEach (("true" configClasses (missionConfigFile >> "VirtualItems")) + ["dwf_cash"]);