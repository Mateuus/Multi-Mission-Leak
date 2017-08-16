#include "..\..\script_macros.hpp"
/*
    File: fn_repairTruck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test","_sideRepairArray","_time"];
_veh = cursorObject;
life_interrupted = false;
_time = 0.1;
if(playerSide isequalto west) then {
		switch (FETCH_CONST(life_coplevel)) do
				{
					case 0: {_time = 0.01;};
					case 1: {_time = 0.0115;};
					case 2: {_time = 0.013;};
					case 3: {_time = 0.0145;};
					case 4: {_time = 0.016;};
					case 5: {_time = 0.0175;};
					case 6: {_time = 0.02;};
					case 7: {_time = 0.0215;};
					case 8: {_time = 0.023;};
					case 9: {_time = 0.0245;};
				};
};

if(playerSide isequalto independent) then {
		switch (FETCH_CONST(life_mediclevel)) do
				{
					case 0: {_time = 0.02;};
					case 1: {_time = 0.0225;};
					case 2: {_time = 0.025;};
					case 3: {_time = 0.0275;};
					case 4: {_time = 0.03;};
					case 5: {_time = 0.0325;};
				};
};

if (isNull _veh) exitWith {};
if ((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air") || (_veh isKindOf "Tank")) then {
	if("ToolKit" in (items player)) then {
        life_action_inUse = true;
        _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _veh),"displayName");
        _upp = format[localize "STR_NOTF_Repairing",_displayName];

        //Setup our progress bar.
        disableSerialization;
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progress = _ui displayCtrl 38201;
        _pgText = _ui displayCtrl 38202;
        _pgText ctrlSetText format["%2 (1%1)...","%",_upp];
        _progress progressSetPosition 0.01;
        _cP = 0.01;

        for "_i" from 0 to 1 step 0 do {
            if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
                player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            };

           uiSleep 0.27;
            _cP = _cP + _time;
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
            if (_cP >= 1) exitWith {};
            if (!alive player) exitWith {};
            if (player != vehicle player) exitWith {};
            if (life_interrupted) exitWith {};
        };

        life_action_inUse = false;
        5 cutText ["","PLAIN"];
        player playActionNow "stop";
        if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
        if (player != vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

        _sideRepairArray = LIFE_SETTINGS(getArray,"vehicle_infiniteRepair");

        //Check if playerSide has infinite repair enabled
        if (playerSide isEqualTo civilian && (_sideRepairArray select 0) isEqualTo 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };
        if (playerSide isEqualTo west && (_sideRepairArray select 1) isEqualTo 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };
        if (playerSide isEqualTo independent && (_sideRepairArray select 2) isEqualTo 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };
        if (playerSide isEqualTo east && (_sideRepairArray select 3) isEqualTo 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };

        _veh setDamage 0;
        titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
    };
};
