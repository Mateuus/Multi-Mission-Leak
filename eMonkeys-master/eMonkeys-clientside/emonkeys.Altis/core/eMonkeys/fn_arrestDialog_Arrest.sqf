/*

	Player clicked arrest/ok

*/

private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "EMonkeys_pInact_curTarget") exitWith {hint "Invalid destination."};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call fnc_isnumber)) exitWith
{
	hint "You have to enter a number.";
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 5 || _time > 60) exitWith { hint "You can only go to jail between 5-60 minutes people!"; };

closeDialog 0; 
[EMonkeys_pInact_curTarget, _time] call EMonkeys_fnc_arrestAction;