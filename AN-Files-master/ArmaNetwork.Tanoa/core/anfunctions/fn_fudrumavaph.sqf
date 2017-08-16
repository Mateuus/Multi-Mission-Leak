private["_PS","_OBJ"];

_PS = _this select 0;
_OBJ = _this select 1;
_PS setParticleCircle [0, [0, 0, 0]];
_PS setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_PS setParticleParams [["\A3\data_f\missileSmoke", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 2], [0, 0.1, 0.2], 0, 0.006, 0.005, 0.005, [1.2, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _OBJ];
_PS setDropInterval 0.05;
