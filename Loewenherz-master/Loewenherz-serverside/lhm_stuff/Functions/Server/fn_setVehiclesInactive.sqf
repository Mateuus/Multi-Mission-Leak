Private ["_query"]; 
 
_query = format["UPDATE vehicles SET active='0' WHERE active='1'"]; 
 
[_query,false] spawn DB_fnc_asyncCall; 
diag_log "lhm Server: Setting all Vehicles to Inactive...";