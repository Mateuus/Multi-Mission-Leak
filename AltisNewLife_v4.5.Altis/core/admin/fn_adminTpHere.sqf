#include <macro.h>
if(GETC(bitch_level) == 0) exitWith {closeDialog 0;};
private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};
_target setPos (getPos player);
hint format["Vous avez TP %1 sur votre position",_target getVariable["realname",name _target]];