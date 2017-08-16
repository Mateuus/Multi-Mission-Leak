#include <macro.h>

/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the "Demo" timer for the police.
*/
_timeRequired = param [0,5,[0]];
private["_uiDisp","_time","_timer"];
disableSerialization;
("LifeTimerLayer" call BIS_fnc_rscLayer) cutRsc ["life_timer","PLAIN",1,false];
_uiDisp = GVAR_UINS "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (_timeRequired * 60);
for "_i" from 0 to 1 step 0 do {
	if(isNull _uiDisp) then {
		("LifeTimerLayer" call BIS_fnc_rscLayer) cutRsc ["life_timer","PLAIN",1,false];
		_uiDisp = GVAR_UINS "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	if(!(fed_bank GVAR ["chargeplaced",false])) exitWith {};
	if(!alive player) exitWith {};	
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
("LifeTimerLayer" call BIS_fnc_rscLayer) cutText["","PLAIN"];
