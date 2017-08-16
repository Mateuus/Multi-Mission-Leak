/*
	File: fn_firedHandler.sqf
	Author: Chronic [MIT]

	Description:
	Handles weapon shots
*/

private ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
scopeName "main";

_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_mode = _this select 3;
_ammo = _this select 4;
_magazine = _this select 5;
_projectile = _this select 6;


// restrained people don't get to shoot
if((_unit getVariable ["restrained",false]) || (_unit getVariable ["downed",false])) then {
	deleteVehicle _projectile;
};

/* BOLT ACTION GUNS
_BoltAction = (["srifle_EBR", _weapon, false] call BIS_fnc_inString) || (["srifle_DMR", _weapon, false] call BIS_fnc_inString);
if(_BoltAction) then {
	scopeName "magLoop";
	_magazines = magazinesAmmoFull _unit;
	_ammoCount = 0;
	{
		if(_x select 2 && _x select 0 == _magazine) then {
			_ammoCount = _x select 1;
			breakTo "magLoop";
		};
	} foreach _magazines;
	_unit setAmmo [_weapon, 0];
	_stopReload = (findDisplay 46) displayAddEventHandler ["KeyDown", {(_this select 1) in (actionKeys "ReloadMagazine");
		}];
	[_unit, _weapon, _ammoCount, _stopReload] spawn {
		sleep 0.5;
		(_this select 0) say3D "BoltAction";
		sleep 1.3;
		(findDisplay 46) displayRemoveEventHandler ["KeyDown",_this select 3];
		(_this select 0) setAmmo [_this select 1, _this select 2];
	};
};
*/

// Electro-magnetic pulses. Need a Stone grenade to use.
_EMP = typeof _projectile == "GrenadeHand_stone"; // if it's a stone grenade, then it's an EMP grenade
if(_EMP && playerSide == west) then {
	[_projectile] spawn life_fnc_fireEMP;
};