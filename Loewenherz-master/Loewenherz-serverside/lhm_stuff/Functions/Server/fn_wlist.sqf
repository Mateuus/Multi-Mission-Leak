/* 
 
Filename: fn_wlist.sqf 
 
Author: Barney 
 
Ingame wlisting for admins, lvl 4 
 
*/ 
private["_query","_player","_queryResult"]; 
 
_query = param [0,"",[""]]; 
_player = param [1,ObjNull,[ObjNull]]; 
 
 
[_query,2] call DB_fnc_asyncCall; 
 
 
// fix for hint output 
[[_query], "lhm_fnc_showHint", _player, false] call lhm_fnc_mp;