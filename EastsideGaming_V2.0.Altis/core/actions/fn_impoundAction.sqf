#include "..\..\script_macros.hpp"
/*
    File: fn_impoundAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Impounds the vehicle
*/
private ["_vehicle","_type","_time","_value","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_filters","_impoundValue","_price","_impoundMultiplier"];
_vehicle = param [0,objNull,[objNull]];
_filters = ["Car","Air","Ship"];
if (!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if (player distance cursorObject > 10) exitWith {};
if (_vehicle getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};
if((damage _vehicle) isEqualTo 1)exitWith {hint "Das Fahrzeug ist zerstört!"};

_vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if (_vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
_price = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"price");
if (playerside isEqualTo west) then {
	[0,"STR_NOTF_BeingImpounded",true,[((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
}
else
{
	[0,"STR_NOTF_MedBeingImpounded",true,[((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};
life_action_inUse = true;

_upp = localize "STR_NOTF_Impounding";
//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_t2 = "Fertig";
_time = ["impound"]call ESG_fnc_skilltime;
for "_i" from 0 to 1 step 0 do {
    sleep _time;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if (_cP >= 1) exitWith {};
    if (player distance _vehicle > 10) exitWith {_t2 = "Abgebrochen";};
    if (!alive player) exitWith {_t2 = "Abgebrochen";};
	if(player getVariable["esg_bewusstlos",false])exitWith {_t2 = "Abgebrochen";};
};

for "_i" from 0 to 1 step 0 do {
	sleep .0006;
	_cP = _cP - .01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format ["%1 (%2)",_upp,_t2];
	if (_cP <= 0 || !alive player) exitWith {};
};
"progressBar" cutFadeOut 1;

if (player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"; life_action_inUse = false;};
if (!alive player) exitWith {life_action_inUse = false;};
if(player getVariable["esg_bewusstlos",false])exitWith {life_action_inUse = false;};

if (count crew _vehicle isEqualTo 0) then {
    if (!(KINDOF_ARRAY(_vehicle,_filters))) exitWith {life_action_inUse = false;};
    _type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

    life_impound_inuse = true;
    [_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",RSERV];

    waitUntil {!life_impound_inuse};
    if (playerSide isEqualTo west) then {
            _impoundMultiplier = LIFE_SETTINGS(getNumber,"vehicle_cop_impound_multiplier");
            _value = _price * _impoundMultiplier;
            [0,"STR_NOTF_HasImpounded",true,[profileName,((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
            if (_vehicle in life_vehicles) then {
                hint format [localize "STR_NOTF_OwnImpounded",[_value] call life_fnc_numberText,_type];
                BANK = BANK - _value;
            } else {
                hint format [localize "STR_NOTF_Impounded",_type,[_value] call life_fnc_numberText];
                BANK = BANK + _value;
            };
            if (BANK < 0) then {BANK = 0;};
            [1] call SOCK_fnc_updatePartial;
    }else {
		_impoundMultiplier = LIFE_SETTINGS(getNumber,"vehicle_cop_impound_multiplier");
        _value = _price * _impoundMultiplier;
		[0,"STR_NOTF_HasImpounded",true,[profileName,((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		if (_vehicle in life_vehicles) then {
		hint format [localize "STR_NOTF_OwnImpounded",[_value] call life_fnc_numberText,_type];
			BANK = BANK - _value;
		} else {
			hint format [localize "STR_NOTF_Impounded",_type,[_value] call life_fnc_numberText];
				BANK = BANK + _value;
		};
		if (BANK < 0) then {BANK = 0;};
		[1] call SOCK_fnc_updatePartial;
	};
	["impound",1]call ESG_fnc_skilladd;
} else {
    hint localize "STR_NOTF_ImpoundingCancelled";
};

life_action_inUse = false;
