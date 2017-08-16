private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount","_tmp","_id"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_weighttoadd = _this select 1; 
 
_query = format ["UPDATE schliessfach SET inventory_weight = inventory_weight + '%1', upgrade_safe = upgrade_safe + '1' WHERE playerid = '%2'",_weighttoadd,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
