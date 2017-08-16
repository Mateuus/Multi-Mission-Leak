/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Called when a civilian dies to drop his gear on the ground
*/
private["_obj","_unit","_item","_value"];
_unit = _this select 0;

{
	_item = _x;
	_value = missionNamespace getVariable _item;
	
	switch(_item) do
	{
		case "DS_item_water":
		{
			if(_value > 0) then
			{
				_var = [_item,"DS_item_",""] call KRON_Replace;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
			};
		};
		
		case "DS_item_tbacon":
		{
			if(_value > 0) then
			{
				_var = [_item,"DS_item_",""] call KRON_Replace;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_TacticalBacon_F" createVehicle _pos;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
			};
		};
		
		case "DS_item_fuelF":
		{
			if(_value > 0) then
			{
				_var = [_item,"DS_item_",""] call KRON_Replace;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
			};
		};
		
		case "DS_item_coffee":
		{
			if (_value > 0) then
			{
				_var = [_item,"DS_item_",""] call KRON_Replace;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
			};
		};
		
		default
		{
			if(_value > 0) then
			{
				_var = [_item,"DS_item_",""] call KRON_Replace;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Suitcase_F" createVehicle _pos;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
			};
		};
	};
} foreach DS_itemArray;

if(DS_coin > 0) then
	{
	if((DS_realEstateArray select 0) == 0)then
		{
		_pos = _unit modelToWorld[0,3,0];
		_pos = [_pos select 0, _pos select 1, 0];
		_obj = "Land_Money_F" createVehicle _pos;
		_obj setVariable["item",["money",DS_coin],true];
		_obj setPos _pos;
		DS_coin = 0;
		}
		else
		{
		_tempNum = DS_realEstateArray select 0;
		_tempNum = _tempNum - 1;
		DS_realEstateArray set [0,_tempNum];
		};
	};
{
	missionNamespace setVariable[_x,0];
}forEach DS_itemArray;

[] call DS_fnc_compileData;