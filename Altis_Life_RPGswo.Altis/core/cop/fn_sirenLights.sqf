#include "..\..\macros.hpp"
/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_medevac_F","C_Offroad_01_F","C_SUV_01_F","B_MRAP_01_F","I_MRAP_03_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","B_Heli_Light_01_F","I_Heli_light_03_unarmed_F","C_Van_01_box_F","B_G_Offroad_01_F","B_Heli_Transport_01_F","O_MRAP_02_F","I_Truck_02_covered_F","O_Heli_Light_02_unarmed_F","B_Truck_01_fuel_F"])) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.

_trueorfalse = _vehicle getVariable["lights",FALSE];

if(_trueorfalse) then 
{
	_vehicle setVariable["lights",FALSE,TRUE];
} 
else 
{
	_vehicle setVariable["lights",TRUE,TRUE];
	
	if ((side player) == west) then
	{
		[_vehicle,0.22] remoteExec ["DWEV_fnc_copLights",-2]; // Kein remoteExec !!!!
	};
};

