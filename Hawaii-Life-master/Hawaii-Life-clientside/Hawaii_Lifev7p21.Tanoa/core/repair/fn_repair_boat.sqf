/*
	File: fn_repair_boat.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
private ["_vehicle","_type","_dialog","_Info"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {closeDialog 0;hint "Vor dir ist kein Fahrzeug!";};
if(player distance _vehicle > 10) exitWith {closeDialog 0;hint "Du bist zu weit weg!";};
_type = [_this,0,0,[0]] call BIS_fnc_param;

switch (_type) do {
	case 0: {[_vehicle,"HitEngine","engine"] call life_fnc_repair_action;};
	case 1: {
		if (_vehicle getHitPointDamage "HitEngine" > 0.1) then {
			hint "Um die Hull zu reparieren muss der Motor mindestens zu 90% repariert sein.";
		} else {
			[_vehicle,"HitHull","hull"] call life_fnc_repair_action;;
		};
	};
};

disableSerialization;
_dialog = findDisplay 3384;
_Info = _dialog displayCtrl 3385;

if(typeOf (_vehicle) in ["O_SDV_01_F","B_SDV_01_F","C_Rubberboat","B_Boat_Transport_01_F","B_Boat_Armed_01_minigun_F"]) then {
	_Info ctrlSetStructuredText parseText format["<t align='left' size='1.2'>Fahrzeug Status</t><br/><br/><t align='left' color='#FFB124'>Body:</t> %1<br/><t align='left' color='#FFB124'>Motor:</t> %2</t>",100 - ((_vehicle getHitpointDamage "HitBody")*100),100 - ((_vehicle getHitpointDamage "HitEngine")*100)];
} else {
	_Info ctrlSetStructuredText parseText format["<t align='left' size='1.2'>Fahrzeug Status</t><br/><br/><t align='left' color='#FFB124'>Body:</t> %1<br/><t align='left' color='#FFB124'>Motor:</t> %2</t>",100 - ((_vehicle getHitpointDamage "HitHull")*100),100 - ((_vehicle getHitpointDamage "HitEngine")*100)];
};