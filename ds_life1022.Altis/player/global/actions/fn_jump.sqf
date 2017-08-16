/*
	Darkside Life

	Author: Unknown

	Description:
	Makes a player jump
*/

private ["_oldPos","_weaponOut","_vel","_dir","_v1","_v2","_oldPos","_anim"];

params [["_unit",objNull,[objNull]]];

if(isNull _unit)exitWith{};

_oldPos = getPosATL _unit;

if((animationState _unit) == "AovrPercMrunSrasWrflDf")exitWith{};

_weaponOut = if(!((currentWeapon _unit) isEqualTo ""))then{true}else{false};

if(local _unit)then {
	_v1 = if(_weaponOut)then{3.82}else{5};
	_v2 = 0.4;
	_dir = direction player;
	_vel = velocity _unit;
	_unit setVelocity [(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)+_v1];
};

_anim = animationState _unit;

if(_weaponOut)then {
	_unit switchMove "AovrPercMrunSrasWrflDf";
};

if(local _unit)then {
	waitUntil {
        if(((getPos _unit) select 2) > 4)then {
            _unit setPosATL _oldPos;
            _unit setVelocity [0,0,0];
        };

        ((animationState _unit) != "AovrPercMrunSrasWrflDf")
    };

	_unit switchMove _anim;
};