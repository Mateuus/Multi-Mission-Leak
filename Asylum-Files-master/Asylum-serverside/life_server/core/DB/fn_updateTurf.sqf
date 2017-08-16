 
 
 
 
 
 
 
 
private["_query","_sql"]; 
 
if (life_server_training) exitWith {}; 
 
{ 
if (!isNil "_x") then 
{ 
_query = format["UPDATE `turf` SET `gang`='%1' WHERE `id`='%2'", (_x select 1), _forEachIndex + 1]; 
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
}; 
} foreach life_turf_list;