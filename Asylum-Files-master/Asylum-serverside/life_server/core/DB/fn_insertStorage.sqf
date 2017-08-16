 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_crate", "_worldspace", "_posIndex", "_house", "_query", "_sql"]; 
 
_crate = [_this,0,"",[""]] call BIS_fnc_param; 
_worldspace = [_this,1,[],[[],false]] call BIS_fnc_param; 
_posIndex = [_this,2,-1,[-1]] call BIS_fnc_param; 
_house = [_this,3,objNull,[objNull]] call BIS_fnc_param; 
_houseWorldspace = position _house; 
 
_buildingID = [_house] call life_fnc_getBuildID; 
 
 
_worldspace = [_worldspace] call DB_fnc_mresArray; 
_houseWorldspace = [_houseWorldspace] call DB_fnc_mresArray; 
_HC = false; 
 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = format["INSERT INTO `storage` (`houseid`, `worldspace`, `container`, `classname`, `contents`,`virtual`,`houseworldspace`) VALUES ('%1', '%2', '%3', '%4', '""[]""', '""[[],0]""','%5')",_buildingID,_worldspace,_posIndex,_crate,_houseWorldspace]; 
if (_HC) then { [[_query,format["asylumlife%1",life_server_instance]],"DB_fnc_doQuery",(owner hc_1),false] spawn life_fnc_MP; } 
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; };