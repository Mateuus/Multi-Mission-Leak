/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_unit", "_bleed"];
_unit = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_bleed = [_this, 1, true, [true]] call GTA_fnc_param;

if (_bleed) then {
	//--- Store blood and damage
	_unit setVariable ["GTA_revive_blood", 1];
	_unit setVariable ["GTA_revive_damage", 0];

	//--- Setup the damage event handler
	_damageEH = _unit addEventHandler ["HandleDamage", {
		private ["_unit", "_selection", "_damage"];
		_unit = _this select 0;
		_selection = _this select 1;
		_damage = _this select 2;

		//--- Store damage dealt
		if (local _unit && {(toUpper _selection) in ["", "HEAD"]}) then {_unit setVariable ["GTA_revive_damage", (_unit getVariable "GTA_revive_damage") + _damage, true]};

		//--- Prevent damage
		0
	}];

	//--- Store damage event
	_unit setVariable ["GTA_revive_damageEH", _damageEH];

	//--- Reset damage
	_unit setDamage 0;

	//--- Blood simulation
	_unit spawn {
		scriptName "GTA_fnc_reviveBleedOut: blood loop";

		private ["_unit", "_delay", "_timeBefore", "_blood", "_damage"];
		_unit = _this;
		_delay = getNumber (missionConfigFile >> "GTA_CfgRevive" >> "bleedOutDelay");
		_unit setVariable ["GTA_revive_bleedStart", time];

		waitUntil {
			//--- Get damage
			_damage = _unit getVariable ["GTA_revive_damage", 0];
			_timeBefore = _unit getVariable ["GTA_revive_bleedStart", time];

			//--- Calculate blood
			_blood = _delay - (time - _timeBefore);
			_blood = ((_blood / _delay) - _damage);

			//--- Set blood
			_unit setVariable ["GTA_revive_blood", _blood];

			//--- Check
			if (isNull (_unit getVariable ["GTA_revive_helper", objNull])) then {
				_blood <= 0 || _damage >= 1 || !(_unit getVariable "incapacitated") || !alive _unit
			} else {
				_damage >= 1 || !(_unit getVariable "incapacitated") || !alive _unit
			};
		};

		//--- Disable bleed out
		[_unit, false] call GTA_fnc_reviveBleedOut;

		//--- Kill unit if it bled out
		if (_unit getVariable "incapacitated") then {
      forceRespawn _unit;
    };
	};
} else {
	//--- Nil blood and damage
	_unit setVariable ["GTA_revive_blood", nil];
	_unit setVariable ["GTA_revive_damage", nil];

	//--- Remove damage event
	_unit removeEventHandler ["HandleDamage", _unit getVariable "GTA_revive_damageEH"];
	_unit setVariable ["GTA_revive_damageEH", nil];
};
