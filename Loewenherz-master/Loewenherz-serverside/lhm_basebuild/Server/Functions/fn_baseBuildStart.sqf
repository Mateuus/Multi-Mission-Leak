/* 
Filename: fn_basebuildStart.sqf 
 
Description: Server Part - initialize basebuilding and spawn objects at server start 
 
Author:Blackd0g 
*/ 
private ["_tickTime", "_query", "_queryResult", "_result", "_countObjects", "_objectArray", "_index", "_objectID", "_gangarea_id", "_classname", "_worldspace", "_inventory", "_dir", "_entity", "_ObjectID", "_objPos", "_marker", "_visualMarker", "_objectBlock","_gangname"]; 
 
base_Build = false; 
 
// wait till DB Functions has initialized 
waitUntil{!isNil"lhm_server_isReady"}; 
waitUntil{lhm_server_isReady}; 
 
_tickTime = diag_tickTime; 
 
diag_log "------------ Basebuild System ------------"; 
diag_log "LHM_BASEBUILD: Initializing...."; 
 
// Clear old objects *placeholder* 
//["CALL deleteOldObjects",1] spawn DB_fnc_asyncCall; 
 
// Count Objects 
_query = format["SELECT COUNT(*) FROM lhm_basebuild"]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
waitUntil{!isNil"_queryResult"}; 
_result = call compile format["%1", _queryResult]; 
_countObjects = (_result select 0); 
 
If (_countObjects == 0) exitWith {diag_log ("LHM_BASEBUILD: No Objects found - skip spawn!");base_Build = true;}; 
 
// Add Objects to Spawn Array 
_objectArray = []; 
 diag_log ("LHM_BASEBUILD: Commence Object Streaming..."); 
 for "_i" from 0 to (_countObjects -1) do { 
 
  //_query = format["SELECT ObjectID, gangarea_id, Classname, Worldspace, inventory FROM lhm_basebuild LIMIT %1,1",_i]; 
  _query = format["SELECT B.ObjectID,B.Gangarea_id,B.Classname,B.Worldspace,B.Inventory,G.`name` FROM lhm_basebuild AS B INNER JOIN gangs AS G ON B.Gangarea_id = G.id LIMIT %1,1",_i]; 
 
  _queryResult = [_query,2] call DB_fnc_asyncCall; 
  waitUntil{!isNil"_queryResult"}; 
 
  // Check if DB result is not empty! 
  if(!(_queryResult isEqualTo [])) then { 
   _objectArray pushBack _queryResult; 
  } else { 
   diag_log format ["LHM_BASEBUILD: Error Empty Object / Cancel Spawn! _queryResult: %1",_queryResult]; 
  }; 
 }; 
 
diag_log ("LHM_BASEBUILD: got " + str(count _objectArray) + " objects"); 
 
// Spawn Objects and set functions and vars 
{ 
 _index =    _x; 
 _objectID =   _index select 0; 
 _gangarea_id =  _index select 1; 
 _classname =  _index select 2; 
 _worldspace =  _index select 3; 
 _inventory =  _index select 4; 
 _gangname =   _index select 5; 
 
 // get position 
 _worldspace = (call compile (_worldspace)); // convert pos string to array 
 _dir =   _worldspace select 0; 
 _pos =   _worldspace select 1; 
 
 If (typeName _pos != "ARRAY") then {diag_log format["LHM_BASEBUILD: Position Error ObjectID'%1'",_objectID]}; 
 _entity = createVehicle [_classname, [0,0,0], [], 0,"CAN_COLLIDE"]; 
 
 // wait till object is spawned 
 waitUntil{!isNil "_entity"}; 
 
 // disable object damage 
 _entity allowDamage false; 
 
 // Position Fix 
 // _pos set [2,0]; // set Height to 0 (always on Ground) 
 _entity setDir _dir; 
 _entity setPos _pos; 
 
 // Set Object Variables 
 _entity setVariable ["ObjectID",_ObjectID, true]; // object db id 
 _entity setVariable ["gangarea_id",_gangarea_id, true]; // gang id 
 _entity setVariable ["objUsed",false,true]; // if object is in use this value is true (move or gangshop open) 
 
 _handle = [_entity,_inventory,_gangarea_id,_gangname] spawn build_fnc_setObjectFunctions; 
 waitUntil{ScriptDone _handle}; 
 
 
 // Add to server array 
 _objectBlock = [_gangarea_id,_classname,_entity]; 
 lhm_serverObjectMonitor pushBack _objectBlock; 
 
 // clear Variable 
 _entity = nil; 
 _handle = nil; 
 
 diag_log format ["LHM_BASEBUILD: Spawn Object - ID:'%1' UID:'%2' Classname:'%3' Pos:'%4'",_objectID,_gangarea_id,_classname,_worldspace]; 
}forEach _objectArray; 
 
base_Build = true; 
 
diag_log format["LHM_BASEBUILD: Time to complete Object Spawns: %1 (in seconds)",(diag_tickTime - _tickTime)];