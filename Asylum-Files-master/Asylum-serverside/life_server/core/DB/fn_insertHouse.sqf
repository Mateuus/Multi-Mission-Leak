 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_uid","_oid","_locked","_worldspace","_query","_sql"]; 
_oid = [_this,0,"",[""]] call BIS_fnc_param; 
_uid = [_this,1,"",["",false]] call BIS_fnc_param; 
_locked = [_this,2,-1,[0]] call BIS_fnc_param; 
_worldspace = [_this,3,[],[[],false]] call BIS_fnc_param; 
_HC = false; 
 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
life_house_owners pushBack [_oid, _uid, _worldspace]; 
 
_query = format["DELETE FROM `asylumlife%2`.`houses` WHERE worldspace='%1'", _worldspace, life_server_instance]; 
[_query,2] call DB_fnc_asyncQuery; 
_query = format["INSERT INTO `asylumlife%5`.`houses` (oid, owners, locked, worldspace) VALUES ('%1', '%2', '%3', '%4')",_oid,_uid,_locked,_worldspace,life_server_instance]; 
[_query,2] call DB_fnc_asyncQuery; 
 
sleep 5; 
 
_query = format["SELECT `id` FROM `asylumlife%2`.`houses` WHERE worldspace='%1'", _worldspace, life_server_instance]; 
_ret = [_query,2,true] call DB_fnc_asyncQuery; 
_ret = _ret select 0; 
 
_house = _worldspace nearestObject "House_F"; 
_house setVariable ["houseId", _ret select 0, true];