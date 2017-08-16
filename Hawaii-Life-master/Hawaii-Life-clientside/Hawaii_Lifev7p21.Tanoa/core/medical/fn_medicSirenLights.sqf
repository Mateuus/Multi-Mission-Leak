#include "..\..\script_macros.hpp"
/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private ["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["C_Offroad_01_repair_F","C_SUV_01_F","B_Truck_01_mover_F","B_MRAP_01_F","B_Heli_Light_01_F","O_Heli_Transport_04_F","I_Heli_Transport_02_F","C_Offroad_02_unarmed_F","O_T_VTOL_02_vehicle_F"])) exitWith {};

_trueorfalse = _vehicle GVAR ["lights",FALSE];

if(_trueorfalse) then {
	_vehicle SVAR ["lights",FALSE,TRUE];
} else {
	_vehicle SVAR ["lights",TRUE,TRUE];
	[_vehicle,0.22] remoteExec ["life_fnc_medicLights",RCLIENT];
};