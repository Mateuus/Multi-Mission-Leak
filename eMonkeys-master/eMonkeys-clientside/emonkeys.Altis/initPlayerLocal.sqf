#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);

EMonkeys_fnc_statusBar = compilefinal preprocessFileLineNumbers "core\function\fn_statusBar.sqf";

[] execFSM "core\fsm\init.fsm";
