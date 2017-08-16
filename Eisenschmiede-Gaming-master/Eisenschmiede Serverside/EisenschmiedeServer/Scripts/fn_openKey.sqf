#include "..\script_macros.hpp"
_mode = [_this,0,-1,[0]] call BIS_fnc_param;

switch (_mode) do {

    case 1 {
		if(FETCH_CONST(ES_adminlevel) = 1) then {}else{
		_toLog = format ["Name %1  UID %2  Seite %3  CursorTarget %4  Position %5  Bank %6 $  ES IST VIELLEICHT EIN HACKER NICH SICHER!!!!! ER HAT DIE TASTE F2 GEPUSCHT. F2 IST BEI INFICKTUS SPIELER AUS FAHRZEUG WERFEN", name player, getPlayerUID player, side player, cursorTarget, mapGridPosition player, [ES_atmbank] call ES_fnc_numberText];
		["HACK_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];	
		if (ES_atmbank = 80000 ) then {
			_toLog = format ["Name %1  UID %2  Weniger Als 80k und F2 TASTE", name player, getPlayerUID player];
			["HACK_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];	
			};
		};
	};

	case 2 {
		if(FETCH_CONST(ES_adminlevel) = 1) then {}else{
		_toLog = format ["Name %1  UID %2  Seite %3  CursorTarget %4  Position %5  Bank %6 $  ES IST VIELLEICHT EIN HACKER NICH SICHER!!!!! ER HAT DIE TASTE F3 GEPUSCHT. F3 IST BEI INFICKTUS SPIELER FRAMEN", name player, getPlayerUID player, side player, cursorTarget, mapGridPosition player, [ES_atmbank] call ES_fnc_numberText];
		["HACK_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];	
		if (ES_atmbank = 80000 ) then {
			_toLog = format ["Name %1  UID %2  Weniger Als 80k und F3 TASTE", name player, getPlayerUID player];
			["HACK_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];	
			};
		};
	};

    default {
		_toLog = format ["Name %1  UID %2  Seite %3  CursorTarget %4  Position %5  Bank %6 $  CASE DEFAULT ERROR", name player, getPlayerUID player, side player, cursorTarget, mapGridPosition player, [ES_atmbank] call ES_fnc_numberText];
		["HACK_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];	
	};
};