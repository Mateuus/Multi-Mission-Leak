/*
fn_vote.sqf
Kevin Webb
adds your vote to the database
*/
_voterid = param[0];
_candidate = param[1];

_query = format["UPDATE players,politics SET players.voted=1, politics.votecount=politics.votecount+1 WHERE players.playerid = '%1' and politics.uid='%2'",_voterid,_candidate];
[_query,1] call DB_fnc_asyncCall;