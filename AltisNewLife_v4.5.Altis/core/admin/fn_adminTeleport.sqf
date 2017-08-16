#include <macro.h>
if(GETC(bitch_level) == 0) exitWith {closeDialog 0;};
[] spawn {
  while {dialog} do {
   closeDialog 0;
   uiSleep 0.01;
  };
};
tele={
	_pos = [_this select 0, _this select 1, _this select 2];
	(vehicle player) setpos [_pos select 0, _pos select 1, 0];
	onMapSingleClick "";
	openMap [false, false];
	hint "Vous vous etes teleporter sur cette position !";
};
openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";