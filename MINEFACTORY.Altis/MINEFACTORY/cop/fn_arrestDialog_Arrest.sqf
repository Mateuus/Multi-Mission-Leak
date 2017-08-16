private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hintSilent "Invalid destination."};

_time = ctrlText 1400;


if(! ([_time] call TON_fnc_isnumber)) exitWith
{
	hintSilent "You have to enter a number.";
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 5 || _time > 120) exitWith { hintSilent hintSilent "You can only go to jail between 5-120 minutes!"; };

closeDialog 0; 
[life_pInact_curTarget, _time] call life_fnc_arrestAction;