/*
	File: fn_alarm.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Attaches an alarm system to a vehicle.
*/
private["_unit","_type"];
_unit = cursorTarget;
_type = _this select 0;

if((_type == "caralarm") && (!(_unit isKindOf "LandVehicle"))) exitWith {hint "This alarm system can only be installed in cars or trucks."};
if((_type == "airalarm") && (!(_unit isKindOf "Air"))) exitWith {hint "This alarm system can only be installed in air vehicles."};
if(player distance _unit > 7) exitWith {hint "You need to be within 7 feet!"};
if(!([false,_type,1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

_vInfo = _unit getVariable["dbInfo",[]];
if((_vInfo select 3)) exitWith {hint "This vehicle already has an alarm system."};
if (count _vInfo == 0) exitWith {hint "This vehicle is not properly licensed and is not configured for alarms. Psst: we're on to you!"};

life_action_in_use = true;

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 1.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

life_action_in_use = false;
if(player distance _unit > 7) exitWith {titleText["You are not in range!","PLAIN"];};

_vInfo set[3, true];
_unit setVariable ["dbInfo", _vInfo, true];
titleText["You have installed an alarm system in this vehicle.","PLAIN"];

_plate = _vInfo select 1;
_uid = _vInfo select 0;
[[_plate,_uid,_unit,1,1], "DB_fnc_updateVehicle",false,false] spawn life_fnc_MP;

life_experience = life_experience + 30;