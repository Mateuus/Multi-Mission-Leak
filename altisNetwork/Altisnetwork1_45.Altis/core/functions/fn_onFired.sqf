#include "..\..\script_macros.hpp"
/*
    File: fn_onFired.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];

//_unit = _this select 0;
//_weapon = _this select 1;
_ammoType = _this select 4;
_projectile = _this select 6;

if (_ammoType isEqualTo "GrenadeHand_stone") then {
    _projectile spawn {
        private "_position";
        while {!isNull _this} do {
            _position = ASLtoATL (visiblePositionASL _this);
            sleep 0.1;
        };
        [_position] remoteExec ["life_fnc_flashbang",RCLIENT];
    };
};
/*
//Police Pistol tazer, one shot then reload! - Should stop getting killed by taser
if (_weapon in ["hgun_P07_snds_F"]) then
{
	_unit setAmmo [_weapon, 1];
	sleep 0.1;
	_unit setAmmo [_weapon, 0];
};
*/