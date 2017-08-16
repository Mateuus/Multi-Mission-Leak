/* 
 File: fn_wantedPerson.sqf 
*/ 
private["_unit","_index"]; 
_unit = param[0,ObjNull,[ObjNull]]; 
if(isNull _unit) exitWith {[]}; 
_index = [_unit getVariable["aOsyc",name _unit],tFHiSiX] call zero_fnc_oKzQhZKu; 
if(_index != -1) then { 
 tFHiSiX select _index; 
}else{ 
 []; 
}; 
