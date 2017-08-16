//Exile Mod Team
_delay = _this select 0;
_function = _this select 1;
_params =  _this select 2;
_persistance = _this select 3;
_threadId = ThreadID;
ThreadList pushBack [_delay, time, _function,_params, _threadId, _persistance];
ThreadDelays pushBack _delay;
[] call life_fnc_phejuzuph;
ThreadList = [ThreadList, [], {_x select 4}, "ASCEND", {true}] call BIS_fnc_sortBy;
ThreadID = ThreadID + 1;
_threadId;
