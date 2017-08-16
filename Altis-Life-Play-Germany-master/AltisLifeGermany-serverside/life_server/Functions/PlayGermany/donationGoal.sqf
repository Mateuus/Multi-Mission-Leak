/*
	File: fn_donationGoal.sqf
	Author: Play-Germany

	Description:
	Keeps a look over the donation goal
*/

while {!PG_donGoalReached} do {
	_query = "donationGoal";
	waitUntil{sleep (random 0.3); !DB_Async_Active};
	_tickTime = diag_tickTime;
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	//too lazy to search if arry or not ^^ 
	if(isNil "_queryResult") then {diag_log "################### DONATIONQUERY FAILED ###################"};
	diag_log "################### DONATIONQUERY ###################";
	diag_log _queryResult;
	_goalReached = (_queryResult select 0) select 0;
	if(_goalReached isEqualTo 1) then {
		PG_donGoalReached = true;
		publicVariable "PG_donGoalReached";
		PG_donGoalMulti = 0.75;
		publicVariable "PG_donGoalMulti";
	};
	sleep 600;
};