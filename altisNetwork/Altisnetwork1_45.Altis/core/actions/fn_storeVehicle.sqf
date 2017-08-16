#include "..\..\script_macros.hpp"
/*
    File: fn_storeVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle"];

life_interrupted = false;

if (vehicle player != player) then {
    _vehicle = vehicle player;
} else {
    _nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
    if (count _nearVehicles > 0) then {
        {
            if (!isNil "_vehicle") exitWith {}; //Kill the loop.
            _vehData = _x getVariable ["vehicle_info_owners",[]];
            if (count _vehData  > 0) then {
                _vehOwner = ((_vehData select 0) select 0);
                if ((getPlayerUID player) == _vehOwner) exitWith {
                    _vehicle = _x;
                };
            };
        } forEach _nearVehicles;
    };
};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_upp = "Storing Vehicle...";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
    sleep 0.5;
	_cP = _cP + 0.10;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    sleep 0.1;
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {}; //--Check if player is alive
	if(player != vehicle player) exitWith {}; //-- Check if player is in vehicle
	if(life_interrupted) exitWith {};
    if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
    if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
	if(dialog) exitWith {};
};

5 cutText ["","PLAIN"];
if (life_interrupted) exitWith 
{
    life_interrupted = false; 
    [localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system; 
    life_action_inUse = false;
    };


if (isNil "_vehicle") exitWith {
    [localize "STR_Garage_NoNPC",true,"fast"] call life_fnc_notification_system;
    };
if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {
    [localize "STR_Garage_SQLError_Destroyed",true,"fast"] call life_fnc_notification_system;
    };

_storetext = localize "STR_Garage_Store_Success";

if (life_HC_isActive) then {
    [_vehicle,false,(_this select 1),_storetext] remoteExec ["HC_fnc_vehicleStore",HC_Life];
} else {
    [_vehicle,false,(_this select 1),_storetext] remoteExec ["TON_fnc_vehicleStore",RSERV];
};

[localize "STR_Garage_Store_Server",true,"fast"] call life_fnc_notification_system;
life_garage_store = true;

//["StoreingVehicle"] spawn mav_ttm_fnc_addExp;