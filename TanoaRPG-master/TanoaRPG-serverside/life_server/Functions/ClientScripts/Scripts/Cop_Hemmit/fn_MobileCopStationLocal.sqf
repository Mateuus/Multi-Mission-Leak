/*
	File: fn_MobileCopStation.sqf
	Author: CooliMC "Marc" aka d25fg7r5s4
	
	Description:
	Starts the construction of the mobile Cop Station ! PLS DONt STEAL THIS SCRIPT !!!! IF YOU WANT TO USE IT FOR YOUR SERVER PLS ASK ME IN STEAM (http://steamcommunity.com/id/CooliMC) !!!
*/

private["_vehicle","_parts"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};

if(!("B_Truck_01_mover_F" == typeOf _vehicle)) exitWith {};


if(_vehicle getVariable "construction") then
{
	_vehicle allowDamage false;
	_vehicle setFuel 0;
	_vehicle enableSimulation false;

	_parts = _vehicle getVariable "p1";
	_parts allowDamage false;
	_parts enablesimulation false; 
	_parts attachTo [_vehicle, [0.06, -0.2, 1.6]];
	detach _parts;
	_vehicle disableCollisionWith _parts;

	_parts = _vehicle getVariable "p2";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [7.0, -3.0, 6.4]];
	detach _parts;

	_parts = _vehicle getVariable "p3";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [7.0, 1.0, 5.5]];
	detach _parts;

	_parts = _vehicle getVariable "p4";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [7.0, 0.9, 5.5]];
	detach _parts;

	_parts = _vehicle getVariable "p5";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [7.0, -1.2, 5.5]];
	detach _parts;

	_parts = _vehicle getVariable "p17";
	_parts allowDamage false;
	_parts attachTo [_vehicle, [-3.5, 3.4, 5.93]];
	detach _parts;

	_parts = _vehicle getVariable "p18";
	_parts allowDamage false;
	_parts attachTo [_vehicle, [3.5, 3.4, 5.93]];
	detach _parts;

	_parts = _vehicle getVariable "p19";
	_parts allowDamage false;
	_parts attachTo [_vehicle, [7.0, 6.5, -0.6]];
	detach _parts;
	_parts setDir ((getDir _vehicle)+30);

	_parts = _vehicle getVariable "p20";
	_parts allowDamage false;
	_parts attachTo [_vehicle, [-7.0, -7.5, -0.6]];
	detach _parts;
	_parts setDir ((getDir _vehicle)+220);

	_parts = _vehicle getVariable "p23";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-6.8, -5.5, 1.9]];
	detach _parts;

	_parts = _vehicle getVariable "p24";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [0.0, 7.8, -1.3]];
	detach _parts;
	_parts setDir ((getDir _vehicle)+270);

	_parts = _vehicle getVariable "p25";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [0.0, -8.0, -1.3]];
	detach _parts;
	_parts setDir ((getDir _vehicle)+90);

	_parts = _vehicle getVariable "p26";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-6.8, 7.8, -1.3]];
	detach _parts;
	_parts setDir ((getDir _vehicle)+90);

	_parts = _vehicle getVariable "p27";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [6.8, -8.0, -1.3]];
	detach _parts;
	_parts setDir ((getDir _vehicle)+270);

	_parts = _vehicle getVariable "p6";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-0.65, -3.4, 4.65]];
	detach _parts;

	_parts = _vehicle getVariable "p7";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [1.8, 4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p8";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [2.8, 4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p9";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [3.8, 4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p10";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [4.8, 4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p11";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [5.8, 4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p12";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-1.8, -4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p13";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-2.8, -4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p14";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-3.8, -4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p15";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-4.8, -4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p16";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-5.8, -4.0, -2.6]];
	detach _parts;

	_parts = _vehicle getVariable "p21";
	_parts allowDamage false;
	_parts attachTo [_vehicle, [-6.8, -3.0, -0.1]];
	detach _parts;
	_parts setDir ((getDir _vehicle)+260);

	_parts = _vehicle getVariable "p22";
	_parts allowDamage false;
	_parts attachTo [_vehicle, [-6.8, 2.6, -0.1]];
	detach _parts;
	_parts setDir ((getDir _vehicle)+100);
	
	_vehicle attachTo [_vehicle getVariable "p1"];
	_vehicle enableSimulation true;

	_vehicle addAction ["Pillar Vorne Bewegen",
		{
			if((_this select 0) getVariable ["pillar1", true]) then
			{
				(_this select 0) setVariable ["pillar1", false, true];
				[(_this select 0), true, true] remoteExec ["tanoarpg_fnc_MobileCopStationPillar", 0, true];
			} else {
				(_this select 0) setVariable ["pillar1", true, true];
				[(_this select 0), true, false] remoteExec ["tanoarpg_fnc_MobileCopStationPillar", 0, true];
			};
		}];
	_vehicle addAction ["Pillar Hinten Bewegen",
		{
			if((_this select 0) getVariable ["pillar2", true]) then
			{
				(_this select 0) setVariable ["pillar2", false, true];
				[(_this select 0), false, true] remoteExec ["tanoarpg_fnc_MobileCopStationPillar", -2, true];
			} else {
				(_this select 0) setVariable ["pillar2", true, true];
				[(_this select 0), false, false] remoteExec ["tanoarpg_fnc_MobileCopStationPillar", -2, true];
			};
		}];
	
	_vehicle spawn
	{
		_p = [];
		for [{ _i = 1 }, { _i <= 27 }, { _i = _i + 1 }] do
		{
			_p pushBack (_this getVariable [format["p%1", _i], ObjNull]);
		};
		
		waitUntil{not alive _this || isNull _this || isNull (_p select 0)};
		if(!isNull (_p select 0)) then
		{
			{ if(!isNull _x) then {deleteVehicle _x} } forEach _p;
		};
	};
}
else
{
	_vehicle enableSimulation false;
	removeAllActions _vehicle;

	_parts = _vehicle getVariable "a2";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [0.5, -1.85, -0.33]];
	_parts setVectorUp [0 , 1000000000000 , 1];

	_parts = _vehicle getVariable "a3";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-0.5, -1.85, -0.33]];
	_parts setVectorUp [0 , 1000000000000 , 1];

	_parts = _vehicle getVariable "a4";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [0.0, -1.85, -0.33]];
	_parts setVectorUp [0 , 1000000000000 , 1];

	_parts = _vehicle getVariable "a1";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [0, -1.1, -0.15]];
	_parts setVectorDirAndUp [[1,0,0],[0,0,1]];

	_parts = _vehicle getVariable "a7";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [-1.0, -0.25, 0.8]];
	_parts setVectorDirAndUp [[1,0,0],[0,0,1]];
	_parts setvectorup [100 , -0.192 , 1];

	_parts = _vehicle getVariable "a5";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [0.0, 0.0, 1.055]];
	_parts setvectorup [ 0, 4, 1];

	_parts = _vehicle getVariable "a6";
	_parts allowDamage false;
	_parts enablesimulation false;
	_parts attachTo [_vehicle, [0.7, -2.0, 0.28]];
	_parts setVectorDirAndUp [[-1,-1000000000000000,0],[0,0,1]];
	_parts setvectorup [0 , -75 , -1];

	detach _vehicle;
	_vehicle setFuel (_vehicle getVariable "Fuel");
	_vehicle allowDamage true;
	_vehicle enableSimulation true;
	
	_vehicle spawn
	{
		_p = [];
		for [{ _i = 1 }, { _i <= 7 }, { _i = _i + 1 }] do
		{
			_p pushBack (_this getVariable [format["a%1", _i], ObjNull]);
		};
		
		waitUntil{not alive _this || isNull _this || isNull (_p select 0)};
		if(!isNull (_p select 0)) then
		{
			{ if(!isNull _x) then {deleteVehicle _x} } forEach _p;
		};
	};
};