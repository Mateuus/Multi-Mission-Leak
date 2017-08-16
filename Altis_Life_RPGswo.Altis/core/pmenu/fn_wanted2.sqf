#include "..\..\macros.hpp"
private["_unit","_amount"];

ctrlShow[2001,false];
if((lbCurSel 9902) == -1) exitWith {hint "Es wurde niemand ausgewählt";ctrlShow[2001,true];};
_unit = lbData [9902,lbCurSel 9902];
_unit = call compile format["%1",_unit];
_amount = lbData [9991,lbCurSel 9991];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

format["%1 wird gesucht.\nEingetragen von %4",getPlayerDName(_unit),_amount,getPlayerUID _unit,getMyDName] remoteExec ["hint",west];
[getPlayerUID _unit,getPlayerName(_unit),_amount, getMyDName, getPlayerUID player] remoteExec ["DWEV_fnc_wantedAdd",2];