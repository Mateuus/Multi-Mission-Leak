#include "..\..\script_macros.hpp"
/*
    File: fn_tazed.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the tazed animation and broadcasts out what it needs to.
*/
private ["_curWep","_curMags","_attach"];
params [
    ["_unit",objNull,[objNull]],
    ["_shooter",objNull,[objNull]]
];

if (isNull _unit || isNull _shooter) exitWith {player allowDamage true; player setVariable ["istazed",false,true];};

if (_shooter isKindOf "Man" && alive player) then {
    if (!(player getVariable ["istazed",false])) then {
        player setVariable ["istazed",true,true];
        _curWep = currentWeapon player;
        _curMags = magazines player;
        _attach = if (!(primaryWeapon player isEqualTo "")) then {primaryWeaponItems player} else {[]};

        {player removeMagazine _x} forEach _curMags;
        player removeWeapon _curWep;
        player addWeapon _curWep;
        if (!(count _attach isEqualTo 0) && !(primaryWeapon player isEqualTo "")) then {
            {
                _unit addPrimaryWeaponItem _x;
            } forEach _attach;
        };

        if (!(count _curMags isEqualTo 0)) then {
            {player addMagazine _x;} forEach _curMags;
        };
		
		enableCamShake true;
		addCamShake [10, 10, 16];
		
		[_unit] remoteExecCall ["life_fnc_tazeSound",RCLIENT];
        []spawn {
			_ragdoll = "Land_Can_V1_F" createVehicleLocal [0,0,0];
			_ragdoll setMass 1e10;
			_ragdoll attachTo [player, [0,0,0], "Spine3"];
			_ragdoll setVelocity [0,0,6];
			player allowDamage false;
			detach _ragdoll;
			0 = _ragdoll spawn 
			{
				deleteVehicle _this;
				player allowDamage true;
			};
		};
        [0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        disableUserInput true;
        sleep 10;

        [player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["life_fnc_animSync",RCLIENT];

        if (!(player getVariable ["Escorting",false])) then {
            detach player;
        };
        player setVariable ["istazed",false,true];
        _unit allowDamage true;
        disableUserInput false;
    };
} else {
    _unit allowDamage true;
    player setVariable ["istazed",false,true];
};
