switch (Jz) do {
	case 3: {
		"colorCorrections" ppEffectAdjust [1.1, 1.00, -0.1, [3.5, 3.5, 2.8, -0.04], [0.55, 0.55, 0.72, 1.35],  [0.799, 0.587, 0.514, 2000.03]];     
		"colorCorrections" ppEffectCommit 1;
		"colorCorrections" ppEffectEnable true;
	};
	case 4: {
			/* 
			Goon/Gooncorp 2015
			call from init.sqf
			[] execVM "goon_snowstorm.sqf"; 
			*/
		_alpha = .55 + random 0.12;// set the alpha of the particles
		"colorCorrections" ppEffectAdjust [1, 1, 0, [0.01, 0.02, 0.04, 0.01], [0.87, 1.08, 1.196, 0.3], [0.399, 0.287, 0.014, 0.0]]; 				
		"colorCorrections" ppEffectCommit 0; 
		"colorCorrections" ppEffectEnable TRUE;
		[_alpha] spawn {  
			while {life_settings_enableSnow} do {
				private["_obj","_pos","_velocity","_snowflakes1","_snowflakes2"];
				_obj = (vehicle player);
				_pos = getposASL _obj;
				setwind [0.401112*2,0.204166*2,false];
				_velocity = wind;  

				_snowflakes1 = "#particlesource" createVehicleLocal _pos; 
				//_snowflakes1  attachto [player, [0,0,12]];
				_snowflakes1  setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 14, 2, 0], "", "Billboard", 1, 22, [0, 0, 6], _velocity, (0), 1.69, 1, 1, [1.5], [[1,1,1,0],[1,1,1,1],[1,1,1,1]],[1000], 0, 0, "", "", _obj];
				_snowflakes1  setParticleRandom [0, [24 + (random 2),24 + (random 2), 4], [0, 0, 0], 0, 0, [0, 0, 0, .03], 0, 0];
				_snowflakes1  setParticleCircle [0, [0, 0, 0]];
				_snowflakes1  setDropInterval 0.001; 

				_snowflakes2 = "#particlesource" createVehicleLocal _pos; 
				//_snowflakes2  attachto [player, [0,0,12]];
				_snowflakes2  setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 2, 0], "", "Billboard", 1, 14, [0, 0, 6], _velocity, (0), 1.39, 0, 0, [.2], [[1,1,1,0],[1,1,1,1],[1,1,1,1]],[1000], 0, 0, "", "", _obj];
				_snowflakes2  setParticleRandom [0, [14 + (random 2),14 + (random 2), 5], [0, 0, 0], 0, 0, [0, 0, 0, 2], 0, 0];
				_snowflakes2  setParticleCircle [0, [0, 0, 0]];
				_snowflakes2  setDropInterval 0.004; 

				sleep 30;
				deletevehicle _snowflakes1;
				deletevehicle _snowflakes2;
			};
		};
	};
};