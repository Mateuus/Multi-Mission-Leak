#include "..\..\script_macros.hpp"
/*
    File: fn_repairTruck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for toolkits, to be revised in later version.
*/
private ["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test","_sideRepairArray"];
_veh = cursorObject;
life_interrupted = false;
if (isNull _veh) exitWith {};
if ((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air")) then {
   if("ToolKit" in (items player)) then {
        life_action_inUse = true;
        _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _veh),"displayName");
        _upp = format [localize "STR_NOTF_Repairing",_displayName];

        //Setup our progress bar.
        disableSerialization;
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progress = _ui displayCtrl 38201;
        _pgText = _ui displayCtrl 38202;
        _pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
        _progress progressSetPosition 0.01;
        _cP = 0.01;

        [player,"repair"] spawn life_fnc_nearestSound;

        for "_i" from 0 to 1 step 0 do {
            if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
                player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            };

            sleep 0.45;
            _cP = _cP + (0.05 * (missionNamespace getVariable
            ["mav_ttm_var_repairMultiplier", 1]));
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
            if (_cP >= 1) exitWith {};
            if (!alive player) exitWith {};
            if !(isNull objectParent player) exitWith {};
            if (life_interrupted) exitWith {};
        };

        life_action_inUse = false;
        "progressBar" cutText ["","PLAIN"];
        player playActionNow "stop";
        if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",5,"gray"] call RPG_Fnc_Msg; life_action_inUse = false;};
        if !(isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle",5,"gray"] call RPG_Fnc_Msg;};

        _veh setDamage 0;
        [localize "STR_NOTF_RepairedVehicle",5,"blue"] call RPG_Fnc_Msg;
    } else {
        life_action_inUse = true;
        _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _veh),"displayName");
        _upp = format [localize "STR_NOTF_Repairing",_displayName];

        //Setup our progress bar.
        disableSerialization;
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progress = _ui displayCtrl 38201;
        _pgText = _ui displayCtrl 38202;
        _pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
        _progress progressSetPosition 0.01;
        _cP = 0.01;

        [player,"repair"] spawn life_fnc_nearestSound;

        for "_i" from 0 to 1 step 0 do {
            if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
                player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            };

            sleep 1.5;
            _cP = _cP + (0.01 * (missionNamespace getVariable
            ["mav_ttm_var_repairMultiplier", 1]));
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
            if (_cP >= 1) exitWith {};
            if (!alive player) exitWith {};
            if !(isNull objectParent player) exitWith {};
            if (life_interrupted) exitWith {};
        };

        life_action_inUse = false;
        "progressBar" cutText ["","PLAIN"];
        player playActionNow "stop";
        if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",5,"gray"] call RPG_Fnc_Msg; life_action_inUse = false;};
        if !(isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle",5,"gray"] call RPG_Fnc_Msg;};

        _veh setDamage 0;
        [localize "STR_NOTF_RepairedVehicle",5,"blue"] call RPG_Fnc_Msg;
    };
};
