 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_uid","_side","_type","_className","_color","_plate", "_fuel", "_damage","_query","_sql"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,"",[""]] call BIS_fnc_param; 
_type = [_this,2,"",[""]] call BIS_fnc_param; 
_className = [_this,3,"",[""]] call BIS_fnc_param; 
_color = [_this,4,-1,[0]] call BIS_fnc_param; 
_plate = [_this,5,-1,[0]] call BIS_fnc_param; 
_fuel = [_this,6,-1,[0]] call BIS_fnc_param; 
_damage = [_this,7,-1,[0]] call BIS_fnc_param; 
_alarm = [_this,8,false,[false]] call BIS_fnc_param; 
 
 
if(_uid == "" OR _side == "" OR _type == "" OR _className == "" OR _color == -1 OR _plate == -1) exitWith {}; 
 
_HC = false; 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_fuel = _fuel * 100; 
_damage = _damage * 100; 
_alarm = [_alarm,0] call DB_fnc_bool; 
 
_query = format["INSERT INTO %10 (side, classname, type, pid, alive, active, inventory, color, plate, fuel, damage, alarm) VALUES ('%1', '%2', '%3', '%4', '1','1','[]', '%5', '%6', '%7', '%8', '%9')",_side,_className,_type,_uid,_color,_plate,_fuel,_damage,_alarm,srv_table_vehicles]; 
[_query] call DB_fnc_asyncQuery;