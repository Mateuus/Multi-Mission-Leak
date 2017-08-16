 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_oid","_query","_sql","_worldspace"]; 
_oid = [_this,0,"",[""]] call BIS_fnc_param; 
_house = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_worldspace = getPos _house; 
_worldspacestr = [_worldspace] call DB_fnc_mresArray; 
_houseId = [_house] call life_fnc_getBuildID; 
_HC = false; 
 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
{ 
[_x, player] call ASY_fnc_removeStorage; 
} forEach (_house getVariable["containers", []]); 
 
_query = format["DELETE FROM houses WHERE `worldspace`='%1' OR `oid`='%2' LIMIT 1",_worldspacestr,_houseId]; 
if (_HC) then { [[_query,format["asylumlife%1",life_server_instance]],"DB_fnc_doQuery",(owner hc_1),false] spawn life_fnc_MP; } 
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; }; 
 
[_oid] call DB_fnc_deleteGang; 
 
_index = -1; 
{ if (str _worldspace == str (_x select 2)) then { _index = _forEachIndex; }; } forEach life_house_owners; 
life_house_owners set[_index, -1]; 
life_house_owners = life_house_owners - [-1];