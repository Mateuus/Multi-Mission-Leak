#include "..\..\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
_taserwaffen = ["hgun_Pistol_heavy_02_F","hgun_Pistol_heavy_02_Yorris_F"];
_taserpojectil = ["B_45ACP_Ball"];

params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];
if ((_unit distance (getmarkerpos "safezone_1")) <= 150) exitWith {_damage = damage player; _damage;};

if(!isNull _source && !(vehicle _source isEqualTo _source)) then {
	_damage = 0;
	if((vehicle _source isKindof "Car") || (vehicle _source isKindof "Ship") || (vehicle _source isKindof "Air")) then {
		hintSilent format ["Du wurdest von %1 angefahren.", _source getVariable ["realname",name _source]];
		_damage = damage player;
	};
};

/*
if((_damage > 1) || (((getdammage _unit) + _damage) > 1) && (isPlayer _unit) && (isPlayer _source)) then {
	if(_unit getVariable["injured",false]) then {
		_unit setVariable["injured",false,true];
		_damage;
	} else {
		systemchat format["Injured von %1",name _source];
		_unit setVariable["injured",true,true];
		player setDamage 0.5;
		player setBleedingRemaining 120;
		player setUnconscious true;
		player switchCamera "INTERNAL";
		while{_unit getVariable["injured",false]} do {
			waitUntil{cameraView != "INTERNAL"};
			player switchCamera "INTERNAL";
		};
		_damage = 0;
	};
};
*/
//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        if (currentWeapon _source in _taserwaffen && _projectile in _taserpojectil) then {
                _damage = 0;
                if (alive player && !(_unit getVariable ["istazed",false]) && !life_isknocked && !(_unit getVariable ["restrained",false])) then {
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
        };
    };
};

[] spawn life_fnc_hudUpdate;
_damage;