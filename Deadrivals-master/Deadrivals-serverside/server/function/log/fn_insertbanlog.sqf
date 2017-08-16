private["_uid","_mode","_bangrund","_query"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_bangrund = [_this,1,"",[""]] call BIS_fnc_param; 
 
_query = format["INSERT INTO banlog SET playerid = '%1', bangrund = '%2'",_uid,_bangrund]; 
[_query,1] call SERVERDATABASE_fnc_asyncCall;