#include "..\..\script_macros.hpp"
/*
	File: fn_onFired.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles various different ammo types being fired.
*/
/*
private["_ammoType","_projectile"];
_ammoType = SEL(_this,4);
_projectile = SEL(_this,6);

if(EQUAL(_ammoType,"GrenadeHand_stone")) then {
	_projectile spawn {
		private "_position";
		while {!isNull _this} do {
			_position = ASLtoATL (visiblePositionASL _this);
			sleep 0.1;
		};
		[_position] remoteExec ["life_fnc_flashbang",RCLIENT];
	};
};*/

if (playerSide == civilian && !license_civ_rebel) then {
	// Check if player is aiming at safezone
	_removed = false;
	_cont = true;
	
	if (!(isNull cursorTarget) && _cont && !_removed) then {
		if ([cursorTarget] call life_fnc_inSafezone) then {
			// Cursortarget is in safezone
			_cont = false;
			_removed = true;
			deleteVehicle _projectile;
		} else {
			// Cursortarget is not in safezone
			_cont = false;
		};
	};
	
	if (!_removed && [screenToWorld [0.5,0.5]] call life_fnc_inSafezone) then {
		deleteVehicle _projectile;
		_projectile = nil;
		_removed = true;
	};
};

if((playerside == civilian) && safeZone && (!license_civ_rebel)) then {
	deleteVehicle _projectile;
};

//Teargas
if(_ammoType in ["SmokeShellGreen","G_40mm_SmokeGreen"]) then {
	[_projectile] remoteExec ["life_fnc_teargas",0];
};

//Flashbang
if(_ammoType == "HandGrenade_Stone") then {
	_projectile spawn {
		private "_position";
		while {!isNull _this} do {
			_position = ASLtoATL (visiblePositionASL _this);
			sleep 0.1;
		};
		[_position] remoteExec ["life_fnc_flashbang",0];
	};
};