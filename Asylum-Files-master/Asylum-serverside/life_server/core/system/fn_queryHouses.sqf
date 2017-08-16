 
 
 
 
 
 
 
private["_ret","_page","_building","_contents","_houseWorldspace","_houseId","_worldspace","_virtual"]; 
 
_query = format["ALTER TABLE `asylumlife%1`.`houses` DROP INDEX `oid_UNIQUE`", life_server_instance]; 
[_query] call DB_fnc_asyncQuery; 
 
_page = 0; 
while {true} do 
{ 
_ret = [_page] call DB_fnc_queryHouses; 
_page = _page + 1; 
 
if(!isNil "_ret") then 
{ 
[_ret] call ASY_fnc_receiveHouses; 
} 
else 
{ 
[nil] call ASY_fnc_receiveHouses; 
}; 
 
if ((count _ret) < 30) exitWith {}; 
}; 
 
_query = format["DELETE n1 FROM `asylumlife%1`.`houses` n1, `asylumlife%1`.`houses` n2 WHERE n1.id > n2.id AND n1.oid = n2.oid AND n1.id <> n2.id", life_server_instance]; 
[_query,2] call DB_fnc_asyncQuery; 
_query = format["ALTER TABLE `asylumlife%1`.`houses` ADD UNIQUE INDEX `oid_UNIQUE` (`oid` ASC)", life_server_instance]; 
[_query] call DB_fnc_asyncQuery; 
 
 
if (life_configuration select 10 == 1) then 
{ 
 
_page = 0; 
while {true} do 
{ 
_query = format["SELECT `id`,`houseid`,`houseworldspace` FROM `asylumlife%2`.`storage` ORDER BY `id` LIMIT %1,30", (_page * 30),life_server_instance]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
_result = call compile format["%1", _result]; 
if(isNil {((_result select 0) select 0)}) then { _ret = []; } 
else { _ret = (_result select 0); }; 
if(!isNil "_ret") then 
{ 
{ 
_worldspace = [(_x select 2)] call DB_fnc_mresToArray; 
_worldspace = call compile format["%1", _worldspace]; 
_building = _worldspace nearestObject "House_F"; 
_uniqueId = (_x select 0); 
_newId = [_building] call life_fnc_getBuildID; 
_query = format["UPDATE `asylumlife%1`.`storage` SET `houseid`='%2' WHERE `id`=%3", life_server_instance, _newId, _uniqueId]; 
[_query] call DB_fnc_asyncQuery; 
} forEach _ret; 
}; 
if ((count _ret) < 30) exitWith {}; 
_page = _page + 1; 
}; 
 
 
_query = format["UPDATE `asylumlife%1`.`config` SET `value`=0 WHERE `index`=10", life_server_instance]; 
[_query] call DB_fnc_asyncQuery; 
sleep 2; 
[["end1"],"BIS_fnc_endMission", true, false] spawn life_fnc_MP; 
};