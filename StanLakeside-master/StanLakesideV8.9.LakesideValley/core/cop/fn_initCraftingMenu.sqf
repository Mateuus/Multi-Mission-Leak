#include <macro.h>
/*
fn_initCustomCharge.sqf
Kevin Webb
Let the insanity of custom bounty strings and values ensue!
*/
private["_reason","_amount","_unit"];

_craftSelect = lbData[1338,lbCurSel (1338)];
_craftSelect = call compile format["%1", _unit];
if(isNil "_craftSelect") exitwith {};
if(isNull _craftSelect) exitWith {};

createDialog "Life_craftMenu_ui";
waitUntil{!isNull (findDisplay 13371)};
waitUntil{isNull (findDisplay 13371) || life_charged};
if(!(life_charged)) exitWith {};
life_charged = false;
_amount = ctrlText 7331;
_reason = ctrlText 7332;
_reasonPlus = format["%2 by Officer: %1",name player,_reason];
if(!([_amount] call fnc_isnumber)) exitWith {["You didn't enter an actual number.", false] spawn domsg; closeDialog 0;};
if(parseNumber(_amount) <= 0) exitWith { ["Invalid number", false] spawn domsg; closeDialog 0; };
if(parseNumber(_amount) > 15000) exitwith { ["Value above 15000", false] spawn domsg;  closeDialog 0; };
if(count _reason > 25) exitWith {["Your custom charge is too long, please shorten it before filing.", false] spawn domsg; closeDialog 0;};
[getPlayerUID _unit,name _unit,[_reasonPlus,parseNumber(_amount)]] remoteExec ["life_fnc_wantedAdd",2];
closeDialog 0;
[0,format["%1 jest poszukiwany za %3: Dodane przez %2",_unit getVariable["realname",name _unit],profileName,_reason]] remoteExecCall ["life_fnc_broadcast", west];