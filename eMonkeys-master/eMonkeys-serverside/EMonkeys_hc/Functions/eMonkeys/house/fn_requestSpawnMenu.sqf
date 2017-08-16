/** 
* 
* Sends house data [[NAME, MARKER], ...] to spawn menu to enable player spawning at home 
* 
*/ 
private["_unit","_queryResult", "_query"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
_query = format ["SELECT marker_spawn FROM homes WHERE owner='%1' ", getPlayerUID _unit]; 
 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
 
_queryResult = call compile format["[%1]",_queryResult]; 
 
 
 
 
[_queryResult,"EMonkeys_fnc_spawnMenu",_unit,false] call EMonkeys_fnc_MP; 
