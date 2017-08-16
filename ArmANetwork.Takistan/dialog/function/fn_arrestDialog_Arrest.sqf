/*

	Player clicked arrest/ok

*/

private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hint localize "STR_MISC_WrongTarget"};

_time = ctrlText 1400;

if(! ([_time] call TON_fnc_isnumber)) exitWith
{
	hint localize "STR_Shop_Virt_NoNum";
};

_time = parseNumber _time;
_time = round _time;

if(_time < 5 || _time > 60) exitWith { hint localize "STR_Jail_Time_Range"; };

closeDialog 0;
[life_pInact_curTarget, _time] call life_fnc_arrestAction;
