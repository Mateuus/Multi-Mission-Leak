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
        if (currentMagazine _source in ["11Rnd_45ACP_Mag"] && _projectile in ["B_45ACP_Ball"]) then {
            if (side _source isEqualTo west || (side _source isEqualTo civilian) && (playerSide isEqualTo civilian) || (playerSide isEqualTo west)) then {
                _damage = 0;
                if (alive player && !life_istazed && !life_isknocked && !(_unit getVariable ["restrained",false])) then {
                    private ["_distance"];
                    _distance = 100;
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
            if (side _source isEqualTo west || (side _source isEqualTo civilian) && (playerSide isEqualTo independent)) then {
                _damage = 0;
            };
        };

		//Rubberbullets
		if (currentMagazine _source in ["30Rnd_65x39_caseless_mag_Tracer"] && _projectile in ["B_65x39_Caseless"]) then {
            if (side _source isEqualTo west && playerSide isEqualTo civilian) then {
                _damage = 0;
                if (alive player && !life_istazed && !life_isknocked && !(_unit getVariable ["restrained",false])) then {
                    private ["_distance"];
                    _distance = 300;
                    if (_unit distance _source < _distance) then {
                        if !(isNull objectParent player) then {
                            if (typeOf (vehicle player) == "B_Quadbike_01_F") then {
                                player action ["Eject",vehicle player];
                                [_unit,_source] spawn life_fnc_tazedRubber;
                            };
                        } else {
                            [_unit,_source] spawn life_fnc_tazedRubber;
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

//VDM Report And ADD
if ((isPlayer _source) && (vehicle _source != _source)) then {
if(_part == "body" && (player getVariable["limit",true]) && (side _source == civilian)) then {
player setVariable ["limit",false];
[_source] spawn {
_driver = _this select 0;
//[0,format["%1 just ran over %2!", name _driver, name player]] remoteExec ["life_fnc_broadcast",0];
sleep(10);
player setVariable ["limit",true];
	};
};
_damage = getDammage player;
};

if ((vehicle _unit) isKindOf "Car" && (isNull _source || _source isEqualTo _unit)) then
{
 _damage = if (life_seatbelt) then { _damage / 2 } else { _damage * .75};
};

[] spawn life_fnc_hudUpdate;
_damage;
