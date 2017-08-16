/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit","_item","_value","_tmp"];
_unit = _this select 0;
_tmp = []; 

{
	_item = _x;
	_value = missionNamespace getVariable _item;
	
	switch(_item) do
	{
		case "life_beatgeld":
		{
			if(life_beatgeld > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Money_F" createVehicle _pos;
				_obj setVariable["item",["money",_value],true];
				_obj setPos _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				missionNamespace setVariable[_x,0];
			};
		};

		default
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_tmp pushBack [_var,_value];

				missionNamespace setVariable[_x,0];
			};
		};
	};
} foreach (life_inv_items + ["life_beatgeld"]);

if!(_tmp isEqualTo []) then 
{
	_pos = _unit modelToWorld[0,3,0];
	_pos = [_pos select 0, _pos select 1, 0];
	_obj = "Land_Suitcase_F" createVehicle _pos;
	_obj setPos _pos;
	[_obj] remoteExecCall ["life_fnc_simDisable",0];

	{
		_item = _x select 0; 
		_vInv = _obj getVariable ["Trunk",[[],0]];   
		_items = _vInv select 0;  
		_space = _vInv select 1;   
		_itemIndex = [_item,_items] call SOA_fnc_index;
		_weight = [_obj] call life_fnc_vehicleWeight;
		_sum = [_item,_x select 1,_weight select 1,_weight select 0] call life_fnc_calWeightDiff;  

		_itemWeight = ([_item] call life_fnc_itemWeight) * _sum;   
		if(_itemIndex == -1) then {
			_items pushBack [_item,_sum];  
		} else {   
			 _val = _items select _itemIndex select 1;    
			 _items set[_itemIndex,[_item,_val + _sum]];   
		};
		_obj setVariable["Trunk",[_items,_space + _itemWeight],true];
	} foreach _tmp;
};