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

//laser tag
if (life_laser_inprogress) then
{
    if (((((getDammage _unit) + _damage) >= 0.95) || (_damage >= 0.95)) && ((player getVariable ["laserTeam",0]) != (_source getVariable ["laserTeam",0]))) then
    {
        [_source] spawn life_fnc_handleTagged;
    };
    _damage = 0;
};

//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        if (currentWeapon _source in ["hgun_P07_snds_F","arifle_SDAR_F"] && _projectile in ["B_9x21_Ball","B_556x45_dual"]) then {
            if (side _source isEqualTo west && playerSide isEqualTo civilian) then {
                _damage = 0;
                if (alive player && !life_istazed && !life_isknocked && !(_unit getVariable ["restrained",false]) && !(_unit getVariable ["restrainedz",false])) then {
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
        if (vehicle _unit isEqualTo _unit) then
        {
            _vehicle = vehicle _source;
            if ( vehicle _vehicle isKindOf "Air" || vehicle _vehicle isKindOf "Car" ||vehicle  _vehicle isKindOf "Boat" ) then
            {
                _speed = speed _vehicle;
                [] spawn KK_fnc_forceRagdoll;
                if(_speed < 50) then { _damage = 0.1; }; 
                if(_speed < 25) then { _damage = 0; }; 
                if(_speed > 49) then { _damage = _speed / 100; };
            };
        };
    };
};

if( vehicle player != player && vehicle _source != _source && _source isEqualTo _unit ) then { _damage = _damage / 5; [] spawn KK_fnc_forceRagdoll; };

// Prison and court!
if (life_is_arrested || !isNil "life_jury_active") then
{
    _damage = 0;
};

[] spawn life_fnc_hudUpdate;
_damage;