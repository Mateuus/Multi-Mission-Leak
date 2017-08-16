/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_vehicle", "_trunk", "_value", "_vehicleDisplayName", "_owner", "_weaponCargo", "_magazineCargo"];
_vehicle = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_trunk = _vehicle getVariable ["trunk", []];
_value = 0;
_vehicleDisplayName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
_owner = _vehicle getVariable ["vehicle_info_owners", []];

//--- Error checks
if (isNull _vehicle) exitWith {};

//--- Owner info
_owner = [(_owner select 0) select 1, "Unknown"] select (count _owner == 0);

//--- Action
if ([30 + random 15, "Seizing Cargo", "", {!isNull _this && {[player, _this, 2] call GTA_fnc_boundingCollision}}, _vehicle] call GTA_fnc_action) then {
	//--- Check items in trunk
	if (count _trunk > 0) then {
		_trunk = _trunk select 0;

		//--- Search for illegal items
		{
			private ["_handle", "_var", "_str", "_count"];
			_handle = _x select 0;
			_var = [_handle, 0] call life_fnc_varHandle;
			_str = [_var] call life_fnc_varToStr;
			_count = _x select 1;

			//--- Check if item is illegal
			if (!([_handle] call GTA_fnc_isVirtualItemLegal) && {_count > 0}) then {
				//--- Add to value
				_value = _value + (5000 * _count);
			};
		} forEach _trunk;
	};

	//--- Search for illegal weapons
	_weaponCargo = getWeaponCargo _vehicle;
	{
		private ["_weapon", "_count", "_type"];
		_weapon = _x;
		_count = (_weaponCargo select 1) select _forEachIndex;
		_type = getNumber (configFile >> "CfgWeapons" >> _weapon >> "type");

		//--- Check type
		if (_type in [1, 4]) then {
			//--- Add to value
			_value = _value + (50000 * _count);
		};
	} forEach (_weaponCargo select 0);

	//--- Search for illegal magazines
	_magazineCargo = getMagazineCargo _vehicle;
	{
		private ["_magazine", "_count", "_weaponType", "_weaponMagazines"];
		_magazine = _x;
		_count = (_magazineCargo select 1) select _forEachIndex;

		{
			scopeName "illegalMagazineCheck";

			//--- Check if the weapon type is illegal
			_weaponType = getNumber (_x >> "type");
			if (_weaponType in [1, 4]) then {
				//--- Check if the magazine is used by this weapon
				_weaponMagazines = getArray (_x >> "magazines");
				if ({_x == _magazine} count _weaponMagazines > 0) then {
					//--- Add to value
					_value = _value + (500 * _count);
					breakOut "illegalMagazineCheck";
				};
			};
		} forEach ("true" configClasses (configFile >> "CfgWeapons"));
	} forEach (_magazineCargo select 0);

	//--- Clear inventory
	_vehicle setVariable ["trunk", [[], 0], true];
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;

	//--- Add value to bank account
	GTA_money_bank = GTA_money_bank + _value;
	[1] call GTA_fnc_updatePlayerPartial;

	//--- Broadcast
	if (_value > 0) then {
		[[0, ["STR_GTA_ACTIONS_SEARCHTRUNK", [_value] call life_fnc_numberText, _owner, _vehicleDisplayName, profileName]], "GTA_fnc_broadcast"] call GTA_fnc_remoteExec;
	};

	titleText ["Cargo has been seized", "PLAIN"];

} else {
	titleText ["Search interrupted", "PLAIN"];
};
