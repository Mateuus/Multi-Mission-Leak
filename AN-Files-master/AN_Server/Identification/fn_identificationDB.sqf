
params [
["_info",[],[[]]],
["_uid","",[""]],
["_player",objNull,[objNull]]
];

if (_info isEqualTo [] OR {_uid isEqualTo ""}) exitWith {};
if (isNull _player OR {isNil "_player"}) exitWith {};
private _arrayTemp = [_info] call DB_fnc_mresArray;
private _query = format ["AddPlayerIdentification:%1:%2",_arrayTemp,_uid];
[_query,1] call DB_fnc_asyncCall;