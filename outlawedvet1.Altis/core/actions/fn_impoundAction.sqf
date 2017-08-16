#include "..\..\script_macros.hpp"
/*
    File: fn_impoundAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Impounds the vehicle
*/
private["_vehicle","_type","_time","_value","_owner","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_filters","_impoundValue","_price","_time"];
_vehicle = param [0,objNull,[objNull]];
_filters = ["Car","Air","Ship","Tank"];
if (!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if (player distance cursorObject > 10) exitWith {};
if (_vehicle getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};
_time = 0.1;
if(playerSide isEqualTo civilian) exitWith {};
if(playerSide isEqualTo west) then {
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

if(playerSide isEqualTo independent) then {
		switch (FETCH_CONST(life_mediclevel)) do
				{
					case 0: {_time = 0.01;};
					case 1: {_time = 0.012;};
					case 2: {_time = 0.014;};
					case 3: {_time = 0.016;};
					case 4: {_time = 0.018;};
					case 5: {_time = 0.02;};
				};
};

_vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if (_vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
_owner = ((_vehicleData select 0) select 0);

//_price = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"price");
[0,"STR_NOTF_BeingImpounded",true,[((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
life_action_inUse = true;

switch (true) do {
			case (_vehicle isKindOf "Car"): {_price = LIFE_SETTINGS(getNumber,"impound_car");};
			case (_vehicle isKindOf "Ship"): {_price = LIFE_SETTINGS(getNumber,"impound_boat");};
			case (_vehicle isKindOf "Air"): {_price = LIFE_SETTINGS(getNumber,"impound_air");};
			case (_vehicle isKindOf "Tank"): {_price = LIFE_SETTINGS(getNumber,"impound_tank");};
};

_upp = localize "STR_NOTF_Impounding";
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
    uiSleep 0.09;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if (_cP >= 1) exitWith {};
    if (player distance _vehicle > 10) exitWith {};
    if (!alive player) exitWith {};
};

5 cutText ["","PLAIN"];

if (player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"; life_action_inUse = false;};
if (!alive player) exitWith {life_action_inUse = false;};

if (count crew _vehicle isEqualTo 0) then {
    if (!(KINDOF_ARRAY(_vehicle,_filters))) exitWith {life_action_inUse = false;};
    _type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

    life_impound_inuse = true;

    if (life_HC_isActive) then {
        [_vehicle,true,player] remoteExec ["HC_fnc_vehicleStore",HC_Life];
    } else {
        [_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",RSERV];
    };

    waitUntil {!life_impound_inuse};
            [0,"STR_NOTF_HasImpounded",true,[profileName,((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
            hint format[localize "STR_NOTF_Impounded",_type,_price];
			if((getplayeruid player) isequalto _owner) then {
			hint "You can impound your own vehicle but your bank will be deducted $ 20,000";
			BANK = BANK - 20000;
			[1] call SOCK_fnc_updatePartial;
			} else {
			BANK = BANK + _price;
			UIsleep 0.5;
            [1] call SOCK_fnc_updatePartial;
			};
} else {
    hint localize "STR_NOTF_ImpoundingCancelled";
};

life_action_inUse = false;
