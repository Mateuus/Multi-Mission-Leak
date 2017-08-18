/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "SpyGlass\fn_initSpy.sqf";
[] execVM "core\init.sqf";

//Custom Kai
[] execVM "core\functions\fn_emptyFuel.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

pb_positionen = [[12196.7,13975.8,0.00143433],[12150.5,13954.4,0.00146484],[12166.4,13962.4,0.00144482],[12191.8,13957.1,0.00143909],[12176.6,13976.9,0.00143909],[12185.1,13992.6,0.00143909],[12206.5,13957.9,0.00142097],[12163.2,13943.2,0.0014267],[12149.5,13963.7,0.00142097],[12165.2,13978.9,0.00143528]];
joinmode = 0;