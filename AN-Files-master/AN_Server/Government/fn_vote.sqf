_voterid = param[0,"",[""]];
_candidate = param[1,"",[""]];
_query = format["GovernmentVoteCand:%1:%2",_voterid,_candidate];
[_query,1] call DB_fnc_asyncCall;
