#include "..\..\script_macros.hpp"
/*
    File: fn_jerryCanRefuel.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Jesse "tkcjesse" Schultz

    Description:
    Refuels the empty fuel canister at a gas pump. Based off the jerryRefuel/lockpick scripts by Tonic.
*/
private ["_startPos","_badDistance","_title","_ui","_progress","_pgText","_cP","_action","_fuelCost"];
life_interrupted = false;
if (life_inv_fuelEmpty isEqualTo 0) exitWith {};
if (count(nearestObjects [player,["Land_FuelStation_Feed_F","Land_fs_feed_F"],3.5]) isEqualTo 0) exitWith { [localize "STR_ISTR_Jerry_Distance",5,"gray"] call RPG_Fnc_Msg;};
if (life_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {[localize "STR_NOTF_isrestrained",5,"gray"] call RPG_Fnc_Msg;};
if (player getVariable "restrainedz") exitWith {[localize "STR_NOTF_isrestrained",5,"gray"] call RPG_Fnc_Msg;};
if (player getVariable "playerSurrender") exitWith {[localize "STR_NOTF_surrender",5,"gray"] call RPG_Fnc_Msg;};
_fuelCost = LIFE_SETTINGS(getNumber,"fuelCan_refuel");

life_action_inUse = true;
_action = [
    format [localize "STR_ISTR_Jerry_PopUp",[_fuelCost] call life_fnc_numberText],
    localize "STR_ISTR_Jerry_StationPump",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    if (CASH < _fuelCost) exitWith {[localize "STR_GNOTF_Captured",5,"gray"] call RPG_Fnc_Msg;[localize "STR_NOTF_NotEnoughMoney",5,"gray"] call RPG_Fnc_Msg; life_action_inUse = false;};
    _startPos = getPos player;
    //Setup our progress bar.
    disableSerialization;
    "progressBar" cutRsc ["life_progress","PLAIN"];
    _title = localize "STR_ISTR_Jerry_Refuel";
    _ui = uiNamespace getVariable "life_progress";
    _progress = _ui displayCtrl 38201;
    _pgText = _ui displayCtrl 38202;
    _pgText ctrlSetText format ["%2 (1%1)...","%",_title];
    _progress progressSetPosition 0.01;
    _cP = 0.01;

    for "_i" from 0 to 1 step 0 do {
        if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
            [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
            player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
        };
        sleep 0.2;
        if (isNull _ui) then {
            "progressBar" cutRsc ["life_progress","PLAIN"];
            _ui = uiNamespace getVariable "life_progress";
            _progressBar = _ui displayCtrl 38201;
            _titleText = _ui displayCtrl 38202;
        };
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
        if (_cP >= 1) exitWith {};
        if (!alive player) exitWith {life_action_inUse = false;};
        if (life_interrupted) exitWith {life_interrupted = false; life_action_inUse = false;};
    };

    //Kill the UI display and check for various states
    "progressBar" cutText ["","PLAIN"];
    player playActionNow "stop";

    if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
    if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
    if (player getVariable ["restrainedz",false]) exitWith {life_action_inUse = false;};
    if (!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
    if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",5,"gray"] call RPG_Fnc_Msg; life_action_inUse = false;};
    if (!([false,"fuelEmpty",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};
    life_action_inUse = false;
    CASH = CASH - _fuelCost;
    [true,"fuelFull",1] call life_fnc_handleInv;
    [localize "STR_ISTR_Jerry_Refueled",5,"blue"] call RPG_Fnc_Msg;
} else {
    [localize "STR_NOTF_ActionCancel",5,"gray"] call RPG_Fnc_Msg;
    closeDialog 0;
    life_action_inUse = false;
};