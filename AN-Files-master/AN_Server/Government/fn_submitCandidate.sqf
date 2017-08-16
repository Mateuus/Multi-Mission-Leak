params [
[_player,objNull,[objNull]],
[_uid,,[]],
[_name,,[]],
[_invest,0,[2500]],
[_policy,,[]]
];
if(isNull _player OR _policy isEqualTo ) exitWith {};
_query = format[GovernmentNewCand%1%2%3%4,_name,_uid,_invest,_policy];
[_query,1] call DB_fnc_asyncCall;
life_run_data pushBack [_uid,_name,_invest,_policy];
publicVariable life_run_data;
