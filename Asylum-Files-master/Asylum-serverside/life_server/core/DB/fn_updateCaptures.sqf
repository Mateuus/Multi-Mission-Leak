 
 
 
 
 
 
 
 
private["_query","_sql"]; 
 
if (life_server_training) exitWith {}; 
 
_HC = false; 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
{ 
if (!isNil "_x") then 
{ 
_contents = 0; 
if (!isNil "life_capture_containers select _forEachIndex") then 
{ 
_contents = ((life_capture_containers select _forEachIndex) getVariable "gangContainer") select 1; 
}; 
_query = format["UPDATE `captures` SET `gang`='%1', `percent`='%2', `container`='%4', `level`='%5' WHERE `id`='%3'", (_x select 1), ((_x select 2) * 100), _forEachIndex + 1, _contents, (_x select 6)]; 
if (_HC) then { [[_query,format["asylumlife%1",life_server_instance]],"DB_fnc_doQuery",(owner hc_1),false] spawn life_fnc_MP; } 
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; }; 
}; 
} foreach life_capture_changed; 
 
life_capture_changed = [];