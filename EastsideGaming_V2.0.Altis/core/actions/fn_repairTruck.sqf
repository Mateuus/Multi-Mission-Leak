#include "..\..\script_macros.hpp"
/*
    File: fn_repairTruck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for toolkits, to be revised in later version.
*/
private ["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test","_sideRepairArray"];
_veh = cursorObject;
_time = 0;
life_interrupted = false;
if (isNull _veh) exitWith {};
if ((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air")) then {
    if ("ToolKit" in (items player)) then {
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
		_time = ["repair"]call ESG_fnc_skilltime;
		_t2 = "Fertig";
        for "_i" from 0 to 1 step 0 do {
            if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
                player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            };

            sleep _time;
            _cP = _cP + 0.01;
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
            if (_cP >= 1) exitWith {};
            if (!alive player) exitWith {_t2 = "Abgebrochen";};
            if (player != vehicle player) exitWith {_t2 = "Abgebrochen";};
            if (life_interrupted) exitWith {_t2 = "Abgebrochen";};
			if(player getVariable["esg_bewusstlos",false])exitWith {_t2 = "Abgebrochen";};
			if((player distance _veh) > 5)exitWith {_t2 = "Abgebrochen";};
        };

        life_action_inUse = false;
        for "_i" from 0 to 1 step 0 do {
			sleep .0006;
			_cP = _cP - .01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format ["%1 (%2)",_upp,_t2];
			if (_cP <= 0 || !alive player) exitWith {};
		};
		"progressBar" cutFadeOut 1;
        player playActionNow "stop";
        if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
        if (player != vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};
		if(player getVariable["esg_bewusstlos",false])exitWith {life_action_inUse = false;};
		if((player distance _veh) > 5)exitWith {life_action_inUse = false;};

        //Check if playerSide has infinite repair enabled
        if (playerSide != independent) then {
			player removeItem "ToolKit";
		}; 

        _veh setDamage 0;
        titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
		["repair",1] call ESG_fnc_skilladd;
    };
};
