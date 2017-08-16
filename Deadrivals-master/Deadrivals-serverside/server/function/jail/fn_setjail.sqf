private["_jailtarget","_time","_grund","_ownerid","_query","_queryResult"]; 
disableSerialization; 
_jailtarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_time = _this select 2; 
_grund = [_this,3,"",[""]] call BIS_fnc_param; 
_ownerid = owner _jailtarget; 
 
_query = format ["UPDATE jail SET jailtime = '%1',grund = '%2' WHERE playerid = '%3'",_time,_grund,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
[_time,_grund] remoteExec ["CLIENT_fnc_jail_setup",_ownerid];