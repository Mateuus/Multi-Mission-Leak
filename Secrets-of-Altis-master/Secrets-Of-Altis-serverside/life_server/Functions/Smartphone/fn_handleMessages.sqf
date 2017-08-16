 
 
 
 
 
  
 
private["_msg","_to","_target","_player","_type"]; 
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_msg = [_this,1,"",[""]] call BIS_fnc_param; 
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
_type = [_this,3,-1] call BIS_fnc_param; 
 
switch(_type) do 
{ 
 
case 0: 
{ 
if(isNULL _target) exitWith {}; 
_to = call compile format["%1", _target]; 
[_msg,name _player,0] remoteExecCall ["SOA_fnc_clientMessage",_to]; 
 
private["_query","_pid","_toID"]; 
_pid = getPlayerUID _player; 
_toID = getPlayerUID _target; 
_msg = [_msg] call DB_fnc_mresString; 
_fromName = name _player; 
_toName = name _target; 
_query = format["INSERT INTO messages (fromID, toID, message, fromName, toName) VALUES('%1', '%2', '""%3""', '%4', '%5')",_pid,_toID,_msg,_fromName,_toName]; 
[_query,1] call DB_fnc_asyncCall; 
}; 
 
case 1: 
{  
[_msg,name _player,1] remoteExecCall ["SOA_fnc_clientMessage",west]; 
}; 
 
case 2: 
{  
[_msg,name _player,2] remoteExecCall ["SOA_fnc_clientMessage",0]; 
}; 
 
case 3: 
{  
[_msg,name _player,5] remoteExecCall ["SOA_fnc_clientMessage",independent]; 
}; 
 
case 4: 
{ 
_to = call compile format["%1", _target]; 
if(isNull _to) exitWith {}; 
 
[_msg,name _player,3] remoteExecCall ["SOA_fnc_clientMessage",_to]; 
}; 
 
case 5: 
{ 
[_msg,name _player,4] remoteExecCall ["SOA_fnc_clientMessage",0]; 
}; 
 
case 6: 
{  
[_msg,name _player,6] remoteExecCall ["SOA_fnc_clientMessage",independent]; 
}; 
 
case 7: 
{  
[_msg,name _player,7] remoteExecCall ["SOA_fnc_clientMessage",0]; 
}; 
 
case 8: 
{  
[_msg,name _player,8] remoteExecCall ["SOA_fnc_clientMessage",0]; 
}; 
 
case 9: 
{  
[_msg,name _player,9] remoteExecCall ["SOA_fnc_clientMessage",0]; 
}; 
 
case 10: 
{  
[_msg,name _player,10] remoteExecCall ["SOA_fnc_clientMessage",0]; 
}; 
 
case 11: 
{ 
[_msg,name _player,0] remoteExecCall ["SOA_fnc_clientMessage",_player]; 
 
private["_query","_pid","_toID"]; 
_pid = getPlayerUID _player; 
_msg = [_msg] call DB_fnc_mresString; 
_fromName = _target; 
_toName = name _player; 
_query = format["INSERT INTO messages (fromID, toID, message, fromName, toName) VALUES('%1', '%2', '""%3""', '%4', '%5')",_pid,_pid,_msg,_fromName,_toName]; 
[_query,1] call DB_fnc_asyncCall; 
}; 
};