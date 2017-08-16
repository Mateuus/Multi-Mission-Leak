
_player = param [0,ObjNull,[ObjNull]];
_playerId = param [1,"",[""]];

if(isNull _player) exitWith {};
if(_playerId isEqualTo "") exitWith {};

_query = format["PlayerGangKicked:%1",_playerId];
[_query,1] call DB_fnc_asyncCall;