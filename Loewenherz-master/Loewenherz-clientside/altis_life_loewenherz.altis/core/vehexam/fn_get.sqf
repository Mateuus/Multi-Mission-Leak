if(!isServer) exitWith {};

private ["_type", "_name"];
_type = _this select 0;
_name = _this select 1;

missionNamespace getVariable [(format ["%1_%2", _type, _name]), objNull];
