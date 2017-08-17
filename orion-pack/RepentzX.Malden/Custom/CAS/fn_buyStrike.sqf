#include "..\..\script_macros.hpp"
/*
Repentz to create a altis life based CAS system
*/
private ["_action","_price"];


if (mav_ttm_var_terrorist == 0) exitwith {["you cannot use this feature without the correct skill perk (Terrorist Training)",false,"slow"] call life_fnc_notificationSystem;};
_price = 600000;
if(civRDM < _price) exitWith {["You do not have enough money to buy this!",false,"slow"] call life_fnc_notificationSystem;};

_action = [
	"Warning, the CAS airstrike will cost you $600,000. This strike strike has only one use, you must announce the threat of this tool to the target party beforehand. You cannot use this within safezones or on marked police, rebel, or other bases. RDM with this will result in a ban, the use of this tool is logged. It's non refundable if you Disconnect/die, continue?",
	"Airstrike",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[format["%1 Has bought an air strike", profileName], "MoneyLogs"] remoteExecCall ["A3Log", 2];
	civRDM = civRDM - _price;
	life_airstrike = true;
	[0] call SOCK_fnc_updatePartial;
};