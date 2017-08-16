#include "..\..\macros.hpp"
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	Modifyed by: MarkusSR1984

	Description:
	Master handling for processing an item.
*/
#include "..\..\macros.hpp"

private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error","_sleeptimer",
"_unit","_v", "_target", "_val", "_data", "_index", "_index2", "_indexnew", "_weight", "_itemWeight", "_2var","_num","_num2","_flag"];

_target = param [0,0,[0]];
//Error check

closeDialog 0;


_vendor = DWEV_process_vendor;
_type = DWEV_process_type;

if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};
if ((vehicle player) != player) exitWith { hint "Du kannst nicht aus dem Fahrzeug heraus arbeiten." };
if (side player == west) exitWith {hint "Du bist kein Zivilist."};

_v = false;
if(_target == 0) then {
	if ((lbCurSel IDC_PROCESS_VEHICLESELECTION_LIST) < 0) exitWith {hint "Du musst ein Fahrzeug auswaehlen um den Inhalt zu verarbeiten";};
	DWEV_process_vehicle = (DWEV_process_vehicles select (lbCurSel IDC_PROCESS_VEHICLESELECTION_LIST));
	DWEV_trunk_vehicle = DWEV_process_vehicle;
	_v = true; 
} else {
	DWEV_process_vehicle = player;
	_v = false;
};

if(DWEV_process_vehicle getVariable ["trunk_in_use",false] && (_target == 0)) exitWith 
{
	_unlockTime = (( DWEV_process_vehicle getVariable ["last_trunk_in_use_time",0]) - (serverTime - (30 * 60)));
	hint format ["Der Kofferraum ist in gebrauch, er kann nur von einer Person zur gleichen Zeit genutzt werden.\n\n Sollte dies eine Fehlannahme sein, kannst du deinen Kofferraum in %1 Minuten wieder öffnen",([_unlockTime] call DWEV_fnc_formatTime)];
};

if(_v) then {
	[DWEV_process_vehicle,"trunk_in_use",true,true] remoteExecCall ["DWF_fnc_setObjVar",2];
	[DWEV_process_vehicle,"last_trunk_in_use_time",serverTime,true] remoteExecCall ["DWF_fnc_setObjVar",2];
};

_unit = DWEV_process_vehicle;

_error = false;

_oldVal = -1;
_oldVal2 = -1;
//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ...",processing 2Items?, (only for processing with 2) second Item.
_itemInfo = [_type] call DWEV_fnc_processCfg;

//Error checking
if(count _itemInfo == 0) exitWith { if(_v) then { [_unit,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2]; }; };

//Setup vars.
_2var = _itemInfo select 4;
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

//2vars
if(_2var) then { _oldItem2 = _itemInfo select 5; };

if (_type in ["uranium1","uranium2","uranium3","uranium4"]) then {_type = "uranium"};

_flag = M_CONFIG(getText,"Licenses",_type,"var");
_hasLicense = LICENSE_VALUE(_type,_flag);

_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");

_data = [];
if(_v) then { //TODO: Vehicle inv Anzahl
	_old = _unit getVariable "Trunk";
	_data = (_unit getVariable "Trunk") select 0;
	_index = [_oldItem,((_unit getVariable "Trunk") select 0)] call DWF_fnc_index;
	if(_index == -1) exitWith { _error = true; };
	_oldVal = _data select _index select 1;
	if(_2var) then { 
		_index2 = [_oldItem2,((_unit getVariable "Trunk") select 0)] call DWF_fnc_index;
		if(_index2 == -1) exitWith { _error = true; };
		_oldVal2 = _data select _index2 select 1;
	};
} else
{
	_oldVal = ITEM_VALUE(_oldItem);
	if(_2var) then
	{ 
		_oldVal2 = ITEM_VALUE(_oldItem2);
	};
};

if(_2var) then {
	if(_oldVal2 == 0) exitWith { _error = true; };
    if(_oldVal >_oldVal2) then {
    	_oldVal = _oldVal2;
    };
	if(_oldVal <_oldVal2) then {
    	_oldVal2 = _oldVal;
	};
};
if(!_2var) then {if (_oldVal == 0) exitWith { _error = true; };};

if(_error) exitWith{	
	[_unit,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2];
	hint "Du besitzt nicht die nötigen Rohstoffe!"; 
};

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith { if(_v) then { [_unit,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2]; }; };

//Setup our progress bar.
disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNameSpace getVariable "DWEV_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2...","%",_upp];
_progress progressSetPosition 0.00;
_cP = 0.00;
_weight = 1;
_weight = [_oldItem] call DWEV_fnc_itemWeight;
_sleeptimer = 0.05 * _weight;
switch (__GETC__(DWEV_donator)) do {
	case 1: {_sleeptimer = 0.045 * _weight;}; //10% schneller
	case 2: {_sleeptimer = 0.04  * _weight;}; //20% schneller
	case 3: {_sleeptimer = 0.035 * _weight;}; //30% schneller
	case 4: {_sleeptimer = 0.025 * _weight;}; //50% schneller
	default {_sleeptimer = 0.05  * _weight;}; //0% - Standard Wert
};

if (!isNil "DWEV_var_alcoholLevel") then 
{
	if ((DWEV_var_alcoholLevel > 0) && (DWEV_var_alcoholLevel <= 0.5)) then {_sleeptimer = (_sleeptimer * 0.8)}; //20% schneller
	if ((DWEV_var_alcoholLevel > 0.5) && (DWEV_var_alcoholLevel <= 1)) then {_sleeptimer = (_sleeptimer * 0.7)}; //30% schneller
	if ((DWEV_var_alcoholLevel > 1) && (DWEV_var_alcoholLevel <= 2)) then {_sleeptimer = (_sleeptimer * 0.5)};//50% schneller
};

if (!isNil "DWEV_var_traubenzucker") then 
{
	if (DWEV_var_traubenzucker == 1) then {_sleeptimer = (_sleeptimer * 0.85)};	//15% schneller
	if (DWEV_var_traubenzucker == 2) then {_sleeptimer = (_sleeptimer * 0.8)};	//20% schneller
	if (DWEV_var_traubenzucker == 3) then {_sleeptimer = (_sleeptimer * 0.75)};	//25% schneller
	if (DWEV_var_traubenzucker == 4) then {_sleeptimer = (_sleeptimer * 0.7)};	//30% schneller
	if (DWEV_var_traubenzucker == 5) then {_sleeptimer = (_sleeptimer * 0.6)};	//40% schneller
	if (DWEV_var_traubenzucker == 6) then {_sleeptimer = (_sleeptimer * 0.5)};	//50% schneller
};

	
DWEV_is_processing = true;
_counter = 0;
_progress_percent = 100 / _oldVal;
 if(_hasLicense) then
{
	_cost = 0;
};
if((dwf_cash < _cost) && !_hasLicense) exitWith {hint format["Du brauchst %1€ um ohne eine Lizenz zu arbeiten!",[_cost] call DWEV_fnc_numberText]; 5 cutText ["","PLAIN"]; DWEV_is_processing = false; if(_v) then { [_unit,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2]; }; };
while{true} do
{
	sleep _sleeptimer;
	_counter = _counter + 0.1;
	_progress progressSetPosition _progress_percent * _counter / 100;
	_pgText ctrlSetText format["%3 (%1 von %2)...",round(_counter),_oldVal,_upp];
	if(_counter >= _oldVal) exitWith {};
	if(player distance _vendor > 10) exitWith {};
	if(_v) then {
		if(_unit distance _vendor > 10) exitWith {};
	  };
};

if((player distance _vendor > 10) OR (_unit distance _vendor > 12)) exitWith {hint "Du musst innerhalb von 10m bleiben."; 5 cutText ["","PLAIN"]; DWEV_is_processing = false; if(_v) then { [_unit,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2]; }; };
if((dwf_cash < _cost) && !_hasLicense) exitWith { hint format["Du brauchst %1€ um ohne eine Lizenz zu arbeiten!",[_cost] call DWEV_fnc_numberText]; 5 cutText ["","PLAIN"]; DWEV_is_processing = false; if(_v) then { [_unit,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2]; }; };
if(_v) then { 
	_old = _unit getVariable "Trunk";
	_data = (_unit getVariable "Trunk") select 0;
	_weight = ([_oldItem] call DWEV_fnc_itemWeight) * _oldVal;
	_weight2 = 0;
	_itemWeight = ([_newItem] call DWEV_fnc_itemWeight) * _oldVal;

	_num = _data select _index select 1;
	if(_num == _oldVal) then {
		_data set[_index,-1];
		_data = _data - [-1];
	} else {
		_data set[_index,[_oldItem,(_num - _oldVal)]];
	};
	if(_2var) then {
		_weight2 = ([_oldItem2] call DWEV_fnc_itemWeight) * _oldVal2;

		_num2 = _data select _index2 select 1;
		if(_num2 == _oldVal2) then {
			_data set[_index2,-1];
			_data = _data - [-1];
		} else {
			_data set[_index2,[_oldItem2,(_num2 - _oldVal2)]];
		};			
	};
	_indexnew = [_newItem,_data] call DWF_fnc_index;
	if(_indexnew == -1) then {
		_data pushBack [_newItem,_oldVal];
	} else {
		_val = _data select _indexnew select 1;
		_data set[_indexnew,[_newItem,_val + _oldVal]];
	};

	_unit setVariable["Trunk",[_data,(_old select 1) + _itemWeight - _weight - _weight2],true];

	[_unit,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2];
} else {
	//2vars
	if(_2var) then {
		if(!([false,_oldItem2,_oldVal2] call DWEV_fnc_handlelnv)) exitWith { 5 cutText ["","PLAIN"]; DWEV_is_processing = false; }; 
	};
	if(!([false,_oldItem,_oldVal] call DWEV_fnc_handlelnv)) exitWith { 
		5 cutText ["","PLAIN"]; 
		DWEV_is_processing = false; 
		if(_2var) then {
			([true,_oldItem2,_oldVal2] call DWEV_fnc_handlelnv); 
		}; 
	};
	if(!([true,_newItem,_oldVal] call DWEV_fnc_handlelnv)) exitWith {
		5 cutText ["","PLAIN"];
		[true,_oldItem,_oldVal] call DWEV_fnc_handlelnv; 
		if(_2var) then {
			([true,_oldItem2,_oldVal2] call DWEV_fnc_handlelnv); 
		};
		DWEV_is_processing = false;
	};
};
5 cutText ["","PLAIN"];
if(_hasLicense) then {
	titleText[format["Du hast nun %1 %2 hergestellt.",_oldVal,_itemName],"PLAIN"];
} else {
	titleText[format["Du hast nun %1 %2 hergestellt für %3€ .",_oldVal,_itemName,[_cost] call DWEV_fnc_numberText],"PLAIN"];
	dwf_cash = dwf_cash - _cost;
};
DWEV_is_processing = false;