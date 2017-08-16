/* 
Filename: fn_deleteObjects.sqf 
*/ 
if (isServer) then { 
private["_objectID","_gangarea_id","_query","_queryResult"]; 
 
_objectID  = _this select 0; // Int 
_gangarea_id = _this select 1; // String 
_object   = _this select 2; // Obj 
 
// Error Checks 
if (_object == objNull) exitWith {}; 
if (_objectID == 0) exitWith {}; 
if (_gangarea_id == -1) exitWith {}; 
 
//remove from database 
_query = format["DELETE FROM lhm_basebuild WHERE ObjectID='%1' AND gangarea_id='%2'",_objectID,_gangarea_id]; 
 
_queryResult = [_query,1] call DB_fnc_asyncCall; 
 
// Remove it also from server variable 
lhm_serverObjectMonitor = lhm_serverObjectMonitor - [_object]; 
 
// and at least remove object itself 
deleteVehicle _object; 
 
diag_log format ["LHM_BASEBUILD: Delete Object - ID:'%1' UID:'%2' Classname:'%3' Pos:'%4'",_objectID,_gangarea_id,typeOf _object,getPos _object]; 
};