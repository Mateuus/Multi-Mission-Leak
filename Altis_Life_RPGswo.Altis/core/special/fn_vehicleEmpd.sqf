/*
	File: vehicleEmpd.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
	edit by Division-wolf.de
*/
private["_vehicle"];
_vehicle =  param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {};
if((_vehicle getVariable ["nano_empd", false])) exitWith {};
_vehicle setVariable["nano_empd",true,true];

hint "EMP WARNUNG\n\n IHR FAHRZEUG WURDE VON EINEM EMP GETROFFEN\n\nANTRIEB FÄLLT IN WENIGEN SEKUNDEN AUS";
titleText [format ["!!!! SIE WURDEN VON EINEM EMP GETROFFEN !!!!", _vehicle], "PLAIN"];



if(_vehicle isKindOf "Car") then {
	_vehicle say3D "empwarn";
	sleep 3.35;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "empacsound";
	if(local _vehicle) then {

	_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		sleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	};
};
if(_vehicle isKindOf "Air") then {  
	_vehicle say3D "empwarn";
	sleep 3.35;
	_vehicle say3D "empwarn";
	sleep 3.35;
	_vehicle say3D "empwarn";
	sleep 3.35;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "empacsound";
	sleep 1.0;
	titleText ["!!!! SIE WURDEN VON EINEM EMP GETROFFEN !!!!\n!!! ANRIEB FÄLLT IN 3 SEKUNDEN AUS !!!", "PLAIN"];
	_vehicle say3D "empwarn";
	sleep 3.35;

	if(local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		sleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	}
};
if(_vehicle isKindOf "Ship") then {
	_vehicle say3D "empwarn";
	sleep 3.35;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "emphit";
	sleep 1.0;
	_vehicle say3D "empacsound";

	if(local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		sleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	}
};
_vehicle setVariable["nano_empd",false,true];