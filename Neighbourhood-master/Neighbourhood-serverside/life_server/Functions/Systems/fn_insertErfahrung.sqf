 
 
 
 
 
 
 
private["_uid","_type","_query","_sql"]; 
 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_type = [_this,1,"",[""]] call BIS_fnc_param; 
_query = format["UPDATE players SET erfahrung = erfahrung + %2 WHERE playerid=%1",_uid,_type]; 
 
waitUntil {!DB_Async_Active}; 
_thread = [_query,false] spawn DB_fnc_asyncCall; 
waitUntil {scriptDone _thread}; 
 
