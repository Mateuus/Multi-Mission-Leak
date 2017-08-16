#include "..\..\script_macros.hpp"
	/*
		Author: Bryan "Xeon Diaboli

	*/
	private["_vehicle"];
	_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	
	while {true} do {
			[_vehicle,(fuel _vehicle)-0.02] remoteExecCall ["life_fnc_setFuel",_vehicle];
			sleep 5;
	};