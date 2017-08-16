// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _player = param[ 0, objNull, [objNull] ]; 
private _group = param[ 1, grpNull, [grpNull] ]; 
 
if( isNull _player || _group isEqualTo grpNull ) exitWith {}; 
 
private _gangID = _group getVariable [ "gang.id", -1 ]; 
if( _gangID < 0 ) exitWith {}; 
 
private _queryResult = [ format [ "SELECT date, name, type, amount FROM vgangbanklog WHERE id = %1 LIMIT 30", _gangID ], 2, true] call XYDB_fnc_asyncCall; 
 
[ "log", _queryResult ] remoteExec [ "XY_fnc_gangMenu", _player ];