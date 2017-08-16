#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];

if(!DarfEinzahlen) exitWith {};
if(DarfEinzahlen) then {
	DarfEinzahlen = false;
	[] spawn {
		sleep 1;
		DarfEinzahlen = true;
	};
};

disableSerialization;
if(isNull Life_trunk_vehicle OR !alive Life_trunk_vehicle) exitWith {[localize "STR_MISC_VehDoesntExist",5,"gray"] call RPG_Fnc_Msg;};
if(!alive player) exitwith {closeDialog 0;};

if((lbCurSel 3502) == -1) exitWith {[localize "STR_Global_NoSelection",5,"gray"] call RPG_Fnc_Msg;};
_ctrl = ctrlSelData(3502);
_config = configName (missionConfigFile >> "VirtualItems" >> _ctrl);
_num2 = getNumber(missionConfigFile >> "VirtualItems" >> _config  >> "weight");
_num1 = (floor (((Life_maxWeight) - (Life_carryWeight)) / _num2));
_num = if (_num1 <= ((((Life_trunk_vehicle getVariable "Trunk") select 0) select (lbCurSel 3502)) select 1)) then {_num1}else{((((Life_trunk_vehicle getVariable "Trunk") select 0) select (lbCurSel 3502)) select 1)};
if(_num < 1) exitWith {[localize "STR_NOTF_InvFull",5,"gray"] call RPG_Fnc_Msg;};

_index = [_ctrl,((Life_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
_data = (Life_trunk_vehicle getVariable "Trunk") select 0;
_old = Life_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {[localize "STR_MISC_NotEnough",5,"gray"] call RPG_Fnc_Msg;};
_num = [_ctrl,_num,Life_carryWeight,Life_maxWeight] call Life_fnc_calWeightDiff;
if(_num == 0) exitWith {[localize "STR_NOTF_InvFull",5,"gray"] call RPG_Fnc_Msg;};
_weight = ([_ctrl] call Life_fnc_itemWeight) * _num;
if(_ctrl == "money") then {
	if(_num == _value) then {
		_data set[_index,-1];
		_data = _data - [-1];
	} else {
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	Life_cash = Life_cash + _num;
	Life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[Life_trunk_vehicle] call Life_fnc_vehInventory;
} else {
	if([true,_ctrl,_num] call Life_fnc_handleInv) then {
		if(_num == _value) then {
			_data set[_index,-1];
			_data = _data - [-1];
		} else {
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		Life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[Life_trunk_vehicle] call Life_fnc_vehInventory;
	} else {
		[localize "STR_NOTF_InvFull",5,"gray"] call RPG_Fnc_Msg;
	};
};