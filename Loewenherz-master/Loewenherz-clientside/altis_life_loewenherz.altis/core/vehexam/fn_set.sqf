
if(!isServer) exitWith {};

private ["_type", "_name", "_value"];
_type = _this select 0;
_name = _this select 1;
_value = _this select 2;    

missionNamespace setVariable [(format ["%1_%2", _type, _name]), _value];

