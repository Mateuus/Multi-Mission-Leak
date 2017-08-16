
private["_delay","_function","_params","_persistance","_threadId"];
_delay = _this select 0;
_function = _this select 1;
_params =  _this select 2;
_persistance = _this select 3;
_threadId = ThreadID;
SpawnThread pushBack [_delay, time, _function,_params, _threadId, _persistance];
ThreadDelays pushBack _delay;
[] call AN_server_threadAdjust;
SpawnThread = [SpawnThread, [], {_x select 4}, "ASCEND", {true}] call BIS_fnc_sortBy;
format ["Thread %1 added.", _threadId] call AN_server_log;
ThreadID = ThreadID + 1;
_threadId
