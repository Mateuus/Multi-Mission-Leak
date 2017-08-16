/* 
    File: fn_queryPlayerGang 
    Author: Dirk Pitt 
    Zero-One Altis Life 
*/ 
private ["_query","_gang"]; 
_query = format["queryGang:%2%1%2",_this,"%"]; 
_gang = [_query,2,true] call zero_fnc_asyncCall; 
 
if(_gang isEqualTo []) exitWith {diag_log format["queryPlayerGang %1 no result",_this]}; 
missionNamespace setVariable[format["gang_%1",_this],_gang]; 
