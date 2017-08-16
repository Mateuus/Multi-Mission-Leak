 
 
 
 
 
 
 
private["_query","_result","_ret","_pageNo"]; 
 
_pageNo = [_this,0,0,[0]] call BIS_fnc_param; 
 
_query = format["SELECT `oid`,`owners`,`worldspace`,`locked`,`id` FROM `asylumlife%2`.`houses` ORDER BY `oid` LIMIT %1,30", (_pageNo * 30),life_server_instance]; 
_ret = [_query,2,true] call DB_fnc_asyncQuery; 
 
_ret;