#include "..\..\script_macros.hpp"
/*
	File: fn_skySpawn.sqf
	Author: Tonic
	
	Description:
	Spawn via Sky diving out of a helicopter, with two random coloured smokes and a light effect at darkness, that deploys once chute is pulled.
*/
private ["_post","_num","_color","_action","_smoke1","_smoke2","_light","_flare1","_flare2","_previousVol","_i","_camera","_heli","_jumpers","_post","_smokeOn","_spawnPoint"];
_post = nearestObject[[2076.84,22185.8,0.124081],"Land_Lighthouse_small_F"];
_spawnPoint = life_spawn_point select 0;
_spawnPointJumper = format["%1_jumper", _spawnPoint];
_jumpers = _post getVariable[_spawnPointJumper,[]];
_jumpers pushBack getPlayerUID player;
_post setVariable[_spawnPointJumper,_jumpers,true];

player allowDamage false;
disableUserInput true;
life_skydive = true;

//switch black

"colorCorrections" ppEffectEnable true; 
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [0,0,0,0], [1,1,1,1]]; 
"colorCorrections" ppEffectCommit 0;

//music stuff
if(life_firstSpawn) then {
	// intro music
	player say2D "Intro";
	life_firstSpawn = false;
} else {
	//paradrop music
	player say2D "paradroprk";
	[]spawn {
		_i = 0;
		uiSleep 133.6;
		while {(life_skydive)} do {
			if (_i mod 105 == 0) then {
			playMusic ["paradroprkm",28.6];
			};
			_i = _i + 1;
			uiSleep 1;
		};
		5 fadeMusic 0;
		uiSleep 6;
		0 fadeMusic 1;
	};
};

//preload the area up there
preloadCamera [position player select 0, position player select 1, 1500];

//prepare for parachute
life_oldBackpack = backpack player;
life_oldBackpackItems = backpackItems player;
uiSleep 0.5;
removeBackpack player;
uiSleep 3.5;

//setup heli
_heli = _post getVariable[_spawnPoint,objNull];
if (isNull _heli) then {
	_heli = createVehicle ["B_Heli_Transport_03_unarmed_F",[0,0,1500],[],0,"FLY"];
	_heli allowDamage false;
	_heli setPos [position player select 0,position player select 1,1500];
	_post setVariable[_spawnPoint,_heli,true];
	createVehicleCrew _heli;
	_heli disableAI "MOVE";
	_heli setObjectTextureGlobal [0,"textures\civi\fahrzeuge\huron\civ_huron_alg_0.paa"];
	_heli setObjectTextureGlobal [1,"textures\civi\fahrzeuge\huron\civ_huron_alg_1.paa"];
	_heli animateDoor ['Door_R_source',1];
	_heli animateDoor ['Door_L_source',1];
	_heli animateDoor ['Door_rear_source',1];
};

//create cam
showCinemaBorder true;
_camera = "camera" camCreate [(position _heli select 0) + 250 - floor(random 500), (position _heli select 1) + 250 - floor(random 500),(position _heli select 2)+ 300];
_camera cameraEffect ["internal","back"];
_camera camSetTarget player;
_camera camSetFOV 2.000;
_camera camCommit 0;

uiSleep 0.5;

player moveInCargo _heli;

//fade back
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1], [0,0,0,0]];
"colorCorrections" ppEffectCommit 2;

//zoom down cam
_camera camSetRelPos [10,-10,2];
_camera camCommit 5;
uiSleep 5;

//cam back to player
"colorCorrections" ppEffectEnable false; 
player action ["getOut", _heli];
_camera camSetRelPos [0,10,2];
_camera camCommit 2;
player addBackpack "B_Parachute"; 
uiSleep 4;
disableUserInput false;

//clean up cam
_camera cameraEffect ["terminate","back"];
camDestroy _camera;

//parachute open or smashed into the ground
waitUntil {(vehicle player != player || isTouchingGround player)};	
if (isTouchingGround player) then {
	_smokeOn = false;
	player playMoveNow "AinvPknlMstpSnonWrflDnon_medic1";
	player playActionNow "stop";
} else {
	_smokeOn = true;
	_num = floor(random 6);
	
	_color = switch (_num) do {
		case 0: {["SmokeShell","SmokeShellRed","F_20mm_White"];};
		case 1: {["SmokeShellPurple","SmokeShellYellow","F_20mm_White"];};
		case 2: {["SmokeShellRed","SmokeShellBlue","F_20mm_Red"];};
		case 3: {["SmokeShellBlue","SmokeShellYellow","F_20mm_Yellow"];};
		case 4: {["SmokeShellOrange","SmokeShellBlue","F_20mm_Red"];};
		case 5: {["SmokeShellYellow","SmokeShellRed","F_20mm_Yellow"];};
	};
		if (sunOrMoon < 0.7) then {
		_light = true;
		_flare1 = (_color select 2) createVehicle position player;
		_flare1 attachTo [vehicle player, [0,-0.1,1.75]]; 
	} else {
		_light = false;
	};
	_smoke1 = (_color select 0) createVehicle position player;
	_smoke1 attachTo [vehicle player, [-0.15,-0.1,1.75]]; 
	uiSleep 4; //uiSleep to have continuous effects
	_smoke2 = (_color select 1) createVehicle position player;
	_smoke2 attachTo [vehicle player, [0.15,-0.1,1.75]]; 
	if (_light) then {
		_flare2 = (_color select 2) createVehicle position player;
		_flare2 attachTo [vehicle player, [0,-0.1,1.75]]; 
	};
};

//continuous effects
while { !(isTouchingGround player)} do {
	if (isNull _smoke1) then {
		_smoke1 = (_color select 0) createVehicle position player;
		_smoke1 attachTo [vehicle player, [-0.15,-0.1,1.75]]; 
	};
	if (isNull _smoke2) then {
		_smoke2 = (_color select 1) createVehicle position player;
		_smoke2 attachTo [vehicle player, [0.15,-0.1,1.75]];  
	};
	if (_light) then {
		if (isNull _flare1) then {
			_flare1 = (_color select 2) createvehicle (position player);
			_flare1 attachTo [vehicle player, [0,-0.1,1.75]];
		};
		if (isNull _flare2) then {
			_flare2 = (_color select 2) createvehicle (position player);
			_flare2 attachTo [vehicle player, [0,-0.1,1.75]];
		};
	};
	uiSleep 0.1;
};

//delete smoke and stuff if created
if (_smokeOn) then {
	if (!(isNull _smoke1)) then {
		deleteVehicle _smoke1;
	};
	if (!(isNull _smoke2)) then {
		deleteVehicle _smoke2;
	};
	if (_light) then {
		if (!(isNull _flare1)) then {
			deleteVehicle _flare1;
		};
		if (!(isNull _flare2)) then {
			deleteVehicle _flare2;
		};
	};
};

player allowDamage true;
life_skydive = false;
player setPos (position player);
5 fadeMusic 0;
	
uiSleep 2;
if (alive player) then {
	[] call life_fnc_hudSetup;
	removeBackpack player;
	if(life_oldBackpack != "") then
	{
		player addBackpack life_oldBackpack;
		clearAllItemsFromBackpack player;
		if(count life_oldBackpackItems > 0) then
		{
			{
				[_x,true,true] call life_fnc_handleItem;
			} foreach life_oldBackpackItems;
		};
	};
};

uiSleep 4;
playMusic "";
0 fadeMusic 1;

_jumpers = _post getVariable[_spawnPointJumper,[]];
_jumpers = _jumpers - [getPlayerUID player];
_post setVariable[_spawnPointJumper,_jumpers,true];

if(count _jumpers == 0) then {
	{_heli deleteVehicleCrew _x} forEach crew _heli;
	deleteVehicle _heli;
};
