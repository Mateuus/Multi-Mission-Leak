 
 
 
 
 
 
 
private["_uid"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
if(_uid == "") exitWith {}; 
 
_index = [_uid,life_wanted_list] call TON_fnc_index; 
 
if(_index != -1) then 
{ 
life_wanted_list set[_index,-1]; 
life_wanted_list = life_wanted_list - [-1]; 
 
}; 
diag_log format["WANTED_LIST = %1", life_wanted_list]; 
_wantedlist = [life_wanted_list] call DB_fnc_mresArray; 
_query = format["UPDATE wanted set list = '%1'", _wantedlist]; 
waitUntil {sleep (random 0.3); !DB_Async_Active};_queryResult = [_query,1] call DB_fnc_asyncCall;