/*	
	Player clicked arrest/ok
*/
private ["_time"];
if !(playerSide == west || playerSide == east) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hint "Falsches Ziel."};

//Get minutes
_time = ctrlText 1400;
if(! ([_time] call TON_fnc_isnumber)) exitWith{	hint "Du musst eine Zahl eingeben.";};
_time = parseNumber _time; //requested number
_time = round _time;
if(_time < 1 || _time > 90) exitWith { hint hint "Du kannst die Zeit zwischen 1-90 minuten einstellen!"; };
closeDialog 0;
 [life_pInact_curTarget, _time] call life_fnc_arrestAction;