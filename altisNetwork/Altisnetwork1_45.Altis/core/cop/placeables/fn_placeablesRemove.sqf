
private ["_curTarget","_uid"];
_curTarget = cursorTarget;
_uid = getPlayerUID player;

if(isNil {_curTarget getVariable "owner"}) exitWith {};
if((_curTarget getVariable "owner") != _uid) exitWith {hint "That is not yours!";};

deleteVehicle _curTarget;
life_bar_placey = life_bar_placey - [_curTarget];