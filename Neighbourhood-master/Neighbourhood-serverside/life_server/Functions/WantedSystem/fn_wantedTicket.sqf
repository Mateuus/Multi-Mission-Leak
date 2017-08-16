 
 
 
 
 
 
 
private["_price","_uid","_ind","_entry"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_price = [_this,1,0,[0]] call BIS_fnc_param; 
if(_uid == "" OR _price == 0) exitWith {}; 
 
_ind = [_uid,life_wanted_list] call TON_fnc_index; 
if(_ind == -1) exitWith {}; 
life_wanted_list set[_ind,-1]; 
life_wanted_list = life_wanted_list - [-1]; 
 
diag_log format["WANTED_LIST = %1", life_wanted_list]; 
_wantedlist = [life_wanted_list] call DB_fnc_mresArray; 
_query = format["UPDATE wanted set list = '%1'", _wantedlist]; 
waitUntil {sleep (random 0.3); !DB_Async_Active}; 
_queryResult = [_query,1] call DB_fnc_asyncCall;