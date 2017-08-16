/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren"}) exitWith {};
if(!(typeOf _vehicle in ["C_Offroad_02_unarmed_F","C_Quadbike_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_MRAP_01_F","I_Truck_02_covered_F","I_MRAP_03_F"])) exitWith {hint "Die Sirene ist für dieses Fahrzeug nicht verfügbar!";};

while {true} do
{
	if(!(_vehicle getVariable "siren")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	[_vehicle,"SirenLong"] remoteExecCall ["say3D",0];
	sleep 5.55;
	if(!(_vehicle getVariable "siren")) exitWith {};
};