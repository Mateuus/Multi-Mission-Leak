if(!isServer) exitWith {};

private ["_player", "_obj", "_args", "_global"];        
_obj = _this select 0;
_args = _this select 1;
_player = _this select 2;
[[_obj, _args], "vehexam_fnc_addActionClient", _player, false] call lhm_fnc_mp;
