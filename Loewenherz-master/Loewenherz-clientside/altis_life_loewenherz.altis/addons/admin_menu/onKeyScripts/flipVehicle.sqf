private ["_vehicle","_vehicles","_dir"];
_vehicle = _this select 0;
if(_vehicle == objNull) exitWith {};
_dir = getDir _vehicle;
_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 1];
_vehicle setDir _dir;
_vehicle setVelocity [0,0,0];