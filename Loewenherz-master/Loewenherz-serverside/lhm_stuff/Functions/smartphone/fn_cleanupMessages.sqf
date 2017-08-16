/* 
 
 file: fn_cleanupMessages.sqf 
 Author: Silex 
 
 Description: Deletes all messages that belongs to the given id. 
*/ 
 
private["_player","_query"]; 
_player = param [0,ObjNull,[objNull]]; 
 
if(isNull _player) exitWith {}; 
 
_query = format["DELETE FROM lhm_messages WHERE toID='%1'",getPlayerUID _player]; 
 
 
[_query,1] call DB_fnc_asyncCall; 
