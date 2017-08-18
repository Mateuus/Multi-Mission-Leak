/*
	Author: Raku @ Veterans of Altis
	
	Description:
	Gets the citizens tent, if any
*/
private["_query","_queryResult","_tickTime"];
 
_query = format["SELECT type, position FROM tents WHERE pid='%1' AND alive='1'",_this];
 
waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;
 
diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";
 
if(count _queryResult > 0) then {
	_pos = call compile format["%1",_queryResult select 1];
	_queryResult set[1,_pos];
	missionNamespace setVariable[format["tent_%1",_this],_queryResult];
};