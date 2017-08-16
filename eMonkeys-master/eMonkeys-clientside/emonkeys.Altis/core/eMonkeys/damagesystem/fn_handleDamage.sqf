/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep","_tazed","_car"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_count = _this select 5;
_tazed = false;
_car = false;

if(!isNull _source) then
{
	if(_source != _unit) then
	{
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"] && vehicle player == _unit) then
		{
			_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
			if((_unit distance _source < _distance) && !eM_istazed && !(_unit getVariable["restrained",false])) then
			{
				if(_projectile == "B_9x21_Ball" && ((([_source,"ps"] call EMonkeys_fnc_permGetLevel) > 0) || (([_source,"ksk"] call EMonkeys_fnc_permGetLevel) > 0)) && playerSide != west) then
				{
					_tazed = true;
					[_unit,_source] spawn EMonkeys_fnc_tazed;
				};
				if(side _source == west && playerSide != west) then
				{
					_tazed = true;
					[_unit,_source] spawn EMonkeys_fnc_tazed;
				};
			};
		};
	};
};

if (vehicle _unit == _unit) then {

	if (_source isKindOf "Air" OR _source isKindOf "Car" OR _source isKindOf "Boat") then {
		_car = true;

		[[player,"amovppnemstpsraswrfldnon"],"Emonkeys_fnc_animSync",true,false] call Emonkeys_fnc_MP;
	} else {
		_isVehicle = vehicle _source;
		if (_isVehicle isKindOf "Air" OR _isVehicle isKindOf "Car" OR _isVehicle isKindOf "Boat") then
		{
			_car = true;
			[[player,"amovppnemstpsraswrfldnon"],"Emonkeys_fnc_animSync",true,false] call Emonkeys_fnc_MP;
		};
	};
};


if (!_tazed && !_car && !((isNull _source) && (vehicle player == player))) then {
[_this] call EMonkeys_fnc_damage_add;
};

_damage = false;
_damage;