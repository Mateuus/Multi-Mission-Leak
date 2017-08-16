/* 
Filename: fn_insertObjects.sqf 
*/ 
if (isServer) then { 
private ["_gangarea_id","_classname","_worldspace","_object","_query","_queryResult","_result","_objectid","_objectBlock","_objPos","_name","_marker"]; 
 
_gangarea_id =  _this select 0; // int 
_classname =   _this select 1; // String 
_worldspace =   _this select 2; // Array 
_object =    _this select 3; // Obj 
 
// Error Checks 
if (_object == objNull) exitWith {}; 
if (_gangarea_id == -1) exitWith {}; 
if (_classname == "") exitWith {}; 
if (typeName _worldspace != "ARRAY") exitWith {}; 
 
diag_log ("LHM_BASEBUILD: Attempt " + str(_object)); 
 
//Insert Object 
_query = format["INSERT INTO lhm_basebuild (gangarea_id, Classname, Worldspace, Inventory) VALUES('%1', '%2', '%3', '[]')", 
 _gangarea_id, 
 _classname, 
 _worldspace 
]; 
 
diag_log ("LHM_BASEBUILD: insert: "+ str(_query)); 
[_query,1] call DB_fnc_asyncCall; 
 
// Select Object to set ObjectID 
_query = format["SELECT ObjectID FROM lhm_basebuild WHERE Classname='%1' AND gangarea_id='%2' AND Worldspace='%3'",_classname,_gangarea_id,_worldspace]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
_result = call compile format["%1", _queryResult]; 
_objectid = (_result select 0); 
 
// Set Object Variables 
_object SetVariable ["gangarea_id", _gangarea_id,true]; 
_object SetVariable ["ObjectID",_objectid,true]; 
_object setVariable ["objUsed",false,true]; 
 
// prepare Hideout Starting Point 
if (_classname == "Flag_Quontrol_F") then { 
 _objPos = [20, position _object, direction _object, 270] call BUILD_fnc_calcSpawnMarker; 
 _name = format ["ga_building_spawn_%1",_gangarea_id]; 
 _marker = createMarker [_name, _objPos];    
 "Land_JumpTarget_F" createVehicle _objPos; // Spawn Visual Marker 
}; 
 
// Add to server array 
_objectBlock = [_gangarea_id,_classname,_object]; 
lhm_serverObjectMonitor pushBack _objectBlock; 
 
diag_log ("LHM_BASEBUILD: created " + (_classname) + " with Gang ID " + str(_gangarea_id) + " and ObjectID " + str(_objectid)); 
};