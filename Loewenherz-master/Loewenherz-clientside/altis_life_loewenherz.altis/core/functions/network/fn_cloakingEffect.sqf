private ["_Unit","_timer","_source"];

_Unit = _this select 0;
_timer = _this select 1;
_forceKill = _this select 2;

_source = "#particlesource" createVehiclelocal getpos _Unit;
_source setParticleCircle [0, [0.1, 0.1, 0.1]];
_source setParticleRandom [0, [0, 0.1, 1], [0.1, 0, 0.1], 0, 0.1, [0, 0, 0, 0.1], 0, 0];
_source setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0.5], 9, 10, 7.9, 0.1, [0.6, 1, 0.9, 0.8], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0, 0.1, 0.2, 0.5, 0.1, 0.1], 0, 0, "", "", _Unit];
_source setDropInterval 0.1;
_source attachto [_Unit,[0,0,0]];


uisleep _timer;

deleteVehicle _source;