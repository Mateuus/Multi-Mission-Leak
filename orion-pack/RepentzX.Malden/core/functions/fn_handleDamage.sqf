#include "..\..\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];
_currdamage = damage player;

//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        if (currentWeapon _source in ["hgun_Pistol_heavy_01_F"] && _projectile in ["B_45ACP_Ball"]) then {
            if (side _source isEqualTo west && playerSide isEqualTo civilian) then {
                _damage = 0;
                if (alive player && !life_istazed && !life_isknocked && !(_unit getVariable ["restrained",false])) then {
                    private ["_distance"];
                    _distance = 35;
                    if (_projectile == "B_556x45_dual") then {_distance = 100;};
                    if (_unit distance _source < _distance) then {
                        if !(isNull objectParent player) then {
                            if (typeOf (vehicle player) == "B_Quadbike_01_F") then {
                                player action ["Eject",vehicle player];
                                [_unit,_source] spawn life_fnc_tazed;
                            };
                        } else {
                            [_unit,_source] spawn life_fnc_tazed;
                        };
                    };
                };
            };

            //Temp fix for super tasers on cops.
            if (side _source isEqualTo west && (playerSide isEqualTo west || playerSide isEqualTo independent)) then {
                _damage = 0;
            };
        };
    };
};

if (safezone) then {
	if (isNull _source) exitWith {_damage = 0;};
	if (_projectile isEqualTo "Bo_Mk82") exitWith {};
	if (_sourceCop || _sourceIsRebel) then {
		// Player should take damage since he/she was shot by a cop, therefore, nothing is done

	} else {

		if (isPlayer _source) then {
			//if (_sourceIsRebel) exitWith {_damage;};

			//diag_log format["Took damage from a non rebel player, cancelling.. (%1)",str(_source)];
			_damage = 0;
} else {
			//diag_log format["Took damage from something else than a player, cancelling.."];
			// Player took damage from something else than a player, not taking damage.
			_damage = 0;
		};

		if (_projectile isEqualTo "") exitWith {_damage = 0;};
		/*
		if (alive _source && _source getVariable ["rebel",false]) exitWith {
			_damage;
		};
		*/
	};
};

if (vehicle _unit == _unit) then {
    if ( _source isKindOf "Air" OR _source isKindOf "Car" OR _source isKindOf "Motorcycle" OR _source isKindOf "Boat" OR _source isKindOf "Tank" ) then {
    	
    } else {
        _isVehicle = vehicle _source;
        if (_isVehicle isKindOf "Air" OR _isVehicle isKindOf "Car" OR _isVehicle isKindOf "Boat" OR _isVehicle isKindOf "Motorcycle" OR _isVehicle isKindOf "Tank") then
        {
            _damage = _currdamage;
        };
    };
};

if (_damage > 0) then {
    [] call life_fnc_firstViewCombat;
};

if ((vehicle _unit) isKindOf "Car" && (isNull _source || _source isEqualTo _unit)) then
{
	_damage = if (life_seatbelt) then { _damage / 2 } else { _damage};
};

[] spawn life_fnc_hudUpdate;
_damage;