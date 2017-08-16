#include "..\..\script_macros.hpp"
/*---------------------------------------------------------------------------
File: 			fn_setDeckname.sqf
Author:			lutrox // www.team-elan.de
Description:	Well, sets the Undercovercops realname to his deckname.
---------------------------------------------------------------------------*/

private["_val","_val2"];
if(!(FETCH_CONST(life_coplevel) >= 5)) exitWith{};


_val = ctrlText 100002;
_val2 = format["%1",_val];

if(toLower _val2 in ["Cris","Tylor","ImCore","ImProx","Tim Taylor","Imcore","Eaglestorm","Jack Brown"]) exitWith{hint "Es ist nicht gestattet diese Person zu Clonen.";};

if((format["%1",player GVAR "realname"] == format["%1",(name player)]) && (format["%1",_val2] == format["%1",(name player)])) exitWith{hint "Keinen Decknamen angenommen.";};

player setvariable ["realname",_val2,true];

//Maybe tell the cops that you are undercover now? Also tell them your name?
if(_val2 == name player) then {
[0,format["Der Polizist %1 ist nun nichtmehr länger verdeckt unterwegs.",name player]] remoteExec ["life_fnc_broadcast",west];
} else {
[0,format["Der Polizist %1 ist nun verdeckt unter dem Namen %2 unterwegs.",name player, _val2]] remoteExec ["life_fnc_broadcast",west];
};