/*
	File: fn_MobileCopStationPillar.sqf
	Author: CooliMC "Marc" aka d25fg7r5s4
	
	Description:
	Starts the construction of the mobile Cop Station ! PLS DONt STEAL THIS SCRIPT !!!! IF YOU WANT TO USE IT FOR YOUR SERVER PLS ASK ME IN STEAM (http://steamcommunity.com/id/CooliMC) !!!
*/
private["_vehicle","_part1","_part2"];
_vehicle = [_this ,0, ObjNull, [ObjNull]] call BIS_fnc_param;
_part1 = [_this, 1, false, [false]] call BIS_fnc_param;
_part2 = [_this, 2, false, [false]] call BIS_fnc_param;

if(isNull _vehicle)  exitWith {};

if(_part1) then {
	if(_part2) then {
		(_vehicle getVariable "p7") attachTo [_vehicle, [1.8, 4.0, -4.6]];
		(_vehicle getVariable "p8") attachTo [_vehicle, [2.8, 4.0, -4.6]];
		(_vehicle getVariable "p9") attachTo [_vehicle, [3.8, 4.0, -4.6]];
		(_vehicle getVariable "p10") attachTo [_vehicle, [4.8, 4.0, -4.6]];
		(_vehicle getVariable "p11") attachTo [_vehicle, [5.8, 4.0, -4.6]];
		detach (_vehicle getVariable "p7");
		detach (_vehicle getVariable "p8");
		detach (_vehicle getVariable "p9");
		detach (_vehicle getVariable "p10");
		detach (_vehicle getVariable "p11");
	} else {
		(_vehicle getVariable "p7") attachTo [_vehicle, [1.8, 4.0, -2.6]];
		(_vehicle getVariable "p8") attachTo [_vehicle, [2.8, 4.0, -2.6]];
		(_vehicle getVariable "p9") attachTo [_vehicle, [3.8, 4.0, -2.6]];
		(_vehicle getVariable "p10") attachTo [_vehicle, [4.8, 4.0, -2.6]];
		(_vehicle getVariable "p11") attachTo [_vehicle, [5.8, 4.0, -2.6]];
		detach (_vehicle getVariable "p7");
		detach (_vehicle getVariable "p8");
		detach (_vehicle getVariable "p9");
		detach (_vehicle getVariable "p10");
		detach (_vehicle getVariable "p11");
	};
} else {
	if(_part2) then {
		(_vehicle getVariable "p12") attachTo [_vehicle, [-1.8, -4.0, -4.6]];
		(_vehicle getVariable "p13") attachTo [_vehicle, [-2.8, -4.0, -4.6]];
		(_vehicle getVariable "p14") attachTo [_vehicle, [-3.8, -4.0, -4.6]];
		(_vehicle getVariable "p15") attachTo [_vehicle, [-4.8, -4.0, -4.6]];
		(_vehicle getVariable "p16") attachTo [_vehicle, [-5.8, -4.0, -4.6]];
		detach (_vehicle getVariable "p12");
		detach (_vehicle getVariable "p13");
		detach (_vehicle getVariable "p14");
		detach (_vehicle getVariable "p15");
		detach (_vehicle getVariable "p16");
	} else {
		(_vehicle getVariable "p12") attachTo [_vehicle, [-1.8, -4.0, -2.6]];
		(_vehicle getVariable "p13") attachTo [_vehicle, [-2.8, -4.0, -2.6]];
		(_vehicle getVariable "p14") attachTo [_vehicle, [-3.8, -4.0, -2.6]];
		(_vehicle getVariable "p15") attachTo [_vehicle, [-4.8, -4.0, -2.6]];
		(_vehicle getVariable "p16") attachTo [_vehicle, [-5.8, -4.0, -2.6]];
		detach (_vehicle getVariable "p12");
		detach (_vehicle getVariable "p13");
		detach (_vehicle getVariable "p14");
		detach (_vehicle getVariable "p15");
		detach (_vehicle getVariable "p16");
	};
};