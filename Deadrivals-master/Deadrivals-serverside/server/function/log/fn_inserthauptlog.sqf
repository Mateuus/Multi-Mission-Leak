private["_uid","_mode","_bangrund","_query"]; 
_logname = [_this,0,"",[""]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_logarray = _this select 2; 
_name = [_this,3,"",[""]] call BIS_fnc_param; 
 
_query = format["INSERT INTO hauptlog SET logname = '%1', playerid = '%2', logtext = '%3', playername = '%4'",_logname,_uid,_logarray,_name]; 
[_query,1] call SERVERDATABASE_fnc_asyncCall;