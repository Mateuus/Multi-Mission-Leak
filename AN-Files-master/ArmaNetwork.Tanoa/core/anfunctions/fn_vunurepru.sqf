//Exile Mod Team
private["_threadID","_result","_threadIndex"];
_threadID = _this select 0;
_result = false;
_threadIndex = [ThreadList,_threadID] call life_fnc_crehezaprac;
if (_threadIndex != -1) then
{
	ThreadDelays deleteAt (ThreadDelays find ((ThreadList select _threadIndex) select 0));
	[] call life_fnc_phejuzuph;
	ThreadList deleteAt _threadIndex;
	_result = true;
};
_result
