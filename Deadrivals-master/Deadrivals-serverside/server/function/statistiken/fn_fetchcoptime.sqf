private["_query","_houses","_query2"]; 
 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
_queryResult = "SELECT time FROM West ORDER by time DESC LIMIT 0,30"; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _queryResult == 0) exitWith {}; 
[_queryResult] remoteExec ["CLIENT_fnc_coptimeInfo",_player]; 
 
 
 
