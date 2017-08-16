private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount","_tmp","_id"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_owned = true; 
 
_CreateFabrik = format["UPDATE fabrik SET owned = '%1' WHERE playerid = '%2'",_owned,_uid]; 
_queryResult = [_CreateFabrik,1] call SERVERDATABASE_fnc_asyncCall; 
