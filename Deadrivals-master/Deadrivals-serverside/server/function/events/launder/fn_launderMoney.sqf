private["_player", "_query", "_result"]; 
 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_money = [_this,2,0,[0]] call BIS_fnc_param; 
_time = [_this,3,0,[0]] call BIS_fnc_param; 
 
_query = format["INSERT INTO geldwasche SET player = '%1', value = '%2', remainingtime = '%3'",_uid,_money,_time]; 
[_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
[] remoteExecCall ["CLIENT_fnc_launderMoneycheck",_player];