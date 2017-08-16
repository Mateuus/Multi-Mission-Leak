 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_oid","_query","_sql","_worldspace","_salePrice"]; 
_oid = [_this,0,"",[""]] call BIS_fnc_param; 
_house = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_salePrice = [_this,2,0,[0]] call BIS_fnc_param; 
_worldspace = getPos _house; 
_worldspacestr = [_worldspace] call DB_fnc_mresArray; 
_HC = false; 
 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = format["UPDATE houses SET `sale`='%3' WHERE `worldspace`='%1' OR `id`='%2'",_worldspacestr,_house getVariable ["houseId", -1], _salePrice]; 
if (_HC) then { [[_query,format["asylumlife%1",life_server_instance]],"DB_fnc_doQuery",(owner hc_1),false] spawn life_fnc_MP; } 
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; }; 
 
[_oid] call DB_fnc_deleteGang;