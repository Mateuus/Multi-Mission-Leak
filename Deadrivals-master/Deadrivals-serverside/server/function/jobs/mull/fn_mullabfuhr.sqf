private["_query","_houses","_query2"]; 
 
_id = _this select 0; 
 
_query = format ["UPDATE mullabfuhr SET aktiv = '%1', remainingtime = '%2' WHERE id = '%3'",0,10,_id]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
