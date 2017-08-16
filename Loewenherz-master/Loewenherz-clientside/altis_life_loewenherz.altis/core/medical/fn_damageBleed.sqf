/***********************************************************
PROCESS DAMAGE TO A UNIT
- Function fnc_usec_damageBleed: Draw a creepy blood stream from a player limb
- [_unit, _wound, _injury] call fnc_usec_damageBleed;
************************************************************/
private["_wound","_modelPos","_point","_source"];
_unit = _this select 0;
_wound = _this select 1;

if (isServer) exitWith{}; // no graphical effects on server!

	_modelPos = [0,0,0];

	switch (_wound) do {
		case "Pelvis": {
			_modelPos = [0,0,0.2];
		};
		case "aimpoint": {
			_rndX = (0.1 - random 0.2);
			_modelPos = [_rndX,0,0.2];
		};
		case "RightShoulder": {
			_modelPos = [0,0,-0.1];
		};
		case "LeftShoulder": {
			_modelPos = [0,0,-0.1];
		};
		//added visual wounds to foots
		case "RightFoot": {
			_modelPos = [0,0,0.2];
		};
		case "LeftFoot": {
			_modelPos = [0,0,0.2];
		};
	};

	while {1 == 1} do {
		scopeName "main";
		waitUntil {(vehicle _unit == _unit)};

			//Blood partical
			_point = "Logic" createVehicleLocal getPosATL _unit;
			_source = "#particlesource" createVehicleLocal getPosATL _unit;
			_source setParticleParams
			/* Sprite */			[["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 13, 1, 0],"",	// File,Ntieth,Index,Count,Loop(Bool)
			/* Type */				"Billboard",
			/* TimmerPer */			1,
			/* lhmtime */			0.2,
			/* Position */			[0,0,0],
			/* MoveVelocity */		[0,0,0.5],
			/* Simulation */		1,0.32,0.1,0.05,	//rotationVel,weight,volume,rubbing
			/* Scale */				[0.05,0.25],
			/* Color */				[[0.2,0.01,0.01,1],[0.2,0.01,0.01,0]],
			/* AnimSpeed */			[0.1],
			/* randDirPeriod */		0,
			/* randDirIntesity */	0,
			/* onTimerScript */		"",
			/* DestroyScript */		"",
			/* Follow */			_point];
			_source setParticleRandom [2, [0, 0, 0], [0.0, 0.0, 0.0], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
			_source setDropInterval 0.02;
			_point attachTo [_unit,_modelPos,_wound];


		sleep 5;

		while {((!LHM_Disease_healed) and (alive _unit))} do {
			scopeName "loop";
			if (vehicle _unit != _unit) then {
				BreakOut "loop";
			};
			sleep 1;
		};
		deleteVehicle _source;
		deleteVehicle _point;

		if (!LHM_Disease_healed) then {
			BreakOut "main";
		};
	};

	deleteVehicle _source;
	deleteVehicle _point;