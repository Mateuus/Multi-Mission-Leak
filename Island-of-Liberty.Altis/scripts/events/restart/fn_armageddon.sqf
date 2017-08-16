/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/

private["_makeNearObjectsInvulnerable"];

showChat false;
life_tagson = !true;
[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;

if(life_session_completed) then {
	[]spawn {sleep random 6; [] call SOCK_fnc_updateRequest;};
};

_makeNearObjectsInvulnerable = {
	[] spawn {
		_nearObjects = nearestObjects [player,["all"],400];
		{
			_x allowDamage false;
		} forEach _nearObjects;
	};
};

_visualEffectsIntroducingRestart = {
	[] spawn {
		"dynamicblur" ppeffectenable true;
		"dynamicblur" ppeffectadjust [1];
		"dynamicblur" ppeffectcommit 1;
		"colorcorrections" ppeffectenable true;
		"colorcorrections" ppeffectadjust [0.8, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.0, 0.6, 2],[0.3, 0.3, 0.3, 0.1]];
		"colorcorrections" ppeffectcommit 0.4;
		"dynamicblur" ppeffectadjust [0.5];
		"dynamicblur" ppeffectcommit 3;
		0 setovercast 0;
		uisleep 0.1;
		_xhandle = []spawn {
			uisleep 1;
			"colorcorrections" ppeffectadjust [1.0, 0.5, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
			"colorcorrections" ppeffectcommit 2;
		};
		"dynamicblur" ppeffectadjust [2];
		"dynamicblur" ppeffectcommit 1;
		"dynamicblur" ppeffectadjust [0.5];
		"dynamicblur" ppeffectcommit 4;
		uisleep 4.5;
		"colorcorrections" ppeffectadjust [1, 1, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
		"colorcorrections" ppeffectcommit 1;
		"colorcorrections" ppeffectenable true;
		"dynamicblur" ppeffectadjust [0];
		"dynamicblur" ppeffectcommit 1;
	};
};

_lightnings = {
	_center = player;
	_radius = 500;

	_objectTypes = ["HOUSE","TREES","LAMPS"];
	_strikeCenter = [];
	_currentTarget = "";
	_centerPos = [];
	while {true} do {
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


0 fadesound 0;
5 fadeSound 1;
playSound "restart";
hintsilent parsetext"<t size='1.5'>ACHTUNG! Weltuntergang (Serverrestart)</t><br/><br/><t size='1.3'>Bis gleich euer Island of Liberty Team</t>";
uisleep 14;
hintsilent parsetext"<t size='1.5'>ACHTUNG! Weltuntergang in</t><br/><br/><t size='2'>3</t>";
playsound "alarm";
uisleep 1;
hintsilent parsetext"<t size='1.5'>ACHTUNG! Weltuntergang in</t><br/><br/><t size='2'>2</t>";
playsound "alarm";
uisleep 1;
hintsilent parsetext"<t size='1.5'>ACHTUNG! Weltuntergang in</t><br/><br/><t size='2'>1</t>";
playsound "alarm";
uisleep 1;
hintsilent "";

(uiNamespace getVariable ["playerHUD",displayNull]) closeDisplay 0;

uisleep 1;
cutText ["Was passiert jetzt?","Black OUT"];
uisleep 1;
[] spawn _makeNearObjectsInvulnerable;
[] Spawn {
	setDate [0,0,0,17,30];
	60 setwaves 1;
	60 setfog 0.00;
	60 setRain 1;
	60 setOvercast 1;
	60 setRainbow 1;
	60 setWaves 1;
	60 setLightnings 1;
	forceWeatherChange;
};
[] spawn _lightnings;
uisleep 3;
cutText ["","Black in"];

[] spawn _visualEffectsIntroducingRestart;

[1,10,false,true] spawn BIS_fnc_cinemaBorder;
uisleep 5;

[] spawn BIS_fnc_earthquake;
 uisleep 30;

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
uisleep 8;

_kavalaEffects = {
	_positionPlayer = getpos player;
	_positionPlayerX = _positionPlayer select 0;
	_positionPlayerX = _positionPlayerX + 600;
	_positionPlayerY = _positionPlayer select 1;
	_positionPlayerZ = _positionPlayer select 2;
	_playerpos = [_positionPlayerX,_positionPlayerY,_positionPlayerZ];

	_sandbag = "land_sack_f" createvehiclelocal _playerpos;

	_sandbagParticles1 = "#particlesource" createvehiclelocal getpos _sandbag;
	_sandbagParticles1 setparticleparams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48], "", "billboard", 1, 10, [0, 0, 0], [0, 0, 0], 0, 1.275, 1, 0, [40,80], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", _sandbag];
	_sandbagParticles1 setparticlerandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0];
	_sandbagParticles1 setparticlecircle [10, [-10, -10, 20]];
	_sandbagParticles1 setdropinterval 0.005;

	_sandbagParticles2 = "#particlesource" createvehiclelocal getpos _sandbag;
	_sandbagParticles2 setparticleparams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 3, 48, 0], "", "billboard", 1, 20, [0, 0, 0], [0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", _sandbag];
	_sandbagParticles2 setparticlerandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
	_sandbagParticles2 setdropinterval 0.002;

	_sandbagParticles3 = "#particlesource" createvehiclelocal getpos _sandbag;
	_sandbagParticles3 setparticleparams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 3, 112, 0], "", "billboard", 1, 20, [0, 0, 0], [0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", _sandbag];
	_sandbagParticles3 setparticlerandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
	_sandbagParticles3 setdropinterval 0.002;

	_sandbagParticles4 = "#particlesource" createvehiclelocal getpos _sandbag;
	_sandbagParticles4 setparticleparams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48, 1], "", "billboard", 1, 25, [0, 0, 0], [0, 0, 60], 0, 1.7, 1, 0, [40,15,120], [[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]] , [0.5, 0.1], 1, 1, "", "", _sandbag];
	_sandbagParticles4 setparticlerandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360];
	_sandbagParticles4 setdropinterval 0.002;

 	[] spawn {
 		playsound "earthquake_04"; 		uisleep 5;
 		playsound "earthquake_04"; 		uisleep 5;
 		playsound "earthquake_04"; 		uisleep 5;
 		playsound "earthquake_04"; 		uisleep 5;
 		playsound "earthquake_04";		uisleep 5;
 		playsound "earthquake_04";		uisleep 5;
 		playsound "earthquake_04";		uisleep 5;
 		playsound "earthquake_04";		uisleep 5;
 	};

 	_sandbagParticles5 = "#particlesource" createvehiclelocal getpos _sandbag;
 	_sandbagParticles5 setparticleparams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48], "", "billboard", 1, 20, [0, 0, 0], [0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], [0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", _sandbag];
 	_sandbagParticles5 setparticlerandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
 	_sandbagParticles5 setparticlecircle [50, [-80, -80, 2.5]]; _sandbagParticles5 setdropinterval 0.0002;

 	_sandbagLightEffects = "#lightpoint" createvehiclelocal [((getpos _sandbag select 0)),(getpos _sandbag select 1),((getpos _sandbag select 2)+500)];
 	_sandbagLightEffects setlightambient[1500, 1200, 1000];
 	_sandbagLightEffects setlightcolor[1500, 1200, 1000];
 	_sandbagLightEffects setlightbrightness 100000.0;

 	[] spawn {
		"dynamicblur" ppeffectenable true;
		"dynamicblur" ppeffectadjust [1];
		"dynamicblur" ppeffectcommit 1;
		"colorcorrections" ppeffectenable true;
		"colorcorrections" ppeffectadjust [0.8, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.0, 0.6, 2],[0.3, 0.3, 0.3, 0.1]];
		"colorcorrections" ppeffectcommit 0.4;
		"dynamicblur" ppeffectadjust [0.5];
		"dynamicblur" ppeffectcommit 3;
		0 setovercast 0;
		uisleep 0.1;

		_xhandle = []spawn {
			uisleep 1;
			"colorcorrections" ppeffectadjust [1.0, 0.5, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
			"colorcorrections" ppeffectcommit 2;
		};

		"dynamicblur" ppeffectadjust [2];
		"dynamicblur" ppeffectcommit 1;
		"dynamicblur" ppeffectadjust [0.5];
		"dynamicblur" ppeffectcommit 4;
		uisleep 4.5;
		"colorcorrections" ppeffectadjust [1, 1, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
		"colorcorrections" ppeffectcommit 1;
		"colorcorrections" ppeffectenable true;
		"dynamicblur" ppeffectadjust [0];
		"dynamicblur" ppeffectcommit 1;
	};

	player spawn {
		enablecamshake true;
		addcamshake [10, 90, 25];
		uisleep 90;
		enablecamshake false;
	};

	[] spawn {
		uisleep 5;
		[] spawn {
			_pos = position player;
			_o4dsiep8 = [ ["a3\data_f\particleeffects\universal\universal", 16, 12, 8, 1], "", "billboard", 1, 4, [0,0,0], [0,0,0], 1, 0.000001, 0, 1.4, [0.05,0.05], [[0.1,0.1,0.1,1]], [0,1], 0.2, 1.2, "", "", vehicle player ];
			_playerParticles = "#particlesource" createvehiclelocal _pos;
			_playerParticles setparticleparams _o4dsiep8;
			_playerParticles setparticlerandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
			_playerParticles setparticlecircle [0.0, [0, 0, 0]];
			_playerParticles setdropinterval 0.01;
		};
	};

	_sandbagParticles5 setdropinterval 0.001;
	deletevehicle _sandbagParticles2;
	deletevehicle _sandbagParticles3;
	uisleep 4.5;
	_sandbagLightEffectsBrightness = 0;

	while {_sandbagLightEffectsBrightness < 100} do {
		_sandbagLightEffects setlightbrightness 100.0 - _sandbagLightEffectsBrightness;
		_sandbagLightEffectsBrightness = _sandbagLightEffectsBrightness + 1;
		uisleep 0.1;
	};

	deletevehicle _sandbagLightEffects;
	uisleep 2;
	_sandbagParticles4 setparticleparams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48, 1], "", "billboard", 1, 25, [0, 0, 0], [0, 0, 45], 0, 1.7, 1, 0, [40,25,80], [[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]] , [0.5, 0.1], 1, 1, "", "", _sandbag];
	_sandbagParticles1 setdropinterval 0.01;
	_sandbagParticles4 setdropinterval 0.006;
	_sandbagParticles5 setdropinterval 0.001;
	uisleep 2;
	_sandbagParticles4 setparticleparams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48, 1], "", "billboard", 1, 25, [0, 0, 0], [0, 0, 30], 0, 1.7, 1, 0, [40,25,80], [[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]] , [0.5, 0.1], 1, 1, "", "", _sandbag];
}; // _kavalaEffects

uisleep 1;

[] spawn _kavalaEffects;

uisleep 20;
cutText ["","Black OUT"];
uisleep 0.3;
cutText ["","Black IN"];
uisleep 0.5;
cutText ["","Black OUT"];
uisleep 1.2;
cutText ["","Black IN"];
uisleep 1;
cutText [". . . S E R V E R R E S T A R T . . .","Black OUT"];
uisleep 120;
cutText ["","Black in"];
