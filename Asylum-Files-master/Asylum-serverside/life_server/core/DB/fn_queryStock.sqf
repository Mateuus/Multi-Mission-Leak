 
 
 
 
 
 
 
private["_query","_result","_ret"]; 
 
_query = format["SELECT `className`,`quantity` FROM `asylumlife%1`.`itemstock`",life_server_instance]; 
 
life_price_index = [_query,2,true] call DB_fnc_asyncQuery; 
