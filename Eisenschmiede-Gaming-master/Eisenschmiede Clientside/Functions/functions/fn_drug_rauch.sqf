_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _unit) exitWith {};

_pa = "#particlesource" createVehicle (getpos _unit);
_pa setParticleCircle [0, [0, 0, 0]];
_pa setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_pa setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 1, 2, 8,0], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0.5], 0, 10.1, 7.9, 0.01, [0.1, 0.1, 0.1], [[1,1,1,1], [1,1,1,1]], [0.3,0.2], 1, 0, "", "", nil];
_pa setDropInterval 0.015;
_pa attachTo [_unit,[0,0,0],"head"];
sleep 150;
detach _pa;
deleteVehicle _pa;
