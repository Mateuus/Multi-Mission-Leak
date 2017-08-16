 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_oid","_locked","_query","_sql","_worldspace"]; 
_oid = [_this,0,"",[""]] call BIS_fnc_param; 
_locked = [_this,1,-1,[0]] call BIS_fnc_param; 
_worldspace = [_this,2,[],[[],false]] call BIS_fnc_param; 
 
_HC = false; 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = format["UPDATE `asylumlife%4`.`houses` SET locked='%1',worldspace='%3' WHERE oid='%2'",_locked,_oid,_worldspace,life_server_instance]; 
[_query] call DB_fnc_asyncQuery;