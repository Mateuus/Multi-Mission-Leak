//Exile Mod Team
if (ThreadDelays isEqualTo []) then {
	ThreadDelays = [5];
};
ThreadDelays = ThreadDelays call BIS_fnc_sortNum;
ThreadSleep = (((ThreadDelays select 0) max 0.01) min 5);
true
