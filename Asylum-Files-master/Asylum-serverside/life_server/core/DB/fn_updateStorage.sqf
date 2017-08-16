 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
diag_log "[updateStorage]"; 
private["_container","_containerId","_house","_buildingID","_housePos","_contents","_vContents","_query","_sql","_uniqueId"]; 
 
_container = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
if (isNull _container) exitWith {}; 
 
 
 
_contents = [(getWeaponCargo _container),(getMagazineCargo _container),(getBackpackCargo _container),(getItemCargo _container)]; 
_contents = [_contents] call DB_fnc_mresArray; 
_vContents = _container getVariable["Trunk", [[],0]]; 
_vContents = [_vContents] call DB_fnc_mresArray; 
 
_container setVariable["lootModified", false, true]; 
_containerId = _container getVariable["containerId", -1]; 
_uniqueId = _container getVariable["conUniqueId", -1]; 
_house = _container getVariable["house", objNull]; 
_buildingID = [_house] call life_fnc_getBuildID; 
_housePos = getPos _house; 
 
_HC = false; 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = if (_uniqueId > -1) then 
{ 
format["UPDATE `storage` SET `contents`='%1', `virtual`='%2' WHERE `id`='%3'",_contents,_vContents,_uniqueId]; 
} 
else 
{ 
format["UPDATE `storage` SET `contents`='%1', `virtual`='%4' WHERE `houseid`='%2' AND `container`='%3'",_contents,_buildingID,_containerId,_vContents]; 
}; 
diag_log format["[updateStorage] _query = %1",_query]; 
if (_HC) then { [[_query,format["asylumlife%1",life_server_instance]],"DB_fnc_doQuery",(owner hc_1),false] spawn life_fnc_MP; } 
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; };