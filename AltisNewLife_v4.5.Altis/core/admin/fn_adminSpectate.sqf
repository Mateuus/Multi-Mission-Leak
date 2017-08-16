#include <macro.h>
if(GETC(bitch_level) == 0) exitWith {closeDialog 0;};
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};
[] spawn {
  while {dialog} do {
   closeDialog 0;
   uiSleep 0.01;
  };
};
_unit switchCamera "INTERNAL";
hint format["Vous etes en spectateur de %1 \n\n Appuyer F10 pour arreter",_unit getVariable["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'Vous avez arrete le mode spectateur';};false"];