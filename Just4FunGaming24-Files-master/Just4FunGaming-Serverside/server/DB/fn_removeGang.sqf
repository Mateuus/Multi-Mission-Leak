// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _group = param[0, grpNull, [grpNull]]; 
if( isNull _group ) exitWith {}; 
 
private _groupID = _group getVariable["gang.id", -1]; 
if( _groupID < 0 ) exitWith {}; 
 
[ format["UPDATE gangs SET active = '0' WHERE id = '%1'", _groupID], 1] call XYDB_fnc_asyncCall; 
[] remoteExec ["XY_fnc_gangDisbanded", _group];