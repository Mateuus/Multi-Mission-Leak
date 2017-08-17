#include "..\lb_script_macros.hpp"
#include "..\..\script_macros.hpp"
/*
	File: fn_vis_setup.sqf
	Author: Leon "DerL30N" Beeser
	
	Description:
	Starts the VIS System
*/

if(!isServer) then 
{
	if ((vis_isActive) && (vehicle player != player) && (driver (vehicle player) == player) && ((vehicle player isKindOf "Car") OR (vehicle player isKindOf "Air") OR (vehicle player isKindOf "Ship"))) then 
	{
		_veh = vehicle player;
		_vInfo = _veh getVariable ["dbInfo",[]];
		if (!(count _vInfo isEqualTo 0)) then  {
			diag_log "--- VIS -> Starting -> Perm Vehicle -> DB Connecting... ---";
			[player,_veh,true] remoteExecCall ["life_fnc_vehicleInfoUpdate",RSERV];//Database veh only
		} else {
			[0,false] spawn life_fnc_visVehInfo;
			diag_log "--- VIS -> Starting -> Rental Vehicle ---";
		};
	};
};