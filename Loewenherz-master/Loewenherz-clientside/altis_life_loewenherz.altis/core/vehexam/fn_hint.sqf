if(!isServer) exitWith {};
    
private ["_target", "_msg"];
_target = _this select 0;
_msg = _this select 1;
[_msg, "vehexam_fnc_hintClient", _target, false] call lhm_fnc_mp;
