// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( !(XY_copLevel in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) ) exitWith {
    ["NotWhitelisted", false, true] call BIS_fnc_endMission;
    sleep 30;
};

XY_PC = switch( XY_copLevel ) do {
	case 1:  {  3500 };
	case 2:  { 10000 };
	case 3:  { 15000 };
	case 4:  { 20000 };
	case 5:  { 25000 };
	case 6:  { 30000 };
	case 7:  { 35000 };
	case 8:  { 40000 };
	case 9:  { 45000 };
	case 10: { 50000 };
    default  {  1000 };
};

XY_i_eventItem_5 = 15;
XY_i_eventItem_6 = 15;