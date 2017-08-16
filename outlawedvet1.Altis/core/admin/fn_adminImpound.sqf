#define SAFETY_ZONES    [["campnorth", 300],["campsouth", 300],["spawn_green_protection_zone", 200],["Donator_Zone_1", 280]]
#include "..\..\script_macros.hpp"
/*
    File: fn_impoundAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Impounds the vehicle
*/
private["_vehicle","_type","_time","_value","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_filters","_shops","_qty"];
_vehicle = param [0,objNull,[objNull]];
_filters = ["Car","Air","Ship","Tank"];
_shops = (nearestObjects[getPosATL player,["Land_InfoStand_V1_F","Land_InfoStand_V2_F","Land_CashDesk_F"],30]);
_qty = count _shops;
if (!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if (_vehicle getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};
if(_vehicle distance player > 150) exitWith {hint "Vehicle is far away!"};

_vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if (_vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

if (({player distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) || (_qty > 0)) then {


life_action_inUse = true;
if (life_HC_isActive) then {
        [_vehicle,true,player] remoteExec ["HC_fnc_vehicleStore",HC_Life];
} else {
        [_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",RSERV];
};
[0,"STR_RPG4YOU_Admin_impound",true,[profileName,((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];   
life_action_inUse = false;
} else {
hint "The vehicle is NOT close to a safezone or a shop. The vehicle needs to be 30 metres near a shop or in the safezone!";
};
