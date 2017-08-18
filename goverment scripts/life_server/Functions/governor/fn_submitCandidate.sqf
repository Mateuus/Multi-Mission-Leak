/*
fn_submitCandidate.sqf
Author: Kevin Webb

Description: submits new candidates to the database
*/
_player = param [0];
_invest = param [1];
_policy = param [2];
_name = name _player;
_uid = getPlayerUid _player;

_query = format["INSERT INTO politics (name,uid,invest,policy,active) VALUES('%1', '%2', '%3', '%4', '1')",_name,_uid,_invest,_policy];
[_query,1] call DB_fnc_asyncCall;
life_run_data pushBack [_uid,_name,_invest,_policy];
publicVariable "life_run_data";