/*
	File: fn_repair_truck.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
private ["_vehicle","_type","_wheel","_dialog","_Info"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {closeDialog 0;hint "Vor dir ist kein Fahrzeug!";};
if(player distance _vehicle > 10) exitWith {closeDialog 0;hint "Du bist zu weit weg!";};
_type = [_this,0,0,[0]] call BIS_fnc_param;

switch (_type) do {
	case 0: {
		_wheel = [_this,1,0,[0]] call BIS_fnc_param;
		switch (_wheel) do {
			case 1: {[_vehicle,"HitLFWheel","wheel"] call life_fnc_repair_action;};
			case 2: {[_vehicle,"HitLF2Wheel","wheel"] call life_fnc_repair_action;};
			case 3: {[_vehicle,"HitLMWheel","wheel"] call life_fnc_repair_action;};
			case 4: {[_vehicle,"HitLBWheel","wheel"] call life_fnc_repair_action;};
			case 5: {[_vehicle,"HitRFWheel","wheel"] call life_fnc_repair_action;};
			case 6: {[_vehicle,"HitRF2Wheel","wheel"] call life_fnc_repair_action;};
			case 7: {[_vehicle,"HitRMWheel","wheel"] call life_fnc_repair_action;};
			case 8: {[_vehicle,"HitRBWheel","wheel"] call life_fnc_repair_action;};
		};
	};
	case 1: {
		switch (true) do {
			case (_vehicle getHitPointDamage "HitEngine" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitFuel" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitLFWheel" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitLF2Wheel" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitLMWheel" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitLBWheel" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitRFWheel" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitRF2Wheel" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitRMWheel" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitRBWheel" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens zu 90% repariert sein."};
			default {[_vehicle,"HitHull","hull"] call life_fnc_repair_action;};
		};
		
	};
	case 2: {[_vehicle,"HitEngine","engine"] call life_fnc_repair_action;};
	case 3: {[_vehicle,"HitFuel","fueltank"] call life_fnc_repair_action;};
};
disableSerialization;
_dialog = findDisplay 3382;
_Info = _dialog displayCtrl 3385;
_Info ctrlSetStructuredText parseText format["<t align='left' size='1.2'>Fahrzeug Status</t><br/><br/><t align='left' color='#FFB124'>Body:</t> %1<br/><t align='left' color='#FFB124'>Motor:</t> %2<br/><t align='left' color='#FFB124'>Tank:</t> %3<br/><br/><t align='left' color='#FFB124'>Reifen L1:</t> %4<br/><t align='left' color='#FFB124'>Reifen L2:</t> %5<br/><t align='left' color='#FFB124'>Reifen L3:</t> %6<br/><t align='left' color='#FFB124'>Reifen L4:</t> %7<br/><br/><t align='left' color='#FFB124'>Reifen R1:</t> %8<br/><t align='left' color='#FFB124'>Reifen R2:</t> %9<br/><t align='left' color='#FFB124'>Reifen R3:</t> %10<br/><t align='left' color='#FFB124'>Reifen R4:</t> %11</t>",100 - ((_vehicle getHitpointDamage "HitBody")*100),100 - ((_vehicle getHitpointDamage "HitEngine")*100),100 - ((_vehicle getHitpointDamage "HitFuel")*100),100 - ((_vehicle getHitpointDamage "HitLFWheel")*100),100 - ((_vehicle getHitpointDamage "HitLF2Wheel")*100),100 - ((_vehicle getHitpointDamage "HitLMWheel")*100),100 - ((_vehicle getHitpointDamage "HitLBWheel")*100),100 - ((_vehicle getHitpointDamage "HitRFWheel")*100),100 - ((_vehicle getHitpointDamage "HitRF2Wheel")*100),100 - ((_vehicle getHitpointDamage "HitRMWheel")*100),100 - ((_vehicle getHitpointDamage "HitRBWheel")*100)];