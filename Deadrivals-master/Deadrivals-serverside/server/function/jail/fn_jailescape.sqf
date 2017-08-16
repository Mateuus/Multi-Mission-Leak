private["_jailtarget","_time","_grund","_ownerid","_query","_queryResult"]; 
disableSerialization; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
 
_query = format ["UPDATE jail SET jailtime = '0' WHERE playerid = '%1'",_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall;