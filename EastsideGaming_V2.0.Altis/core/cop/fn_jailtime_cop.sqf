#include "..\..\script_macros.hpp"
/*
 Player clicked arrest/ok
*/
private ["_time"];
if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {};
//Get minutes
_time = ctrlText 1400;
if(! ([_time] call TON_fnc_isnumber)) exitWith {
 hint localize "STR_ATM_notnumeric";
};
_time = parseNumber _time; //requested number
_time = round _time;
if(_time < 5 || _time > 90) exitWith { hint "Du kannst Personen nur zwischen 5-90 Minuten inhaftieren!"; };
closeDialog 0;
[life_pInact_curTarget, _time] call life_fnc_arrestAction;
_log = format["%1 (%2) hat %3 (%4) für %5 Minuten ins Gefängnis gesteckt.", player getVariable["realname", name player], getPlayerUID player, life_pInact_curTarget getVariable["realname", name life_pInact_curTarget], getPlayerUID life_pInact_curTarget, [_time]call life_fnc_numberText];
["JAIL_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];