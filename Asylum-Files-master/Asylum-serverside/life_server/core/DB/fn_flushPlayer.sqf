 
 
 
 
 
 
 
 
private ["_uid","_i","_data"]; 
 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_data = []; 
 
if (_uid == "") exitWith {};  
 
_i = -1; 
{ 
if (typeName _x == "ARRAY") then 
{ 
if (_x select 0 == _uid) then 
{ 
_data = _x select 1; 
_i = _forEachIndex; 
}; 
}; 
} forEach life_update_buffer; 
 
if (_i < 0 || count _data < 1) exitWith {};  
 
life_update_buffer set [_i, -1]; 
life_update_buffer = life_update_buffer - [-1]; 
 
_data spawn DB_fnc_update;