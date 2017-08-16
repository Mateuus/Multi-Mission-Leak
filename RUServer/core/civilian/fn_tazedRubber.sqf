#include "..\..\script_macros.hpp"
/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine
	Editor: Repentz to improve the function

	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = param [0,Objnull,[Objnull]];
_shooter = param [1,Objnull,[Objnull]];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};
if(player getVariable["restrained",false]) exitWith {};
_time = time;
if(_shooter isKindOf "Man" && alive player) then {
	if(!life_istazed) then {
		life_istazed = true;
		"DynamicBlur" ppEffectEnable true;
		"DynamicBlur" ppEffectAdjust [20];
		"DynamicBlur" ppEffectCommit 1;
		player allowDamage false;
		if(isNull objectParent player) then {
			for [{_x=1},{_x<=10},{_x=_x+1}] do { call SOCK_fnc_tazeRagdoll; sleep 0.1; if(animationState player == "unconscious") exitWith{}};
		};
		//[_unit] remoteExecCall ["life_fnc_tazeSound",RCLIENT];
		[0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable["realname",name _shooter]]] remoteExecCall ["life_client_fnc_broadcast",-2];
		disableUserInput true;
		player setDamage 0;
		waitUntil{animationState player != "unconscious"};
		_anim = if(isNull objectParent player) then {"Incapacitated"} else {"kia_driver_mid01"};
		[player,_anim] remoteExec ["life_client_fnc_animSync",0];
		waitUntil{time - _time >= 40};
		player allowDamage true;
		if(!(player getVariable["Escorting",false])) then {
			detach player;
		};
		"DynamicBlur" ppEffectEnable false;
		life_istazed = false;
		disableUserInput false;
		player playMoveNow "amovppnemstpsraswrfldnon";
    player setFatigue 1; //no running for you
    player setdamage 0.25; //especially no running for you
	};
} else {
	_unit allowDamage true;
	life_iztazed = false;
};





//#include "..\..\script_macros.hpp"
/*
    File: fn_tazed.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the tazed animation and broadcasts out what it needs to.
*/
/*private ["_curWep","_curMags","_attach"];
params [
    ["_unit",objNull,[objNull]],
    ["_shooter",objNull,[objNull]]
];

if (isNull _unit || isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};

if (_shooter isKindOf "Man" && alive player) then {
    if (!life_istazed) then {
        life_istazed = true;
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

        [_unit] remoteExecCall ["life_fnc_tazeSound",RCLIENT];
        _obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
        _obj setPosATL ASLTOATL(visiblePositionASL player);
        [player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        //[0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        _unit attachTo [_obj,[0,0,0]];
        disableUserInput true;
        sleep 40;

        [player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["life_fnc_animSync",RCLIENT];

        if (!(player getVariable ["Escorting",false])) then {
            detach player;
        };
        life_istazed = false;
        player allowDamage true;
        disableUserInput false;
    };
} else {
    _unit allowDamage true;
    life_iztazed = false;
};
*/
