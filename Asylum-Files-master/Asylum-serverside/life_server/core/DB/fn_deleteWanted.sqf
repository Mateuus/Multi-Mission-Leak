 
 
 
 
if (life_server_training) exitWith {}; 
private["_oid","_query","_sql","_worldspace"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_HC = false; 
 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = format["DELETE FROM `%2` WHERE `playerid`='%1'", _uid, srv_table_wanted]; 
if (_HC) then { [[_query,"arma3life"],"DB_fnc_doQuery",(owner hc_1),false] spawn life_fnc_MP; } 
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query]; };