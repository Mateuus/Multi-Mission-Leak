/* 
 
 file: fn_msgRequest.sqf 
 Author: Silex 
  
 Fills the Messagelist 
*/ 
private["_queryResult", "_uid", "_player"]; 
 
_uid    = [ _this, 0, "",      [""]      ] call BIS_fnc_param; 
_player = [ _this, 1, objNull, [objNull] ] call BIS_fnc_param; 
 
_queryResult = [ format["SELECT fromID, toID, message, fromName, toName FROM messages WHERE toID = '%1' ORDER BY time DESC LIMIT 30", _uid], 2, true ] call XYDB_fnc_asyncCall; 
[1, _queryResult] remoteExec ["XY_fnc_smartphone", _player];