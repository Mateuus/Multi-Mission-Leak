/*
	file: fn_getOutMan.sqf
	
	Author: RafiQuak for Play Germany
	http://play-germany.de
	
	Automaticly holsters the weapon of the player , when he did that before he entered the car and solves a boat-exit bug

*/

private ["_unit","_vehicle"];
_vehicle = _this select 2;

if(_vehicle isKindOf "Ship") then {
	player switchMove "";
};

if(_vehicle isKindOf "AIR" && !PG_ATC) then {
	["PG_atcChannel",[player]] remoteExec ["PGSERV_fnc_radioChannelRemove",2];
};

if(!isNil "PG_followMeOn") then {
	player removeAction PG_followMeOn;
	PG_followMeOn = nil;
};

if(!isNil "PG_followMeOff") then {
	player removeAction PG_followMeOff;
	PG_followMeOff = nil;
};


if (life_holstered) then {
	if (currentWeapon player != "") then {
		player action ["SwitchWeapon", player, player, 100];
		player switchcamera cameraView;
	} else {
		life_holstered = false;
	};
};

if(!isNil "PG_taxameterAction") then {
	player removeAction PG_taxameterAction;
	PG_taxameterAction = nil;
};

if(!isNil "PG_taxameterHideAction") then {
	player removeAction PG_taxameterHideAction;
	PG_taxameterHideAction = nil;
};