// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( !(XY_medicLevel in [1, 2, 3, 4, 5, 6, 7]) ) exitWith {
	["Notwhitelisted", false, true] call BIS_fnc_endMission;
	sleep 30;
};

XY_PC = switch( XY_medicLevel ) do {
	case 1: { 16000 };
	case 2: { 18000 };
	case 3: { 19000 };
	case 4: { 21000 };
	case 5: { 23000 };
	case 6: { 24000 };
	case 7: { 27000 };
};

XY_i_eventItem_8 = 15;
XY_i_eventItem_9 = 15;