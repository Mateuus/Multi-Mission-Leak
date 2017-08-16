#include "..\..\script_macros.hpp"
/*
    File: fn_storeVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Stores the vehicle in the garage.
*/
private ["_nearVehicles","_vehicle"];
if !(isNull objectParent player) then {
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

if (isNil "_vehicle") exitWith {[localize "STR_Garage_NoNPC",5,"gray"] call RPG_Fnc_Msg;};
if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {[localize "STR_Garage_SQLError_Destroyed",5,"gray"] call RPG_Fnc_Msg;};

_storetext = localize "STR_Garage_Store_Success";

if (life_HC_isActive) then {
    [_vehicle,false,(_this select 1),_storetext] remoteExec ["HC_fnc_vehicleStore",HC_Life];
} else {
    [_vehicle,false,(_this select 1),_storetext] remoteExec ["TON_fnc_vehicleStore",RSERV];
};

[localize "STR_Garage_Store_Server",5,"gray"] call RPG_Fnc_Msg;
life_garage_store = true;
