 
 
 
 
 
 
 
private["_query","_result","_ret","_id"]; 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_invest = [_this,1,0,[0]] call BIS_fnc_param; 
_policy = [_this,2,"",[""]] call BIS_fnc_param; 
 
_policy = [_policy, '\', '\\'] call KRON_Replace; 
_policy = [_policy, "'", "\'"] call KRON_Replace; 
 
_query = format["INSERT INTO `asylumlife%4`.`candidates` (`playerid`,`policy`,`investment`) VALUES ('%1','%2','%3')", getPlayerUID _unit, _policy, _invest, life_server_instance]; 
[_query] call DB_fnc_asyncQuery;