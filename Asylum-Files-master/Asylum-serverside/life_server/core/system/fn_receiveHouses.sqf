 
 
 
 
 
 
 
 
private["_session", "_building", "_array", "_owners", "_worldspace", "_numDoors","_uniqueId"]; 
_session = _this select 0; 
 
 
if(isNil "_session") exitWith {}; 
 
 
 
 
 
 
 
 
 
 
 
{  
_worldspace = call compile (_x select 2); 
life_house_owners pushBack [(_x select 0), (_x select 1), _worldspace]; 
 
if (life_configuration select 10 == 1) then 
{ 
 
 
diag_log "HOUSE RESYNC INITIALIZED (REBUILD MODE)"; 
_worldspace = [(_x select 2)] call DB_fnc_mresToArray; 
_worldspace = call compile format["%1", _worldspace]; 
_building = _worldspace nearestObject "House_F"; 
_oldId = (_x select 0); 
_uniqueId = (_x select 4); 
_newId = [_building] call life_fnc_getBuildID; 
 
if (_oldId != _newId) then 
{ 
diag_log format["HOUSE: oldId = %1, newId = %2", _oldId, _newId]; 
_query = format["UPDATE asylumlife%3.houses SET `oid`='%1' WHERE `oid`='%2'", _newId, _oldId, life_server_instance]; 
diag_log _query; 
[_query] call DB_fnc_asyncQuery; 
_query = format["UPDATE asylumlife%3.gangs SET `id`='%1' WHERE `id`='%2'", _newId, _oldId, life_server_instance]; 
diag_log _query; 
[_query] call DB_fnc_asyncQuery; 
_query = format["UPDATE arma3life.%4 SET `gang%3`='%1' WHERE `gang%3`='%2'", _newId, _oldId, life_server_instance, srv_table_players]; 
diag_log _query; 
[_query] call DB_fnc_asyncQuery; 
_query = format["UPDATE asylumlife%3.captures SET `gang`='%1' WHERE `gang`='%2'", _newId, _oldId, life_server_instance]; 
[_query] call DB_fnc_asyncQuery; 
_query = format["UPDATE asylumlife%3.turf SET `gang`='%1' WHERE `gang`='%2'", _newId, _oldId, life_server_instance]; 
[_query] call DB_fnc_asyncQuery; 
}; 
}; 
} foreach (_session);