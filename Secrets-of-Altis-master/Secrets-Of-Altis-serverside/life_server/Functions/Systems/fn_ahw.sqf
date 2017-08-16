private["_selected"]; 
 
_mode = _this select 0; 
 
{ 
if(isnull (_x select 2)) then {ahw_all deleteAt _forEachIndex}; 
} foreach ahw_all; 
 
switch(_mode) do { 
 
 
case 0:  
{ 
_selected = (_this select 1); 
if(isnil "_selected") exitWith {}; 
 
_id = (_selected select 0); 
 
{ 
if((_x select 0) isEqualTo _id) exitWith {ahw_all set [_forEachIndex,[_x select 0,_x select 1,_x select 2,_x select 3,_x select 4,_this select 2,_x select 5]]}; 
} foreach ahw_all; 
}; 
 
 
case 1:  
{ 
_selected = (_this select 1); 
if(isnil "_selected") exitWith {}; 
 
_id = (_selected select 0); 
 
{ 
if((_x select 0) isEqualTo _id) exitWith {ahw_all deleteAt _forEachIndex}; 
} foreach ahw_all; 
}; 
 
 
case 2:  
{ 
ahw_all pushBackUnique (_this select 1); 
}; 
}; 
 
publicVariable "ahw_all"; 
[0] remoteexeccall ["life_fnc_einsatzzentrale",independent];