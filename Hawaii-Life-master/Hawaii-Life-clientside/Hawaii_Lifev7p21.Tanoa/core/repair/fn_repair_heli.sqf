/*
	File: fn_repair_heli.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
private ["_vehicle","_type","_dialog","_Info"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {closeDialog 0;hint "Vor dir ist kein Fahrzeug!";};
if(player distance _vehicle > 10) exitWith {closeDialog 0;hint "Du bist zu weit weg!";};
_type = [_this,0,0,[0]] call BIS_fnc_param;

switch (_type) do {
	case 0: {[_vehicle,"HitHRotor","HRotor"] call life_fnc_repair_action;};
	case 1: {[_vehicle,"HitVRotor","VRotor"] call life_fnc_repair_action;};
	case 2: {[_vehicle,"HitAvionics","Avionics"] call life_fnc_repair_action;};
	case 3: {[_vehicle,"HitEngine","engine"] call life_fnc_repair_action;};
	case 4: {
		switch (true) do {
			case (_vehicle getHitPointDamage "HitEngine" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens auf 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitAvionics" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens auf 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitHRotor" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens auf 90% repariert sein."};
			case (_vehicle getHitPointDamage "HitVRotor" > 0.1): {hint "Um die Hull zu reparieren muessen alle anderen Teile des Fahrzeugs mindestens auf 90% repariert sein."};
			default {[_vehicle,"HitHull","hull"] call life_fnc_repair_action;};
		};
	};
};
disableSerialization;
_dialog = findDisplay 3383;
_Info = _dialog displayCtrl 3385;
_Info ctrlSetStructuredText parseText format["<t align='left' size='1.2'>Fahrzeug Status</t><br/><br/><t align='left' color='#FFB124'>Body:</t> %1<br/><t align='left' color='#FFB124'>Inst:</t> %2<br/><t align='left' color='#FFB124'>Motor:</t> %3<br/><br/><t align='left' color='#FFB124'>HRotor:</t> %4<br/><t align='left' color='#FFB124'>VRotor</t> %5</t>",100 - ((_vehicle getHitpointDamage "HitHull")*100),100 - ((_vehicle getHitpointDamage "HitAvionics")*100),100 - ((_vehicle getHitpointDamage "HitEngine")*100),100 - ((_vehicle getHitpointDamage "HitHRotor")*100),100 - ((_vehicle getHitpointDamage "HitVRotor")*100)];