/*

	Player clicked arrest/ok

*/

private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hint "Invalid destination."};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call TEX_fnc_isnumber)) exitWith
{
	hint "Du kannst nur Zahlen eingeben.";
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 1 || _time > 20) exitWith { hint hint "Die Haftstrafe muss zwischen 1 und 20 Minuten liegen."; };

closeDialog 0; 
[life_pInact_curTarget, _time] call tanoarpg_fnc_arrestAction;