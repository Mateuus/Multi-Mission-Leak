/*
	File: initPlayerLocal.sqf

	Description:
	Starts the initialization of the player.
*/
//"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call DWEV_fnc_MPexec};
if (!hasInterface) exitWith {[] call compile PreprocessFileLineNumbers "\DWEV_server\init.sqf";}; //This is a headless client, he doesn't need to do anything but keep being headless..
if (! isNil "DWEV_ExtraIsInstalled") then
{
	if (DWEV_ExtraIsInstalled) then
	{
		[] call compile PreprocessFileLineNumbers "\dw_extra\initMission.sqf";
	};
};
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "core\init.sqf";

call DWEV_fnc_initgasVehicle;
//Execute JIP code.
if((_this select 1)) then
{
	[] execVM "core\jip.sqf";
};
