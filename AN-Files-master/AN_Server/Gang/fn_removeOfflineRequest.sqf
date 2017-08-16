params [
["_playerID","",[""]]
];

if (_playerId isEqualTo "") exitWith {};

[format ["RemoveOfflineGangMember:%1", _playerId], 1] call DB_fnc_asyncCall;
