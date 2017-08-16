/*
	File: fn_updateDialog.sqf
	Author: Blackd0g
	
	Description:
	init the builder menu
*/

private ["_dialog", "_lb", "_objects", "_name", "_index", "_lbFilter", "_cfg", "_indexFilter","_GangBase","_nearGangBases"];
waitUntil {!(isNull (findDisplay 8800))};
disableSerialization;

_dialog = findDisplay 8800;
_lb = _dialog displayCtrl 8802;
_lbFilter = _dialog displayCtrl 8803;
_indexFilter = lbCurSel _lbFilter;
if(_indexFilter == -1) exitWith {hint "something went wrong."};

_nearGangBases = (nearestobjects [player, ["FlagCarrier"], LHM_VAR_GANGBASERANGE]);
if(!(count _nearGangBases > 0)) exitWith {
	["Du bist nicht nahe einer Basis", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
	closeDialog 0;
};
_GangBase = _nearGangBases select 0;

lbClear _lb;

_cfg = [] call build_fnc_config;
_objects = [(_cfg select _indexFilter)] call build_fnc_objects;

{
	Private ["_objectname","_class","_currentitem","_countexist","_numallowed"];
	_currentitem = _x;
	_class = _currentitem select 0;
	_numallowed = _currentitem select 7;
	_exist = (nearestobjects [(getPosATL _GangBase), [_class], LHM_VAR_GANGBASERANGE]);
	_name = getText(configFile >> "CfgVehicles" >> (_x select 0) >> "displayName");

	{
        if(_x getVariable["gangarea_id",-1] == -1) then {
            _exist = _exist - [_x];
        };
    } foreach _exist;
	_countexist = count _exist;
	
	_requirements = _currentitem select 8;
	_requirementsOk = true;
	{
		_req = _x;
		_reqclass = _req select 0;
		_reqamount = _req select 1;
		_existingamount = count (nearestobjects [(getPosATL _GangBase), [_reqclass], LHM_VAR_GANGBASERANGE]);
		if(_existingamount < _reqamount) then {
			_requirementsOk = false;
		};
		

	} foreach _requirements;
	
	if((_countexist < _numallowed) &&_requirementsOk) then {
		if(_name != "") then {
			_objectname = _name;
		} else {
			_objectname = _currentitem select 0;
		};	
		_index = _lb lbAdd format["[%2/%3] %1",_objectname,_countexist,_numallowed];
		_lb lbSetData [_index,str([(_currentitem select 0),true])];
		_lb lbSetValue [_index, (_currentitem select 1)];
		_dataOk = true;
	} else {
		if(_name != "") then {
			_objectname = _name;
		} else {
			_objectname = _currentitem select 0;
		};
		_index = _lb lbAdd format["[%2/%3] %1",_objectname,_countexist,_numallowed];
		_lb lbSetData [_index,str([(_currentitem select 0),false])];
		_lb lbSetValue [_index, (_currentitem select 1)];
		_lb lbSetColor [_index, [0.5, 0.5, 0.5, 0.5]];
	};
} forEach _objects;
