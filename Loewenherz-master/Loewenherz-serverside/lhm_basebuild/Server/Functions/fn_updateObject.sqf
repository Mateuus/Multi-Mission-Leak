/* 
Filename: fn_updateObject.sqf 
*/ 
if (isServer) then { 
private ["_objectid","_gangarea_id","_object","_position","_worldspace","_query","_queryResult"]; 
 
_objectid =  _this select 0; // Int 
_gangarea_id = _this select 1; // String 
_object =  _this select 2; // Obj 
 
// Error Checks 
if (isNull _object) exitWith {}; 
if (_objectID == 0) exitWith {}; 
if (_gangarea_id == -1) exitWith {}; 
 
// create Position array 
_position = getPosATL _object; 
_worldspace = [round(direction _object),_position]; 
 
_query = format["UPDATE lhm_basebuild SET Worldspace='%1' WHERE ObjectID='%2'",_worldspace,_objectid]; 
 
_queryResult = [_query,1] call DB_fnc_asyncCall; 
 
diag_log format ["LHM_BASEBUILD: Update Object Position | ID:'%1' GANGID:""%2"" Classname:'%3' Pos:'%4'",_objectID,_gangarea_id,typeOf _object,_worldspace]; 
}; 
 
 
 
 
