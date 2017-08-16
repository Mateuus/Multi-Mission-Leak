#define GVARJIP _x getVariable "life_VEH_color"
#define JIPCLR [_x,_index] spawn life_fnc_colorVehicle;
#include "scripts\SHK_Fastrope.sqf"
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!hasInterface) exitWith {};
[] execVM "core\init\briefing.sqf";
[] execVM "core\init\KRON_Strings.sqf";
[] execVM "core\init.sqf";
if((_this select 1)) then {
	{
		_index = GVARJIP;
		if(!isNil "_index") then {JIPCLR};
	} foreach (allMissionObjects "Car");
	{
		_index = GVARJIP;
		if(!isNil "_index") then {JIPCLR};
	} foreach (allMissionObjects "Air");
};
pb_positionen = [[12196.7,13975.8,0.00143433],[12150.5,13954.4,0.00146484],[12166.4,13962.4,0.00144482],[12191.8,13957.1,0.00143909],[12176.6,13976.9,0.00143909],[12185.1,13992.6,0.00143909],[12206.5,13957.9,0.00142097],[12163.2,13943.2,0.0014267],[12149.5,13963.7,0.00142097],[12165.2,13978.9,0.00143528]];
joinmode = 0;