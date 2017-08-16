/* 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Blah 
*/ 
private["_house","_uid","_housePos","_query"]; 
 
_unit  = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param; 
_house = [ _this, 1, ObjNull, [ObjNull] ] call BIS_fnc_param; 
_price = [ _this, 2, -1,      [0]       ] call BIS_fnc_param; 
 
diag_log format[ "addHouse(%1)", _this ]; 
 
if( isNull _house || isNull _unit || _price < 0 ) exitWith {}; 
 
_uid = getPlayerUID _unit; 
_housePos = getPosATL _house; 
 
_query = format["SELECT id FROM houses WHERE pos = '%1'", _housePos]; 
diag_log format["House query: %1", _query]; 
 
_queryResult = [_query, 2] call XYDB_fnc_asyncCall; 
diag_log format["Result: %1", _queryResult]; 
 
if( count _queryResult > 0 ) exitWith { 
    diag_log format["[ERROR] Client %1 tried buying a house that is already occupied @ %2", _uid, _housePos]; 
    [1, "Das Haus ist bereits belegt"] remoteExec ["XY_fnc_broadcast", _unit]; 
}; 
 
_query = format["INSERT INTO houses (pid, pos, inventory, containers, owned) VALUES('%1', '%2', '""[[],0]""', '""[]""', '1')", _uid, _housePos]; 
diag_log format["House query: %1", _query]; 
 
[_query, 1] call XYDB_fnc_asyncCall; 
 
_query = format["SELECT id FROM houses WHERE pos = '%1' AND pid = '%2' AND owned = '1'", _housePos, _uid]; 
diag_log format["House query: %1", _query]; 
 
_queryResult = [_query, 2] call XYDB_fnc_asyncCall; 
 
diag_log format["Result: %1", _queryResult]; 
_house setVariable["house_id", (_queryResult select 0), true]; 
 
[ getPlayerUID _unit, 9, format ["Kauft Haus @ %1 für $%2", mapGridPosition _house, [_price] call XY_fnc_numberText ]] call XYDB_fnc_log; 
 
[_house, _price] remoteExec ["XY_fnc_houseBought", _unit];