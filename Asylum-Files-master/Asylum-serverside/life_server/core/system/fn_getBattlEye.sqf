 
 
 
 
 
 
 
 
private ["_unit","_uid","_guid","_ip"]; 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_uid = getPlayerUID _unit; 
 
_guid = [_uid] call ASY_fnc_getGuid; 
waitUntil {!isNil "_guid"}; 
 
_ip = [_uid] call ASY_fnc_getIpAddress; 
waitUntil {!isNil "_ip"}; 
 
_query = format["UPDATE %4 SET `guid`='%1', `ipaddress`='%2' WHERE playerid='%3'", _guid, _ip, _uid, srv_table_players]; 
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query]; 
 
[[_guid,_ip],"life_fnc_battlEyeReceive",_unit,false] spawn life_fnc_MP;