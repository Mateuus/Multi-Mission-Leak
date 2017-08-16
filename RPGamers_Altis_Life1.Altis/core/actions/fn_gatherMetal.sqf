#include "..\..\script_macros.hpp"

private ["_upp","_ui","_progress","_pgText","_cP","_displayName","_test","_sideRepairArray"];
life_interrupted = false;
		life_gathermetal = true;
        life_action_inUse = true;
        _upp = format ["Gathering Metal..."];

        //Setup our progress bar.
        disableSerialization;
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progress = _ui displayCtrl 38201;
        _pgText = _ui displayCtrl 38202;
        _pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
        _progress progressSetPosition 0.01;
        _cP = 0.01;

        for "_i" from 0 to 1 step 0 do {
            if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
                player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            };

            sleep 0.45;
            _cP = _cP + 0.08;
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
        if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",5,"gray"] call RPG_Fnc_Msg; life_action_inUse = false; life_gathermetal = false;};

		life_inv_plateMetal = life_inv_plateMetal + 1;
        ["Gathered some metal",5,"blue"] call RPG_Fnc_Msg;
		life_gathermetal = false;