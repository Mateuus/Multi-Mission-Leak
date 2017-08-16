if (life_server_training) exitWith {}; 
private["_query","_sql","_uid","_plate","_vehicle","_active","_ammo"]; 
_plate = [_this,0,-1,[0]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_vehicle = [_this,2,objNull,[objNull]] call BIS_fnc_param; 
_active = [_this,3,1,[1]] call BIS_fnc_param; 
_alarm = [_this,4,0,[0]] call BIS_fnc_param; 
_ammo = [_this,5,0,[0]] call BIS_fnc_param; 
 
if(_plate == -1 OR _uid == "" OR isNull _vehicle) exitWith {[]}; 
 
_HC = false; 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = format["UPDATE %7 SET active='%5', fuel='%3', damage='%4', alarm='%6', ammo='%8' WHERE pid='%1' AND plate='%2'",_uid,_plate,((fuel _vehicle) * 100),((damage _vehicle) * 100),_active,_alarm,srv_table_vehicles,_ammo * 100]; 
[_query] call DB_fnc_asyncQuery;