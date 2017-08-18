/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	Modified: Kai
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_curWep = "";
_curMag = "";

if(isPlayer _source && _source isKindOf "Man") then {
	_curWep = currentWeapon _source;
	_curMag = currentMagazine _source;
};

//Advanced Tazer Mechanism
if (((_curMag == "30Rnd_65x39_caseless_mag_Tracer") || (_curWep in ["SMG_02_F","hgun_P07_F","hgun_P07_snds_F"]))&&(_projectile in ["B_65x39_Caseless","B_9x21_Ball"])) then {
	if ((((getDammage _unit) + _damage) >= 0.9) || (_damage >= 0.9)) then {
		_damage = 0;
		[_source] spawn life_fnc_handleDowned;
	};
};

//Anti-VDM Mechanism
if (vehicle _unit == _unit) then {
		if ( _source isKindOf "Air" OR _source isKindOf "Car" OR _source isKindOf "Boat" ) then
		{
			_damage = false;
		} else {	
		_isVehicle = vehicle _source;
		if (_isVehicle isKindOf "Air" OR _isVehicle isKindOf "Car" OR _isVehicle isKindOf "Boat") then 
		{
			_damage = false;
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;