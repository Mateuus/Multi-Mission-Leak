 
 
 
 
 
 
 
private["_uid","_gang","_rank"]; 
if (life_server_training) exitWith {}; 
_uid = [_this,0,"0",["0"]] call BIS_fnc_param; 
_gang = [_this,1,"0",["0"]] call BIS_fnc_param; 
_rank = [_this,2,3,[3]] call BIS_fnc_param; 
_HC = false; 
 
if (_rank < 0) exitWith {}; 
 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = format["UPDATE `%5` SET gang%4='%2',gangrank%4='%3' WHERE playerid='%1'",_uid,_gang,_rank,life_server_instance,srv_table_players]; 
if (_HC) then { [[_query,"arma3life"],"DB_fnc_doQuery",(owner hc_1),false] spawn life_fnc_MP; } 
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query]; };