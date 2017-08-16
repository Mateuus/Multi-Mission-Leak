#include <macro.h>
/*
	File: fn_adminTeleport.sqf
	Author: ColinM9991
	Credits: To original script author(s)
	Description:
	Teleport to chosen position.
*/
if(__GETC__(life_adminlevel) < 2) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt den Admin-Teleport (wegporten)!", name player];
	[["",_message,player,8],"SOA_fnc_handleMessages",false,false] spawn life_fnc_MP;
};

if(__GETC__(life_adminlevel < 3)) then {
	createDialog "checkAdmin";
	WaitUntil{isnull (finddisplay 8600)};
};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

tele={
	_pos = [_this select 0, _this select 1, _this select 2];
	(vehicle player) setpos [_pos select 0, _pos select 1, 0];
	onMapSingleClick "";
	openMap [false, false];
	hint "Du hast dich zum ausgewählten Bereich teleportiert";
};
openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";
[name player, "hat die Teleport-Funktion verwendet!",call life_adminlevel,7,"",admingrund] remoteExecCall ["life_fnc_logdat",2];