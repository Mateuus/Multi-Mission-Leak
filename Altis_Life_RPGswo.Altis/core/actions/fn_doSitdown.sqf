/*
	File: fn_doSitdown.sqf
	Author: BreedXLP
	
	Description:
	Sit down on Chair
*/
private["_unit"];
_unit = _this select 0;

if (DWEV_doSit) exitWith {[_unit] call DWEV_fnc_doStandup;};

_chair = nearestObjects [_unit, ["Land_ChairWood_F","Land_WoodenLog_F","Land_Bench_F","Land_CampingChair_V1_F","Land_CampingChair_V2_F","Land_ChairPlastic_F","Land_Bench_01_F","Land_Bench_02_F"], 0.8] select 0;

if (count nearestObjects [_unit, ["Land_ChairWood_F","Land_WoodenLog_F","Land_Bench_F","Land_CampingChair_V1_F","Land_CampingChair_V2_F","Land_ChairPlastic_F","Land_Bench_01_F","Land_Bench_02_F"], 0.8] < 1) exitWith {};

_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _chair);
_obj setDir ((getDir _chair) - 180); 
_obj setPosATL (getPosATL _chair);

_unit attachTo [_obj,[0,0,0]];

[_unit,"HubSittingChairB_idle1"] remoteExec ["DWEV_fnc_animSync",-2];

DWEV_doSit = true;

[_unit] spawn
{
	_unit1 = _this select 0;
	sleep 1;
	detach _unit1;
};


