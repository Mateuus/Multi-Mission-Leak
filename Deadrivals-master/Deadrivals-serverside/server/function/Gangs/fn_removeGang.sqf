private["_group","_groupID"]; 
_group = param [0,grpNull,[grpNull]]; 
if(isNull _group) exitWith {}; 
 
_groupname = _group getvariable"gang_name"; 
_groupID = _group getvariable ["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_query = format ["UPDATE gangs SET active = '0' WHERE id = '%1'",_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_result = format["SELECT id FROM gangs WHERE active = '1' AND id = '%1'",_groupID]; 
_result = [_result,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
_winners = [];       
{if(group _x getVariable["gang_name",""] == _groupname) then {_winners pushBack _x}} forEach playableUnits; 
{[_group] remoteExecCall ["CLIENT_fnc_gangDisbanded",_x];} forEach _winners; 
 
deleteGroup _group; 
 
["CALL deleteOldGangs",1] call SERVERDATABASE_fnc_asyncCall;