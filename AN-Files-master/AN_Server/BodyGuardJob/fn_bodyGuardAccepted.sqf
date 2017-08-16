params [
["_player",objNull,[objNull]]
];
if(isNull _player) exitWith {};
_index = BodyGuardArray find _player;
if(_index isEqualTo -1) then {
BodyGuardArray pushBack _player;  
};
