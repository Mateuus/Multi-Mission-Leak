/* 
 File: fn_wantedPardon.sqf 
*/ 
private["_name","_index"]; 
_name = param[0,"",[""]]; 
if(_name isEqualTo "") exitWith {}; 
_index = [_name,tFHiSiX] call zero_fnc_oKzQhZKu; 
if(_index != -1) then { 
 tFHiSiX deleteAt _index; 
}; 
