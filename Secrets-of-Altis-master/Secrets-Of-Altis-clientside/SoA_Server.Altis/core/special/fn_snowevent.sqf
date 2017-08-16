private ["_obj", "_pos", "_snow", "_fog", "_umgebung", "_time","_action"];

if(snowevent) exitWith {};
snowevent = true;

[] spawn {
_time = 10;

setWind [2.342, 3.108, true];
sleep _time;

_obj = player;
_pos = (getPos _obj);


snow = "#particlesource" createVehicleLocal _pos; 
snow setParticleParams [

   ["\A3\Data_f\cl_water.p3d",
    1,
    1,
    1],
   "",
   "Billboard",
   1,
   7,
   
   [0, 0, 20.0],
   [0, 0, -0.35],
   1.0,
   0.000001,
   0.0,
   0.2,

   [0.07,0.07],
   [[1.0,1.0,1.0,1.0],
    [0.94,0.94,0.96,1.0],
    [1.0,1.0,1.0,1.0]],
   [0, 1],
   0,
   0.01,
   "",
   "",
   _obj
];
snow setParticleRandom [
   2,
   [35, 35, 10],
   [0.0, 0.0, -0.1],
   0.001,
   0.05,
   [0.01, 0.01, 0.01, 0.02],
   0.002,
   360
];
snow setParticleCircle [
   0,
   [0.0, 0.0, -0.1]
];
snow setDropInterval 0.001;


foggy = "#particlesource" createVehicleLocal _pos; 
foggy setParticleParams [
   ["\A3\Data_f\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, 
   [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, 
   [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
];
foggy setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
foggy setParticleCircle [0.1, [0, 0, -0.12]];
foggy setDropInterval 0.05;

	while {!isnil "snow"} do 
	{
		_pos = (getPos _obj);
		snow setpos _pos;
		foggy setpos _pos;
	   sleep 5;
	};
};