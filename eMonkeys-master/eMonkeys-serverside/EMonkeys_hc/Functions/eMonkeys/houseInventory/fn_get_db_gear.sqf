private ["_client","_house","_id","_query","_return"]; 
 
_client = _this select 0; 
_house = _this select 1; 
 
 
_query = format["SELECT waffen, magazine, items, uniform, vest, backpack, headgear FROM hausinventar WHERE name='%1'",_house]; 
 
 
_dbgear = [_query,2] call DB_fnc_asyncCall; 
 
 
 
[[_dbgear],"set_dbgear_array",_client] spawn EMonkeys_fnc_mp; 
 
 
 
