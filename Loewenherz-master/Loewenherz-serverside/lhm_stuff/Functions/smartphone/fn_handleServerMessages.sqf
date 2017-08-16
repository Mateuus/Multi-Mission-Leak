/* 
 Filename: fn_handleServerMessages.sqf 
 
 Description : allow the server to send a message through the Smartphone-System 
 
 Author: Blackd0g 
*/ 
private ["_toName","_msg","_fromName","_query","_pid","_toID"]; 
_toID = param [0,"",[""]]; 
_msg = param [1,"",[""]]; 
_fromName = param [2,"",[""]]; 
_toName = param [3,"",[""]]; 
 
_msg = [_msg] call DB_fnc_mresString; 
_fromID = format["%1",round random 1000000]; 
_query = format["INSERT INTO lhm_messages (fromID, toID, message, fromName, toName) VALUES('%1', '%2', '""%3""', '%4', '%5')",_fromID,_toID,_msg,_fromName,_toName]; 
 
[_query,1] call DB_fnc_asyncCall;