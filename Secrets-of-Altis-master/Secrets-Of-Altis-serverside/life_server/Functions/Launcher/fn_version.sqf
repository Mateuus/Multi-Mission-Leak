 
 
 
 
 
 
 
_ownerID = _this select 0; 
_query = "SELECT version, spenden FROM launcher"; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
_queryResult remoteExecCall ["SOCK_fnc_launcherVersion",_ownerID];