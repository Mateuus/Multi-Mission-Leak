/*
	File : fn_lockCargo.sqf
	Author: RafiQuak for PlayGermany
*/
private["_heli"];

_heli = _this select 0;
{_heli lockCargo [_x, true] } forEach [2,3,4,5];
_heli addEventHandler ["Local",{_this spawn {_heli = _this select 0;waitUntil{!local _heli};[_heli] remoteExec ["PG_fnc_lockCargo",_heli];}}];

