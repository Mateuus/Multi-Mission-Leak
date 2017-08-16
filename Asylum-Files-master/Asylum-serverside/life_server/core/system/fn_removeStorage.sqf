 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_container","_containerId","_house","_buildingID","_housePos","_contents","_vContents","_query","_sql"]; 
 
_container = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
if (isNull _container) exitWith {}; 
 
_containerId = _container getVariable["containerId", -1]; 
_house = _container getVariable["house", objNull]; 
if (isNull _house) exitWith {}; 
_housePos = getPos _house; 
 
_containers = _house getVariable ["containers", []]; 
_containers = _containers - [_container]; 
_house setVariable ["containerCount", (_house getVariable["containerCount", 1])-1, true]; 
_house setVariable ["containers", _containers]; 
 
_HC = false; 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = format["DELETE FROM `storage` WHERE `houseworldspace`='""%1""' AND `container`='%2'",_housePos,_containerId]; 
if (_HC) then { [[_query,format["asylumlife%1",life_server_instance]],"DB_fnc_doQuery",(owner hc_1),false] spawn life_fnc_MP; } 
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; }; 
 
deleteVehicle _container;