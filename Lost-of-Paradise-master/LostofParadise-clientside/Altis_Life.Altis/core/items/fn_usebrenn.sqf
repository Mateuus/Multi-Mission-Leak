/*
script made by spll3r.
*/

_tentSpawnPosition = player modelToWorld[0,4,0];
_tentSpawnPosition set [2,0];

hint "Du baust deine Destillieranlage auf";	 
  //Land_CanisterOil_F  Land_Bucket_F 
  
  
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 7;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 7;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 7;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 7;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 5; 
			
		_tent = createVehicle ["Land_Tank_rust_F", [1.6650946,1.6626484,5], [], 0, "CAN_COLLIDE"];
		_tent setDir 90;
		_chair = createVehicle ["Land_BarrelWater_F", [5.2369072,2.8136106,5], [], 0, "CAN_COLLIDE"];
		_fire = createVehicle ["FirePlace_burning_F", [2.5509803,3.8476455,5], [], 0, "CAN_COLLIDE"];
		_light = createVehicle ["CamoNet_INDP_big_F", [0.98040187,3.285964,5], [], 0, "CAN_COLLIDE"];
		_fasser = createVehicle ["Land_WaterTank_F", [3.98040187,3.585964,5], [], 0, "CAN_COLLIDE"];
		_mauer = createVehicle ["Land_Wall_Tin_4", [8.98040187,3.185964,5], [], 0, "CAN_COLLIDE"];
		_zelt = createVehicle ["Land_TentDome_F", [9.98040187,4.185964,5], [], 0, "CAN_COLLIDE"];
		_stapel = createVehicle ["Land_Pallets_stack_F", [9.48040187,4.485964,5], [], 0, "CAN_COLLIDE"];
		_motor =  createVehicle ["Land_Portable_generator_F", [9.48040187,4.485964,5], [], 0, "CAN_COLLIDE"];
		_fass =  createVehicle ["Land_WaterBarrel_F", [9.48040187,4.485964,5], [], 0, "CAN_COLLIDE"];
		_leitung = createVehicle ["Land_CanisterOil_F", [9.48040187,4.185964,5], [], 0, "CAN_COLLIDE"];
		_eimer = createVehicle ["Land_Bucket_F", [9.58040187,4.285964,5], [], 0, "CAN_COLLIDE"];
		_feuer1 = createVehicle ["FirePlace_burning_F", [9.78040187,4.485964,5], [], 0, "CAN_COLLIDE"];
		_feuer2 = createVehicle ["FirePlace_burning_F", [0.48040187,4.385964,5], [], 0, "CAN_COLLIDE"];
	
		_chair attachTo [_tent];
		_fire attachTo [_tent];
		_light attachTo [_tent];
		_fasser attachTo [_tent];
		_mauer attachTo [_tent];
		_zelt attachTo [_tent];
		_stapel attachTo [_tent];
		_motor attachTo [_tent];
		_fass attachTo [_tent];
		_leitung attachTo [_tent];
		_eimer attachTo [_tent];
		_feuer1 attachTo [_tent];
		_feuer2 attachTo [_tent];
		
		
		_tent setDir (floor (random 360));		
		_tent setPos (_tentSpawnPosition);
		_tent setPosATL [(getPosATL _tent) select 0, (getPosATL _tent) select 1, 0];
		
		_chair setDir (+63.3056);
		_chair setPos (getPos _chair);
		_chair setPosATL [(getPosATL _chair) select 0, (getPosATL _chair) select 1, 0];
		_chair attachTo [_tent, [-3.2, 0, -1] ];
		
		_fire setPos (getPos _fire);
		_fire setPosATL [(getPosATL _fire) select 0, (getPosATL _fire) select 1, 0];
		_fire attachTo [_tent, [0, 0, -1.5] ]; 
		
		_light setPos (getPos _light);
		_light setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_light attachTo [_tent, [-3.2, 0, 0.5] ];
		
		_fasser setDir (+63.3056);
		_fasser setPos (getPos _light);
		_fasser setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_fasser attachTo [_tent, [-7.2, -1.5, -0.48] ];
		
		_mauer setPos (getPos _light);
		_mauer setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_mauer attachTo [_tent, [0, -5, -0.8] ];
		
		_zelt setDir (+403.3056);
		_zelt setPos (getPos _light);
		_zelt setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_zelt attachTo [_tent, [-4.8, 2.8, -0.85] ];
		
		_stapel setPos (getPos _light);
		_stapel setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_stapel attachTo [_tent, [1.5, 2.6, -0.9] ];
		
		_motor setDir (+90);
		_motor setPos (getPos _light);
		_motor setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_motor attachTo [_tent, [1.5, 1.6, 0] ];
		
		_fass setPos (getPos _light);
		_fass setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_fass attachTo [_tent, [1.5, 2.55, 0.1] ];
		_fass addaction ["Maische herstellen",life_fnc_maische];
		
		_leitung setPos (getPos _light);
		_leitung setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_leitung attachTo [_tent, [-3.45, 0, -1.1] ];
		
		_eimer setPos (getPos _light);
		_eimer setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_eimer attachTo [_tent, [-3.65, 0, -1.2] ];
		_eimer addaction ["Schnaps destillieren",life_fnc_desti];
		
		_feuer1 setPos (getPos _light);
		_feuer1 setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_feuer1 attachTo [_tent, [0.8, 0, -1.5] ]; 
		
		_feuer2 setPos (getPos _light);
		_feuer2 setPosATL [(getPosATL _light) select 0, (getPosATL _light) select 1, 0];
		_feuer2 attachTo [_tent, [-0.8, 0, -1.5] ]; 
		
		_tent enableSimulation false;
		_chair enableSimulation false;
		_fire enableSimulation false;
		_light enableSimulation false;
		_fasser enableSimulation false;
		_mauer enableSimulation false;
		_zelt enableSimulation false;
		_stapel enableSimulation false;
		_motor enableSimulation false;
		_fass enableSimulation false;
		_leitung enableSimulation false;
		_eimer enableSimulation false;
		_feuer1 allowdamage false;
		_feuer2 allowdamage false;
		
		/*
		// die whileschleife funzt komischer weise nicht also alt bewährte methode ;)
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100]];};
		sleep 5*60;
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100.5]];};
		sleep 5*60;
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100.5]];};
		sleep 5*60;
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100.5]];};
		sleep 5*60;
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100.5]];};
		sleep 5*60;
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100.5]];};
		sleep 5*60;
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100.5]];};
		sleep 5*60;
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100.5]];};
		sleep 5*60;
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100.5]];};
		sleep 5*60;
		_smoke = "SmokeShell" createVehicle position _light;
		_smoke attachTo [_tent, [0,-0.1,100.5]];};
		sleep 5*60;
		/////////////////////////////////////////////////////////
		*/
		