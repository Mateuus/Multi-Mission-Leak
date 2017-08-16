 
 
 
 
 
 
 
_ownerID = _this select 0; 
_query = "SELECT name, kennzeichen FROM players WHERE kennzeichen != ''"; 
 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
[_queryResult] remoteExecCall ["SOCK_fnc_kennzeichen",_ownerID];