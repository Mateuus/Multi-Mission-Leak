#include <macro.h>
/*
	file: fn_vehicleAddEVH.sqf
	
	Author: RafiQuak for Play Germany
	http://play-germany.de
	
	Adds the clientside event handler to a vehicle

*/

private ["_vehicle"];
_vehicle = _this select 0;
if(isNull _vehicle) exitWith {};

//Make the taru pod openable
if ((playerSide == independent) && (typeOf _vehicle == "O_Heli_Transport_04_medevac_F")) then {
	_vehicle addAction["Türen öffnen",   {_veh = _this select 0; _veh setVariable["doorsOpen",true,true];  _veh animateDoor ['Door_4_source',1]; _veh animateDoor ['Door_5_source',1]; _veh animateDoor ['Door_6_source',1];},"",0,false,false,"",' player distance _target < 5 && !(_target getVariable["doorsOpen",FALSE])'];
	_vehicle addAction["Türen schließen",{_veh = _this select 0; _veh setVariable["doorsOpen",false,true]; _veh animateDoor ['Door_4_source',0]; _veh animateDoor ['Door_5_source',0]; _veh animateDoor ['Door_6_source',0];},"",0,false,false,"",' player distance _target < 5 &&  (_target getVariable["doorsOpen",FALSE])'];
	_vehicle addAction["Auf Arztplatz",{player moveInCargo [_this select 0,3]},"",0,false,false,"",'player distance _target < 5'];
};

//Make the taru pod openable
if ((playerSide == independent) && (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F")) then {
	_vehicle addAction["Türen öffnen",   {_veh = _this select 0; _veh setVariable["doorsOpen",true,true];   _veh animate ['Door_6_rot',1]; _veh animate ['Door_6_hide',1]; _veh animate ['Door_4_move_2',1]; _veh animate ['Door_4_move_1',1]; _veh animate ['Door_4_handle_rot',1];},"",0,false,false,"",' player distance _target < 5 && !(_target getVariable["doorsOpen",FALSE])'];
	_vehicle addAction["Türen schließen",{_veh = _this select 0; _veh setVariable["doorsOpen",false,true];  _veh animate ['Door_6_rot',0]; _veh animate ['Door_6_hide',0]; _veh animate ['Door_4_move_2',0]; _veh animate ['Door_4_move_1',0]; _veh animate ['Door_4_handle_rot',0];},"",0,false,false,"",' player distance _target < 5 &&  (_target getVariable["doorsOpen",FALSE])'];
	_vehicle addAction["Auf Arztplatz",{player moveInCargo [_this select 0,3]},"",0,false,false,"",'player distance _target < 5'];
	_vehicle addAction["Pod betreten",{ _pos = (_this select 0) modelToWorld [-0.5,2.6,-1]; player setPosATL _pos},"",0,false,false,"",'player distance (_target modelToWorld [-0.5,2.6,-1]) < 2'];
};

//Anti damage for helicopters (especially for the ALAC Taru)
if ((playerSide == independent) && (typeOf _vehicle == "O_Heli_Transport_04_F")) then {
	_vehicle allowDammage false;
} else {
	if (_vehicle isKindOf "Air") then {
		_vehicle allowDammage false;
		waitUntil {sleep 1; !(isTouchingGround _vehicle)};
		_vehicle allowDammage true;
	};
};