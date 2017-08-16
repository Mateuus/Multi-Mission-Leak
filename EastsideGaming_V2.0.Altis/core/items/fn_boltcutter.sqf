#include "..\..\script_macros.hpp"
/*
    File: fn_boltcutter.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Breaks the lock on a single door (Closet door to the player).
*/
private ["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_building = param [0,objNull,[objNull]];

private _vaultHouse = [[["Altis", "Land_Cargo_House_V2_F"], ["Tanoa", "Land_Medevac_house_V1_F"]]] call TON_fnc_terrainSort;
private _altisArray = [9254.37,21578,0];
private _tanoaArray = [11074.2,11501.5,0.00137329];
private _pos = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;

if (isNull _building) exitWith {};
if (!(_building isKindOf "House_F")) exitWith {hint localize "STR_ISTR_Bolt_NotNear";};

if (((nearestObject [_pos,"Land_Dome_Small_F"]) isEqualTo _building || (nearestObject [_pos,_vaultHouse]) isEqualTo _building) && (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops")))) exitWith {
    hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops"))];
};

if ((typeOf _building) isEqualTo _vaultHouse && (nearestObject [_pos,"Land_Dome_Small_F"]) getVariable ["locked",true]) exitWith {hint localize "STR_ISTR_Bolt_Exploit"};
if (isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};

_doors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _building),"numberOfDoors");
_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
    _selPos = _building selectionPosition format ["Door_%1_trigger",_i];
    _worldSpace = _building modelToWorld _selPos;
        if (player distance _worldSpace < 2) exitWith {_door = _i;};
};
if (_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if ((_building getVariable [format ["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

if ((nearestObject [_pos,"Land_Dome_Small_F"]) isEqualTo _building || (nearestObject [_pos,_vaultHouse]) isEqualTo _building) then {
    [[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
} else {
    [0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};

life_action_inUse = true;
//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
    case "Land_Dome_Small_F": {_cpRate = 0.003;};
    case "Land_Medevac_house_V1_F";
    case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
    default {_cpRate = 0.01;}
};

_time = ["boltcutter"]call ESG_fnc_skilltime;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    sleep _time;
    if (isNull _ui) then {
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive player) exitWith {};
    if (player getVariable ["istazed",false]) exitWith {}; //Tazed
    if (life_isknocked) exitWith {}; //Knocked
    if (life_interrupted) exitWith {};
	if(player getVariable["esg_bewusstlos",false])exitWith {_t2 = "Abgebrochen";};
};

//Kill the UI display and check for various states
for "_i" from 0 to 1 step 0 do {
	sleep .0006;
	_cP = _cP - .01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format ["%1 (Fertig)",_title];
	if (_cP <= 0 || !alive player) exitWith {};
};
"progressBar" cutFadeOut 1;
player playActionNow "stop";
if (!alive player || (player getVariable ["istazed",false]) || life_isknocked) exitWith {life_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player getVariable["esg_bewusstlos",false])exitWith {life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;

if (life_boltcutter_uses >= 5) then {
    [false,"boltcutter",1] call life_fnc_handleInv;
    life_boltcutter_uses = 0;
};

_building setVariable [format ["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
_building setVariable ["locked",false,true];


[getPlayerUID player,profileName,"459"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
["boltcutter",1]call ESG_fnc_skilladd;