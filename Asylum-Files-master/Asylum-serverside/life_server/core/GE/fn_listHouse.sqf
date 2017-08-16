 
 
 
 
 
_id = param [0]; 
_house = param [1]; 
_val = param[2]; 
_pos = getPos _house; 
_query = format["UPDATE asylumlife%1.houses SET sale='%2' WHERE worldspace='%3' OR id='%4'",life_server_instance,_val,_pos,_house getVariable ["houseId", -1]]; 
 
[_query,1] call DB_fnc_asyncQuery;