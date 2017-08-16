/*
	File: fn_attachSmoke.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Marijuana is bad, mmkay?
*/

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _unit) exitWith {};

_pe = "#particlesource" createVehicle (getpos _unit);
_pe setParticleCircle [0, [0, 0, 0]];
_pe setParticleRandom [2, [0.1, 0.1, 0], [0.05, 0.05, 0.3], 0.3, 0.25, [1, 1, 1, 1], 0, 0];
_pe setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 1, 2, 8,0], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.5], 0, 10.1, 7.9, 0.01, [0.1, 0.1, 0.2], [[1,1,1,1], [1,1,1,1]], [0.3,0.2], 1, 0, "", "", nil];
_pe setDropInterval 0.015;
_pe attachTo [_unit,[0,0,0],"head"];
sleep 300;
detach _pe;
deleteVehicle _pe;