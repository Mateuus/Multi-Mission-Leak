#include "..\..\script_macros.hpp"

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
if(_time < 5 || _time > 17) exitWith { hint "You can only send to jail between 5-17 minutes!"; };
closeDialog 0;
[life_pInact_curTarget, _time] call life_fnc_arrestAction;