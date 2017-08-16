#include "..\..\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
_taserwaffen = ["hgun_P07_F","hgun_P07_snds_F","hgun_P07_khk_F","hgun_P07_khk_Snds_F"];
_taserpojectil = ["B_9x21_Ball"];

params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

//Handle the tazer first (Top-Priority).
if (!isNull _source && !(_unit getvariable "esg_bewusstlos") && (isPlayer _source)) then {
    if (_source != _unit) then {
        if (currentWeapon _source in _taserwaffen && _projectile in _taserpojectil) exitWith {
                _damage = 0;
                if (alive player && !(player getVariable ["istazed",false]) && !life_isknocked && !(_unit getVariable ["restrained",false])) then {
                    private ["_distance"];
                    _distance = 100;
                    if (_unit distance _source < _distance) then {
                        if (vehicle player != player) then {
						if (typeOf (vehicle player) isEqualTo "B_Quadbike_01_F") then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						};
					} else {
						[_unit,_source] spawn life_fnc_tazed;
					};
				};
			};
			_damage;
        };
    };
	_damage;
};
if (currentWeapon _source in _taserwaffen && _projectile in _taserpojectil) exitWith {_damage = damage player; _damage;};
if ((_unit distance (getmarkerpos "safezone_markt_map")) <= 150) exitWith {_damage = 0; _damage;};
if(_unit getVariable ["istazed",false])exitWith {_unit getVariable "esg_damagestore";};
if (isNull _source && {_unit getVariable "esg_bewusstlos"}) exitWith {_unit getVariable "esg_damagestore";};	//<-- exclude NullSource break down some other game features!!!
if (_part in ["face_hub","neck","pelvis","spine1","spine2","spine3","body"]) exitWith {0};
/* Attempt at correcting the damage values */
if (_part isEqualTo "") then {
	_damage = _damage - (getDammage _unit);
} else {
	_dmg = _unit getHit _part;
	_damage = _damage - _dmg;
};
// Since fire starts to "damage" with minimal damage at a large radio, reduce anything that is less than 1e-7 to zero */
_damage = if (_damage < 1e-7) then {0} else {_damage};


_return = _damage / 1.2;			// damage scaler to make unit more or less tough
_newDamage = (damage vehicle _unit) + _return;
_overall_damage = 0;
_agony = false;
_dead = false;


if (!(_unit getVariable "esg_bewusstlos") && {alive _unit}) then {
	switch (toLower _part) do {
		case "": {
			_newDamage = (damage vehicle _unit) + _return;
			if(_newDamage > 0.94) then {
				_agony = true;
				_newDamage = 0.98;
			};
			_unit setHit ["body",_newDamage];
		};

		case "body": {	// die till 1.0, no overall damage
			_newDamage = (_unit getHit "body") + _return;
			if(_newDamage > 0.99) then {
				_agony = true;
				_newDamage = 0.99;
			};
			_unit setHit ["body",_newDamage];
		};

		case "head": {	// die till 1.0, no overall damage
			if (_damage > 20) exitWith {};	// ghost-dead-bug
			_newDamage = (_unit getHit "head") + _return;
			if(_newDamage > 0.99) then {
				_agony = true;
				_newDamage = 0.99;
			};
			_unit setHit ["head",_newDamage];
		};

		case "legs": {	// cant die, no overall damage
			_newDamage = (_unit getHit "legs") + _return;
			if(_newDamage > 1.8) then {
				_agony = true;
			};
			_newDamage = if (_newDamage >= 0.5) then {0.4} else {_newDamage};
			_unit setHit ["legs",_newDamage];
		};

		case "hands": {	// cant die, no overall damage
			_newDamage = (_unit getHit "hands") + _return;
			if(_newDamage > 3) then {
				_agony = true;
			};
			_unit setHit ["hands",_newDamage];
		};
		default {};
	};


	_overall_damage = ((_unit getHit "head") * 0.5) + ((_unit getHit "body") * 0.4) + ((_unit getHit "legs") * 0.2) + ((_unit getHit "hands") * 0.13);

	if (_overall_damage > 0.99) then {
		_overall_damage = (0.85 + (random 0.08));
	};

	if (_agony && {!(_unit getVariable "esg_bewusstlos")} && {!_dead} && {_overall_damage <= 0.99}) then {
		_unit setVariable ["esg_bewusstlos", true, true];
		_time = ["survive"]call ESG_fnc_skilltime;
		_delay = time + _time;										// invulnerable for time x after fall in agony
		_unit setVariable ["esg_bewusstlos_delay", _delay,true];
		[_source getVariable ["realname", name vehicle player]]spawn life_fnc_injured;
		_log = format["%1 (%2) hat %3 (%4) verwundet. Waffe: %5 Distanz: %6", _source getVariable["realname", name _source], getPlayerUID _source, _unit getVariable["realname", name _unit], getPlayerUID _unit, currentWeapon _source, _unit distance _source];
		["INJURE_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];
	};
/*
	if (_overall_damage < 0.4) then {							// ensure blood
		_overall_damage = 0.38;
	};
*/
	if (_dead/* || _overall_damage > 0.99*/) then {					// real death
		_overall_damage = 1;
	};

} else {
	_overall_damage = switch (true) do {
		case (!alive _unit) : {0.5};
		case (time > (_unit getVariable "esg_bewusstlos_delay")) : {1};
		case (_unit getVariable ["esg_bewusstlos", false]): {_damage};
		default {_unit getVariable ["esg_damageStore", 1]};
	};
};
_unit setVariable ["esg_damagestore", _overall_damage,true];

[] spawn life_fnc_hudUpdate;
_overall_damage;