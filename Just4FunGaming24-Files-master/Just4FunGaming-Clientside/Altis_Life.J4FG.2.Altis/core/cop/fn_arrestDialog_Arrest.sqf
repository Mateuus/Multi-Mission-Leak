private ["_time"];

if( playerSide != west ) exitWith {};
if( isNil "XY_currentInteraction" ) exitWith {
    hint "Ungültiges Ziel"
};

//Get minutes
_time = ctrlText 1400;

if(! ([_time] call XY_fnc_isnumber)) exitWith { 
    hint "Du musst eine Zahl eingeben";
};

_time = parseNumber _time;
_time = round _time;

if(_time < 5 || _time > 60) exitWith { hint "Die Gefängniszeit darf nur zwischen 5 und 60 Minuten betragen"; };

closeDialog 0; 
[XY_currentInteraction, _time] call XY_fnc_arrestAction;