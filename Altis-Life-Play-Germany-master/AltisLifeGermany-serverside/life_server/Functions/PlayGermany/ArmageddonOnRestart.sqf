private["_restartTime"];

// 120 seconds for restart intro length
_restartTime = diag_tickTime + (3600 * 6 - 190);
PG_instantArmageddon = false;

waitUntil {sleep 1;PG_instantArmageddon OR (diag_tickTime >= _restartTime)};
PG_weatherSystemEnabled = false;
publicVariable "PG_weatherSystemEnabled";
sleep 20;

PG_fnc_armageddon_client = {

	showChat false;
	life_tagson = false;
	[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	setViewDistance 3000;
	setObjectViewDistance 3000;
	
	if(life_session_completed) then {
		[]spawn {sleep random 10; [] call SOCK_fnc_updateRequest;};
	};
	
	_makeNearObjectsInvulnerable = {
		[] spawn {
			_nearObjects = nearestObjects [player,["all"],400];
			{
				_x allowDamage false;
			} forEach _nearObjects;
		};
	};
	
	_lightnings = {
		_center = player;
		_radius = 600;
	
		_objectTypes = ["HOUSE","TREES","LAMPS"];
		_strikeCenter = [];
		_currentTarget = "";
		_centerPos = [];
		_time = time;
		while {time < _time + 12} do {
			uisleep random 3;
			_buildingStrike = false;
			_buildings = nearestObjects [_center, _objectTypes, _radius];
	
			if (count _buildings > 0) then {
				_buildingStrike = true;
				_currentTarget = _buildings call bis_Fnc_selectRandom;
				_currentTarget allowDamage false;
				_currentTargetbbr = boundingBoxReal _currentTarget;
				_p1 = _currentTargetbbr select 0;
				_p2 = _currentTargetbbr select 1;
				_targetHeight = abs ((_p2 select 2) - (_p1 select 2));
				_strikeCenter = [(getPosATL _currentTarget select 0), (getPosATL _currentTarget select 1), (getPosATL _currentTarget select 2) + _targetHeight];
			};
	
			_dir =random 360;
			uisleep random 3;
			_bolt = createvehicle ["LightningBolt",_strikeCenter,[],0,"can collide"];
			_bolt setposatl _strikeCenter;
			_bolt setdamage 1;
	
			_light = "#lightpoint" createvehiclelocal _strikeCenter;
			_light setposatl [_strikeCenter select 0,_strikeCenter select 1,(_strikeCenter select 2) + 10];
			_light setLightDayLight true;
			_light setLightBrightness 300;
			_light setLightAmbient [0.05, 0.05, 0.1];
			_light setlightcolor [1, 1, 2];
			uisleep 0.1;
			_light setLightBrightness 0;
			uisleep (random 0.1);
	
			_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
			_lightning = _class createvehiclelocal [100,100,100];
			_lightning setdir _dir;
			_lightning setpos _strikeCenter;
			_duration = random 15;
	
			for "_i" from 0 to _duration do {
				_time = time + 0.1;
				_light setLightBrightness (100 + random 100);
				waituntil {time > _time};
			};
			deletevehicle _lightning;
			deletevehicle _light;
			if (_buildingStrike) Then {
				_currentTarget allowDamage false;
			};
		};
	};
	
	
	2 fadesound 0.5;
	playSound "restart";
	hintsilent parsetext"<t size='1.5'>ACHTUNG! Weltuntergang (Serverrestart)</t><br/><br/><t size='1.3'>Bis gleich euer Play Germany Team</t>";
	
	(uiNamespace getVariable ["playerHUD",displayNull]) closeDisplay 0;
	[] spawn _makeNearObjectsInvulnerable;
	hintsilent parsetext"<t size='1.5'>ACHTUNG! Weltuntergang (Serverrestart)</t><br/><br/><t size='1.3'>Bis gleich euer Play Germany Team</t>";
	
	uisleep 18;
	cutText ["Mir wird schwindelig...","Black OUT"];
	uisleep 4;
	[] spawn _lightnings;
	cutText ["","Black in"];
	[1,10,false,true] spawn BIS_fnc_cinemaBorder;

	[] spawn BIS_fnc_earthquake;
	uisleep 8;

	[] spawn {
		playsound "earthquake_04";
		uisleep 3;
		playsound "earthquake_04";
		uisleep 3;
		playsound "earthquake_04";
		uisleep 3;
		playsound "earthquake_04";
		uisleep 3;
		playsound "earthquake_04";
		uisleep 3;
		playsound "earthquake_04";
		uisleep 3;
	};

	player spawn { uisleep 1;
	enablecamshake true;
	addcamshake [10, 70, 25];
	uisleep 60;
	enablecamshake false; };
	
	sleep 55;
	playSound "schutzsirene";
	sleep 15;
	player allowDamage false;
	disableUserInput true;
	showChat false;
	hintSilent "";
	life_tagson = false;
	setViewDistance (viewDistance*1.5);
	
	_outroCam = "camera" camCreate (player modelToWorldVisual [-5,0,1.85]);
	_outroCam cameraEffect ["internal","back"];
	_outroCam camSetFov 2.000;
	_outroCam camSetTarget vehicle player;
	_outroCam camSetRelPos [0,-1,1.85];
	
	_outroCam camCommit 0;
	waitUntil {camCommitted _outroCam};
	
	_outroCam camSetFov 2;
	_outroCam camSetRelPos [0,-5,1.85];
	_outroCam camCommit 2;
	8 cutFadeOut 3;
	waitUntil {camCommitted _outroCam};
	
	_outroCam camSetFov 9;
	_outroCam camSetRelPos [0,-5,1050.85];
	_outroCam camCommit 5;
	waitUntil {camCommitted _outroCam};
	cutText ["","BLACK",1];
	sleep 1;
	[
		"<t size='1.3' color='#cc181e'>Play Germany</t><br/>Restart! Bis gleich!<br/><br/><br/><t size='1.1'>www.play-germany.de</t>",
		0,
		0.2,
		10,
		0,
		0,
		8
	] spawn BIS_fnc_dynamicText;
	sleep 5;
	disableUserInput false;
	["Abort",true,false] spawn BIS_fnc_endMission;
	_outroCam cameraEffect ["terminate","back"];
	camDestroy _outroCam;
};
publicVariable "PG_fnc_armageddon_client";


[] remoteExec ["PG_fnc_armageddon_client",-2];
sleep 19;
//Change Weather
setDate [0,0,0,17,30];
 10 setwaves 1; 
 10 setfog 0.00; 
 10 setRain 0;
 10 setOvercast 1; 
 10 setRainbow 1;
 10 setLightnings 1;
 forceWeatherChange;
 
 999 setRain 0;


//VOLCANO SCRIPTS
PG_fnc_volcano_effect = {
	_v_pos			= _this select 0;
	_crater_radius 	= _this select 1;
	_eruption_delay	= _this select 2;
	
	_volcano_object = "Land_HelipadEmpty_F" createVehicleLocal _v_pos;
	_crater 		= "Land_HelipadEmpty_F" createVehicleLocal getPosATL _volcano_object;
	
	[_volcano_object] spawn {
		_volcano_voice = _this select 0;
		while {volcano} do { 
			_volcano_voice say3d "murmur_8";
			sleep 60;
		};
	};
	
	_cra = "#particlesource" createVehicleLocal getpos _crater;
	_cra setParticleCircle [50, [0, 0, 0]];
	_cra setParticleRandom [0, [0.25, 0.25, 0], [0, 0, 0], 0, 0.5, [0, 0, 0, 0.1], 0, 0];
	_cra setParticleParams [["\A3\data_f\ParticleEffects\Universal\StoneSmall.p3d", 1, 0, 1], "", "SpaceObject", 1, 14400, [0, 0, 0], [0, 0, 1], 0, 30, 7.9, 1, [15, 15, 15], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _crater,0,true,0.1,[[0,0,0,0]]];
	_cra setDropInterval 0.01;
	
	sleep 10;
	
	deleteVehicle _crater;
	
	while {volcano} do {
	
	if (((player distance _volcano_object)<3999) and (!isNull _volcano_object)) then {
	
	fum_obj = "Land_HelipadEmpty_F" createVehicleLocal [getPosATL _volcano_object select 0,getPosATL _volcano_object select 1,(getPosATL _volcano_object select 2)+5];
	
	li_exp = "#lightpoint" createVehicle getPosATL _volcano_object;
	li_exp lightAttachObject [_volcano_object, [0,0,30]];
	li_exp setLightAttenuation [0,0,0,0,40,600];  
	li_exp setLightIntensity 1500;
	li_exp setLightBrightness 30;
	li_exp setLightDayLight true;	
	li_exp setLightUseFlare true;
	li_exp setLightFlareSize 50;
	li_exp setLightFlareMaxDistance 2000;	
	li_exp setLightAmbient[1,0.2,0.1];
	li_exp setLightColor[1,0.2,0.1];
	
	_sare = "#particlesource" createVehicleLocal getPosATL fum_obj;
	_sare setParticleCircle [_crater_radius-40, [0, 0, 10]];
	_sare setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 13], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_sare setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 7, [0, 0, 0], [0, 0, 17], 0.3, 71, 7.9, 1, [5, 3, 1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", fum_obj,0,true,0.01,[[0,0,0,0]]];
	_sare setDropInterval 0.2;	
	
	_caldura = "#particlesource" createVehicleLocal getPosATL fum_obj;
	_caldura setParticleCircle [_crater_radius-45, [0, 0, 0]];
	_caldura setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [1, 1, 1, 0.5], 0, 0];
	_caldura setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 25], 15, 50, 7.9, 1, [25, 20, 10], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", fum_obj];
	_caldura setDropInterval 0.1;
	
	
	_fum_alb = "#particlesource" createVehicleLocal getPosATL fum_obj;
	_fum_alb setParticleCircle [_crater_radius,[0.2, 0.5, 0.9]];
	_fum_alb setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0.3], 0, 1, [0, 0, 0, 0.1], 0, 0];
	_fum_alb setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 7, [0, 0, 0], [0, 0, 0.75], 25, 17, 13, 0.7, [15, 17, 31], [[0.5, 0.5, 0.5, 0.3], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 0.1, 3, "", "", fum_obj];
	_fum_alb setDropInterval 0.05;
	
	[fum_obj, _crater_radius] spawn PG_fnc_volcano_smoke;
	
	_eruptionTime = 0;
	
	while {(player distance _volcano_object)<4000} do {
		waituntil {time > _eruptionTime};
		_eruptionTime = time + _eruption_delay;
		enableCamShake true;
		if ((player distance _volcano_object)<500) then {addCamShake [0.2, 15, 45];};
		[] spawn BIS_fnc_earthquake;
	
		_bolovani = "#particlesource" createVehicleLocal getPosATL _volcano_object;
		_bolovani setParticleCircle [_crater_radius-15, [100, 100, 100]];
		_bolovani setParticleRandom [3, [0.25, 0.25, 0], [100, 100, 100], 0, 1, [0, 0, 0, 1], 0, 0];
		_bolovani setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 20, [0, 0, 0], [5, 5, 100], random 3, 300, 5, 3, [2, 1, 1], [[0, 0, 0, 1], [0, 0, 0, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _volcano_object,0,true,0.1,[[0,0,0,0]]];
		_bolovani setDropInterval 0.01;	
	
		_sare_sec = "#particlesource" createVehicleLocal getPosATL _volcano_object;
		_sare_sec setParticleCircle [_crater_radius-15, [9, 9, 25]];
		_sare_sec setParticleRandom [3, [0.25, 0.25, 0], [11, 11, 27], 0, 0.5, [0, 0, 0, 1], 0, 0];
		_sare_sec setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 12.5, [0, 0, 0], [5, 5, 30], 0.3, 91, 7.9, 1, [2, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _volcano_object,0,true,0.1,[[0,0,0,0]]];
		_sare_sec setDropInterval 0.02;	
		
		_erupt = ["eruptie_1","eruptie_2","eruptie_3"] call BIS_fnc_selectRandom;
		_sok = ["d","n"] call BIS_fnc_selectRandom;
		
		if (_sok=="d") then {addCamShake [0.5, 13+ random 15, 7+random 13];};
		fum_obj say3d _erupt;
		
		_lum_area= floor(1200+random 500);	
		_limit = floor (500+random 300);
	
		while {_lum_area>_limit} do {
			li_exp setLightAttenuation [0, 0, 0, 0, 40,_lum_area]; 
			_bri = [30,35,40] call BIS_fnc_selectRandom;
			li_exp setLightBrightness _bri;
			_lum_area = _lum_area-50;
			sleep 0.1;
			li_exp setLightBrightness 10;		
		};
		li_exp setLightBrightness 30;
		deleteVehicle _bolovani;
		deleteVehicle _sare_sec;
		enableCamShake false; 
	};
	}else{
	if (!isNull li_exp) then {deleteVehicle li_exp;};
	if (!isNull fum_obj) then {deletevehicle fum_obj;};
	if (!isNull lava_obj) then {deletevehicle lava_obj;};
	};
	waitUntil {(player distance _volcano_object)>4000};
	};
};
publicVariable "PG_fnc_volcano_effect";

PG_fnc_volcano_smoke = {
	_v_poz				= _this select 0;
	_smoke_diameter 	= _this select 1;
	
	volcano_smoke = "Land_HelipadEmpty_F" createVehicleLocal [getPosATL _v_poz select 0,getPosATL _v_poz select 1,(getPosATL _v_poz select 2)-2];
	
	
	while {volcano} do {
	
	_vit_vert	=5+random 20;
	_vit_xx		=2+random 300;
	_vit_yy		=2+random 300;
	_greutate	=1+random 10;
	_dim_unu	= 20+random 10;
	_dim_doi	= 100+random 100;
	_dim_trei	= 200+random 200;
	
	
	if (shape_tip=="trei") then {
		_fum_caz = "#particlesource" createVehicleLocal getPos volcano_smoke;
		_fum_caz setParticleCircle [_smoke_diameter/10, [0, 0, 0]];
		_fum_caz setParticleRandom [4, [0, 0, 0], [3, 3, 2], 5, 0.25, [0.9, 0.3, 0.3, 1], 0, 0];
		_fum_caz setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 3], [0, 0, 10+random 30], 21, 21, 7, 0.01, [30, 5, 10], [[0.7, 0.6, 0.3, 1], [0.3, 0.1, 0.1, 1], [0.3, 0.1, 0.1, 0]], [0.08], 1, 0, "", "", volcano_smoke];
		_fum_caz setDropInterval 0.1;
		sleep shape_change_interval;
		deleteVehicle _fum_caz;
	};
	
	if (shape_tip=="unu") then {
	_fum = "#particlesource" createVehicleLocal getPosATL volcano_smoke;
	_fum setParticleCircle [_smoke_diameter/6, [_vit_xx,_vit_yy, _vit_vert]];
	_fum setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
	_fum setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 60, [0,0, 0], [_vit_yy,_vit_yy, _vit_vert], 11, _greutate, 45, 0.7, [_dim_unu, _dim_doi, _dim_trei], [[0.4, 0.4, 0.4, 1], [0, 0, 0, 1], [0, 0, 0, 0]], [0.08], 1, 0, "", "", volcano_smoke];
	_fum setDropInterval 0.2;
	sleep shape_change_interval;
	deleteVehicle _fum;
	
	} else {
	
	fulegr_vulcan = true;
	
		[_v_poz] spawn {
			_fulger_voice = _this select 0;
			poz_sus = "Land_HelipadEmpty_F" createVehicleLocal [getPosATL _fulger_voice select 0,getPosATL _fulger_voice select 1,(getPosATL _fulger_voice select 2)+1000];
			while {fulegr_vulcan} do { 
			lum_fulg = "#lightpoint" createVehicle getPosATL poz_sus;
			lum_fulg setLightAttenuation [ 0, 0,  0, 0, 40,2000];  
			lum_fulg setLightIntensity 0;
			lum_fulg setLightBrightness 0;
			lum_fulg setLightDayLight true;	
			lum_fulg setLightUseFlare true;
			lum_fulg setLightFlareSize 50;
			lum_fulg setLightFlareMaxDistance 2000;	
			lum_fulg setLightAmbient[1,1,1];
			lum_fulg setLightColor[1,1,1];			
				_sunet_t = ["tunet_v_4","tunet_v_5","tunet_v_6","tunet_v_9"] call BIS_fnc_selectRandom;
				lum_fulg setLightIntensity 5000;
				lum_fulg setLightBrightness 10;
				sleep 0.3;
				_fulger_sus = "#particlesource" createVehicleLocal getPosATL _fulger_voice;
				_fulger_sus setParticleCircle [0, [0, 0, 0]];
				_fulger_sus setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
				_fulger_sus setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject",1, 20, [0, 0, 1100+random 200], [0, 0, 0], 0, 0, 0, 0, [3, 3, 3], [[0, 0, 0, 1], [0.2, 0.2, 0.2, 1], [0, 0, 0, 1]], [0.08], 1, 0, "", "", _fulger_voice];
				_fulger_sus setDropInterval 15;
				sleep 0.01;
				lum_fulg setLightIntensity 5000;
				lum_fulg setLightBrightness 100;
				sleep 0.4;			
				deleteVehicle _fulger_sus;
				poz_sus say3d _sunet_t;
				_intens_vf = 50;
				while {_intens_vf>0} do {
					_intens_vf = _intens_vf-1;
					lum_fulg setLightIntensity 0;
					lum_fulg setLightBrightness _intens_vf;
					sleep 0.01;
				};
				deleteVehicle lum_fulg;
				sleep 14 + random 60;
			};
			deleteVehicle poz_sus;
		};
	
		_fum_volc = "#particlesource" createVehicleLocal getPos volcano_smoke;
		_fum_volc setParticleCircle [_smoke_diameter/6, [0, 0, 0]];
		_fum_volc setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_fum_volc setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 60, [0, 0, 3], [0, 0, 50], 21, 21, 20, 0.07, [50, 20, 100, 50, 200,300], [[0.3, 0.2, 0.1, 1], [0.1, 0.1, 0.1, 1], [0.1, 0.1, 0.1, 1], [0.1, 0.1, 0.1, 0.5], [0.1, 0.1, 0.1, 1],[0.3, 0.3, 0.3, 0]], [0.08], 1, 0, "", "", volcano_smoke];
		_fum_volc setDropInterval 0.1;
		sleep shape_change_interval;
		deleteVehicle _fum_volc;
		fulegr_vulcan = false;
		};
	};
};
publicVariable "PG_fnc_volcano_smoke";

sleep 15;
 10 setwaves 1; 
 10 setfog 0.00; 
 10 setRain 0;
 10 setOvercast 1; 
 10 setRainbow 1;
 10 setLightnings 1;
 forceWeatherChange;

//VOLCANO
_alias_radius	= 80;
_alias_delay	= 20+random 90;

_poz_v = [4010.38,14385.4,0];

alias_eruption = false;
publicVariable "alias_eruption";

volcano=true;
publicVariable "volcano";

[_alias_delay] spawn {
	_alias_delay_temp = _this select 0;
	while {volcano} do {
	shape_change_interval = _alias_delay_temp-3;
	publicVariable "shape_change_interval";
	shape_tip = ["unu","doi","trei"] call BIS_fnc_selectRandom;
	publicVariable "shape_tip";
	sleep _alias_delay_temp+3;
	};
};

[_poz_v, _alias_radius, _alias_delay] remoteExec ["PG_fnc_volcano_effect",-2,true];

//Falling Stars SCRIPTS
PG_fnc_fallingStar_server = {
	
	waitUntil{count playableUnits > 0};
	_hunt_alias = playableUnits call BIS_fnc_selectRandom;
	_dire	= [500,-500] call BIS_fnc_selectRandom;	
	_xx = (getpos _hunt_alias select 0)+random _dire;
	_dire	= [500,-500] call BIS_fnc_selectRandom;	
	_yy = (getpos _hunt_alias select 1)+random _dire;
	_poz_ini = [_xx, _yy, 800];
		
	_falling_star_main = "Land_Battery_F" createVehicle _poz_ini;
	_falling_star_main setPosATL _poz_ini;
	
	_dire_dest	= [1,-1] call BIS_fnc_selectRandom;	
	_xx_dest 	= _xx+(random 40000*_dire_dest);
	_dire_dest	= [1,-1] call BIS_fnc_selectRandom;
	_yy_dest 	= _yy+(random 40000*_dire_dest);
	
	[_falling_star_main] remoteExec ["PG_fnc_fallingStar_client",-2];
	
	_falling_star_main setvelocity [_xx_dest/100,_yy_dest/100,-1];

	sleep 4+random 2;
	deleteVehicle _falling_star_main;
};

PG_fnc_fallingStar_client = {
	_fall_star = _this select 0;
	
	_psmoke = "#particlesource" createVehicleLocal getPosATL _fall_star;
	_psmoke setParticleCircle [0, [0, 0, 0]];
	_psmoke setParticleRandom [3, [0.25, 0.25, 0.25], [0, 0, 0], 0, 0.25, [0, 0, 0, 0.5], 0, 0];	
	_psmoke setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0.75], 30, 10, 7.9, 0, [1.2, 4, 1], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5]], [0.08], 1, 0, "", "", _fall_star];
	_psmoke setDropInterval 0.002;
	
	_bri_li = 3000;
	_li = "#lightpoint" createVehicle [(getPos _fall_star select 0),(getPos _fall_star select 1),(getPos _fall_star select 2)];
	_li lightAttachObject [_fall_star, [0,0,0]];
	_li setLightIntensity _bri_li;
	_li setLightAttenuation [ 500, 300, 3000,  0, 5, 500]; 
	_li setLightUseFlare true;
	_li setLightFlareSize 10;
	_li setLightFlareMaxDistance 2000;	
	_li setLightAmbient[1,.8,.7];
	_li setLightColor[1,1,1];	
	
	sleep 0.2;
	
	_li setLightFlareSize 5;

	while {_bri_li>-50} do {
		_li setLightIntensity _bri_li;
		_bri_li=_bri_li-50;
	sleep 0.05;
	};
	waitUntil {_bri_li==0};
	deleteVehicle _li;
};
publicVariable "PG_fnc_fallingStar_client";

//Falling Stars
[] spawn {
	while {true} do {
		[] spawn PG_fnc_fallingStar_server;
		waitUntil{count playableUnits > 0};
		sleep (random (5/(count playableUnits)));
	};
};

sleep 10;

//Meteor SCRIPTS
PG_fnc_meteor_server = {
	waitUntil{count playableUnits > 0};
	_hunt_alias = playableUnits call BIS_fnc_selectRandom;
	_dire	= [1000,-1000] call BIS_fnc_selectRandom;	
	_xx = (getpos _hunt_alias select 0)+random _dire;
	_dire	= [1000,-1000] call BIS_fnc_selectRandom;	
	_yy = (getpos _hunt_alias select 1)+random _dire;
	_poz_ini = [_xx, _yy, 800];
		
	_falling_meteor_main = "Land_Battery_F" createVehicle _poz_ini;
	_falling_meteor_main setPosATL _poz_ini;
	
	[_falling_meteor_main] remoteExec ["PG_fnc_meteor_ini_blast",-2];
	
	_bariera_sunet = ["bariera_1","bariera_2","bariera_3","bariera_4", "bariera_5"] call BIS_fnc_selectRandom;	
	[_falling_meteor_main, _bariera_sunet] remoteExec ["say3d", -2];
	
	_dire_dest	= [1000,-1000] call BIS_fnc_selectRandom;	
	_xx_dest 	= _xx+random _dire_dest;
	_dire_dest	= [1,-1] call BIS_fnc_selectRandom;
	_yy_dest 	= _yy+random _dire_dest;
	
	[_falling_meteor_main] remoteExec ["PG_fnc_meteoreffect",-2];
	
	_falling_meteor_main setvelocity [_xx_dest/200,_yy_dest/200,-100];
	
	while {((getpos _falling_meteor_main) select 2) >10} do	{
		[_falling_meteor_main, "meteor_1"] remoteExec ["say3d", -2];
		sleep 0.9;
	};

	_poz_end = getPos _falling_meteor_main;
	deleteVehicle _falling_meteor_main;
	
	[_poz_end] remoteExec ["PG_fnc_meteor_end_blast",-2];
	
	_meteor_voice = "land_helipadempty_f" createVehicle _poz_end;
	[_meteor_voice, "expozie"] remoteExec ["say3d", -2];
	enableCamShake true;
	addCamShake [3, 5, 35];
	sleep 1+random 1;
	addCamShake [0.5, 30, 35];
	
	sleep 5;
	enableCamShake false;
	deleteVehicle _meteor_voice;
};

PG_fnc_meteor_ini_blast = {
	_falling_meteor_ini = _this select 0;
	_poz_ini = getPos _falling_meteor_ini;
	_blinding = random 30;
	if (_blinding<7) then {
		_light = "#lightpoint" createVehicleLocal getpos _falling_meteor_ini;
		_light setpos _poz_ini;
		_light setLightDayLight true;
		_light setLightBrightness 30000;
		_light setLightAmbient [0.5, 0.5, 1];
		_light setlightcolor [1, 1, random 2];
		sleep 0.5;
		deletevehicle _light;
	};
};
publicVariable "PG_fnc_meteor_ini_blast";

PG_fnc_meteoreffect = {
	_fall_meteor_smoke = _this select 0;
	
	_li2 = "#lightpoint" createVehicle getpos _fall_meteor_smoke;
	_li2 setLightBrightness 100;
	_li2 setLightDayLight true;
	_li2 setLightAmbient[1,0.5,0];
	_li2 setLightColor[1, 0.5, 0];
	_li2 lightAttachObject [_fall_meteor_smoke, [0,0,0.1]];
	
	_meteor_smoke  = "#particlesource" createVehicleLocal getPosATL _fall_meteor_smoke;
	_meteor_smoke  setParticleCircle [0, [0, 0, 0]];
	_meteor_smoke  setParticleRandom [5, [0.1, 0.1, 0], [0.2, 0.2, 0.5], 0.3, 0.5, [0, 0, 0, 0.5], 0, 0];
	_meteor_smoke  setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7,48,1], "", "Billboard", 1, 20, [0, 0, 0], [0, 0, 0.5], 0, 10.1, 7.9, 0.01, [7, 3, 1], [[0.1,0.1,0.1,0.9], [0.6,0.6,0.6,0.6], [0.8,0.8,0.8,0.4],[0.9,0.9,0.9,0.3],[1,1,1,0.1]], [0.125], 1, 0, "", "", _fall_meteor_smoke];
	_meteor_smoke  setDropInterval 0.01;
	
	_ps2 = "#particlesource" createVehicleLocal getPosATL _fall_meteor_smoke;
	_ps2 setParticleCircle [0, [0, 0, 0]];
	_ps2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_ps2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 1, 0, 1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0], 0, 10, 7.9, 0.075, [5, 1.5, 2], [[0.4,0.4,0.4,0],[0.4,0.4,0.4,0.5],[0.4,0.4,0.4,0.25],[0.6,0.6,0.6,0.12],[1,1,1,0]], [0.08], 1, 0, "", "", _fall_meteor_smoke];
	_ps2 setDropInterval 0.01;
	
	waitUntil {isNull _fall_meteor_smoke};
	deleteVehicle _li2;
};
publicVariable "PG_fnc_meteoreffect";

PG_fnc_meteor_end_blast = {
	_poz = _this select 0;
	
	_bolovani = "#particlesource" createVehicleLocal _poz;
	_bolovani setParticleCircle [0, [0, 0, 0]];
	_bolovani setParticleRandom [3, [0.25, 0.25, 0], [100, 100, 100], 0, 1, [0, 0, 0, 0.1], 0, 0];
	_bolovani setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 10, [0, 0, 0], [5, 5, 100], 2, 200, 5, 3, [2, 1, 1], [[0, 0, 0, 1], [0, 0, 0, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _poz];
	_bolovani setDropInterval 0.01;
	
	_fum = "#particlesource" createVehicleLocal _poz;
	_fum setParticleCircle [0, [0, 0, 0]];
	_fum setParticleRandom [0, [0.25, 0.25, 0], [100, 100, 100], 0, 0, [0, 0, 0, 0.1], 0, 0];
	_fum setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 20, [0, 0, 0], [7, 7, 30], 2, 50, 5, 3, [20, 30, 40], [[0, 0, 0, 1], [0, 0, 0, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _poz,0,true,0.5,[[0,0,0,0]]];
	_fum setDropInterval 0.01;
	
	_li_end = "#lightpoint" createVehicleLocal _poz;
	_li_end setLightIntensity 5000;
	_li_end setLightDayLight true;	
	_li_end setLightAttenuation [ 800, 100, 100,  0,5,800]; 
	_li_end setLightUseFlare true;
	_li_end setLightFlareSize 100;
	_li_end setLightFlareMaxDistance 2000;	
	_li_end setLightAmbient[1, 0.5, 0];
	_li_end setLightColor[1, 0.5, 0];
	sleep 0.5;
	playSound "earthquakes";
	deleteVehicle _bolovani;
	sleep 0.3;
	deleteVehicle _fum;	
	sleep 1.5;
	deleteVehicle _li_end;
};
publicVariable "PG_fnc_meteor_end_blast";


//Meteors
alias_meteors = true;
[] spawn {
	while {alias_meteors} do {
		[] spawn PG_fnc_meteor_server;
		waitUntil{count playableUnits > 0};
		sleep (random (5/(count playableUnits)));
	};
};

sleep 30;
 10 setwaves 1; 
 10 setfog 0.00; 
 10 setRain 0;
 10 setOvercast 1; 
 10 setRainbow 1;
 10 setLightnings 1;
 forceWeatherChange;

