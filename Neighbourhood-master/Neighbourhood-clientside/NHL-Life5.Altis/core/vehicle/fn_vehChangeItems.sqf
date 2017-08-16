#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItems.sqf
	Edit: Don Richter

	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_ctrl2","_num2","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_data","_old","_value","_weight","_diff","_calls", "_errorPut", "_errorTake","_max","_maxOther","_absolteMax","_Truck","_FuelTrucks","_FuelStuff"];
disableSerialization;

_ctrl = ctrlSelData(3503); //own Inv Select
_ctrl2 = ctrlSelData(3502); //Vehicle Select
//öl change disabled
_Truck = TypeOf life_trunk_vehicle;
_FuelTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","Box_IND_Grenades_F","B_supplyCrate_F","Box_IND_AmmoVeh_F"];
_num = 1;
_num2 = 1;
//if(_num < 1 || _num2 < 1) exitWith {hint "You can't enter anything below 1!";};
if(_ctrl == "" && _ctrl2 == "" ) exitWith {hint "Keine Items selected";};
if(_ctrl == _ctrl2 ) exitWith {hint "Identische Items nicht tauschbar";};
if((_ctrl == "goldbar" || _ctrl2 == "goldbar") && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Gold nicht im Helicopter wechselbar!"};
if(_ctrl == "money" || _ctrl2 == "money") exitWith {hint "Geld ist nicht wechselbar!";};
//öl change disabled
if(_ctrl == "oilu" || _ctrl2 == "oilu") exitWith {hint "Öl ist nicht wechselbar!";};
if(_ctrl == "oilp" || _ctrl2 == "oilp") exitWith {hint "Öl ist nicht wechselbar!";};
if(_ctrl == "oilu" || _ctrl2 == "oilp") exitWith {hint "Öl ist nicht wechselbar!";};
if(_ctrl == "oilp" || _ctrl2 == "oilu") exitWith {hint "Öl ist nicht wechselbar!";};
if(_Truck in _FuelTrucks) exitWith {hint "Wechsel für Tanklaster nicht aktiv!";};

_max = 0;
_maxOther = 0;
if (_ctrl != "") then {
	_max = missionNamespace getVariable ([_ctrl,0] call life_fnc_varHandle);
};
if (_ctrl2 != "") then {
	_data = (life_trunk_vehicle getVariable "Trunk") select 0;
	_index = [_ctrl2,_data] call TON_fnc_index;

	if (_index != -1) then {
		_maxOther = (_data select _index) select 1;
	};
};

if (_max > _maxOther) then {
	_absolteMax = _max;
}else {
	_absolteMax = _maxOther;
};

_calls = 0;
while {_calls < _absolteMax} do
{
	_errorPut = 0;
	_errorTake = 0;

	if (_max > _calls) then {
		if(life_trunk_vehicle isKindOf "House_F") then {
			if((typeOf life_trunk_vehicle) in ["Land_Cargo_House_V3_F"]) then
			{
				_mWeight = life_trunk_vehicle getVariable "slot";
				_veh_data = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
				_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
			}else {
				_mWeight = 0;
				{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
				_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
			};
		} else {
			_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
		};
		_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
		_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
		_inv = _veh_data select 0;


		if( ((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) then
		{
			_errorPut = 1;
			//exitWith {hint "The vehicle is either full or cannot hold that much.";};
		}
		else {
			// ####################################### Put  in Vehicle
			if(!([false,_ctrl,_num] call life_fnc_handleInv)) then
			{
				_errorPut = 2;
				//exitWith {hint "Items Changed.";};
			}
			else
			{
				_index = [_ctrl,_inv] call TON_fnc_index;
				if(_index == -1) then
				{
					_inv pushBack [_ctrl,_num];
				}
					else
				{
					_val = _inv select _index select 1;
					_inv set[_index,[_ctrl,_val + _num]];
				};

				life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],false];
			};
		};
	};


	if (_maxOther > _calls) then {
		// ######################################### TAKE from vehicle
		_index = [_ctrl2,((life_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
		_data = (life_trunk_vehicle getVariable "Trunk") select 0;
		_old = life_trunk_vehicle getVariable "Trunk";
		if(_index == -1) then {
			_errorTake = 1;
		}
		else {
			_value = _data select _index select 1;
			if(_num2 > _value) then
			{
				_errorTake = 2;
					//exitWith {hint localize "STR_MISC_NotEnough";};
			}
			else
			{
				_num2 = [_ctrl2,_num2,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
				if(_num2 <= 0) then
				{
					_errorTake = 3;
				//exitWith { hint localize "STR_NOTF_InvFull";};
				}
				else
				{
					_weight = ([_ctrl2] call life_fnc_itemWeight) * _num2;

					_data = (life_trunk_vehicle getVariable "Trunk") select 0;
					if([true,_ctrl2,_num2] call life_fnc_handleInv) then
					{
						if(_num2 == _value) then
						{
							_data set[_index,-1];
							_data = _data - [-1];
						}
							else
						{
							_data set[_index,[_ctrl2,(_value - _num2)]];
						};
						life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],false];
					}
						else
					{
						_errorTake = 4;
						//hint localize "STR_NOTF_InvFull";
					};
				};
			};
		};
		if (_errorPut > 0 && _errorTake > 0) then
		{
			_calls = 1000;

		};
	};
	_calls = _calls + 1;
};
_data = life_trunk_vehicle getVariable "Trunk";
life_trunk_vehicle setVariable["Trunk",_data,true];

[life_trunk_vehicle] call life_fnc_vehInventory;
hint "Wechsel abgeschlossen.";
