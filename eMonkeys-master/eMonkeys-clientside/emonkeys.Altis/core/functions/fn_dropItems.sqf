/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit","_item","_value"];
_unit = _this select 0;

{
	_item = _x;
	_value = missionNamespace getVariable _item;
	
	switch(_item) do
	{
		case "EMonkeys_inv_water":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call EMonkeys_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				[[_obj],"EMonkeys_fnc_simDisable",nil,true] call EMonkeys_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "EMonkeys_inv_tbacon":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call EMonkeys_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_TacticalBacon_F" createVehicle _pos;
				[[_obj],"EMonkeys_fnc_simDisable",nil,true] call EMonkeys_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "EMonkeys_inv_redgull":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call EMonkeys_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				[[_obj],"EMonkeys_fnc_simDisable",nil,true] call EMonkeys_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "EMonkeys_inv_fuelE":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call EMonkeys_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				[[_obj],"EMonkeys_fnc_simDisable",nil,true] call EMonkeys_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "EMonkeys_inv_fuelF":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call EMonkeys_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				[[_obj],"EMonkeys_fnc_simDisable",nil,true] call EMonkeys_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "EMonkeys_inv_coffee":
		{
			if (_value > 0) then
			{
				_var = [_item,1] call EMonkeys_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				[[_obj],"EMonkeys_fnc_simDisable",nil,true] call EMonkeys_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "EMonkeys_c164":
		{
			if(EMonkeys_c164 > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Money_F" createVehicle _pos;
				_obj setVariable["item",["money",_value],true];
				_obj setPos _pos;
				[[_obj],"EMonkeys_fnc_simDisable",nil,true] call EMonkeys_fnc_mp;
				missionNamespace setVariable[_x,0];
			};
		};
		
		default
		{
			if(_value > 0) then
			{
				_var = [_item,1] call EMonkeys_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Suitcase_F" createVehicle _pos;
				[[_obj],"EMonkeys_fnc_simDisable",nil,true] call EMonkeys_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
	};
} foreach (EMonkeys_inv_items + ["EMonkeys_c164"]);