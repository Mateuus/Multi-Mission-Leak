private["_pid","_side","_type","_unit","_dienst","_queryResult"]; 
_pid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param; 
_type = [_this,2,"",[""]] call BIS_fnc_param; 
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param; 
_dienst = [_this,4,"",[""]] call BIS_fnc_param; 
_unit = owner _unit; 
 
switch(_side) do { 
case west:{_side = "cop"}; 
case civilian: {_side = "civ"}; 
case independent: {if (_dienst == "MED") then {_side = "MED"} else {_side = "ABAC"};}; 
case east: {_side = "east"}; 
default {_side = "Error"}; 
}; 
 
_queryResult = format["SELECT id, side, classname, type, pid, alive, active, plate, color, impound, tuning, price, lagerraum FROM vehicles WHERE pid = '%1' AND alive = '1' AND active = '0' AND side = '%2' AND type = '%3' AND auction = '0'",_pid,_side,_type]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
if (count _queryResult == 0) exitwith { 
NOCRIS_GARAGE_REQUEST = []; 
_unit publicVariableClient "NOCRIS_GARAGE_REQUEST"; 
}; 
 
NOCRIS_GARAGE_REQUEST = _queryResult; 
_unit publicVariableClient "NOCRIS_GARAGE_REQUEST";