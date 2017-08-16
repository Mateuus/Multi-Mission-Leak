/*

	Player clicked arrest/ok

*/

private ["_time"];

if((side player) != west) exitWith {};
if(isNil "DWEV_pInact_curTarget") exitWith {hint "Ungültige Ziel."};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call DWF_fnc_isnumber)) exitWith
{
	hint "Du musst eine Zahl eingeben.";
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 5 || _time > 30) exitWith { hint "Du kannst gefangene nur 5-30 Minuten ins Gefängnis stecken!"; };

closeDialog 0; 
[DWEV_pInact_curTarget, _time] call DWEV_fnc_arrestAction;