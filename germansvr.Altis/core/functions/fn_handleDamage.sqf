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

//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        if (currentWeapon _source in ["hgun_P07_snds_F","hgun_P07_F","arifle_ARX_blk_F"] && _projectile in ["B_9x21_Ball","10Rnd_50BW_Mag_F"]) then {
			if (alive player && !(_unit getVariable ["restrained",false])) then {
				private ["_distance"];
				_damage = 0;                    
                if (vehicle player != player) then {
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
};
if(vehicle _source isKindOf "LandVehicle") then {
	if(_source != _unit AND {alive _unit} AND {isPlayer _source}) then {
		_damage = 0.85;
	};
};
call updateHUD_damage;
_damage;
