 
 
 
 
 
 
 
 
private ["_uid","_i","_data","_alive"]; 
 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_alive = [_this,1,false,[false]] call BIS_fnc_param; 
_data = []; 
 
_i = -1; 
{ 
if (typeName _x == "ARRAY") then 
{ 
if (_x select 0 == _uid) then 
{ 
_data = _x select 1; 
_i = _forEachIndex; 
_data set[9, _alive]; 
}; 
}; 
} forEach life_update_buffer; 
 
if (_i < 0 || count _data < 1) exitWith {};  
 
life_update_buffer set [_i, [_uid, _data]];