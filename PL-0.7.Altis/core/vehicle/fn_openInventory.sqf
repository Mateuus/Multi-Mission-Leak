#include "..\..\script_macros.hpp"
/*
    File: fn_openInventory.sqf
    Author: Bryan "Tonic" Boardwine
 
    Description:
    Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data","_log"];
 
if(dialog) exitWith {};
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _vehicle || !(_vehicle isKindOf "Car" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship" || _vehicle isKindOf "Box_IND_Grenades_F" || _vehicle isKindOf "B_supplyCrate_F")) exitWith {}; //Either a null or invalid vehicle type.
if ((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};
_vehicle setVariable ["trunk_in_use",true,true];
_vehicle setVariable ["trunk_in_use_by",player,true];
if (!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;
 
//Bugfix
if (!alive player) exitWith {["trunk_in_use",false,false];}; //Fix un exploit de crash avec l'inventaire ouvert #Vecu.
if (life_is_processing) exitWith hint localize "STR_NOTF_FarmProgress";;
 
if(_vehicle isKindOf "Box_IND_Grenades_F" || _vehicle isKindOf "B_supplyCrate_F") then {
    ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
    ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};
 
_veh_data = [_vehicle] call life_fnc_vehicleWeight;
 
if(_veh_data select 0 == -1) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};
 
ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;
 
//Meh way to fix dupe without trunk access limit
life_exit_veh = false;
 
[_vehicle] spawn {
    _vehicle = _this select 0;
    _vehicle setVariable ["antiDupe",(getPlayerUID player),true];
    sleep (random 2);
    if ((_vehicle getVariable ["antiDupe",-1]) != (getPlayerUID player)) exitWith {
        life_exit_veh = true;
        closeDialog 0;
    };
};
//End
 
_vehicle spawn {
    if (life_exit_veh) exitWith {};
    waitUntil {isNull (findDisplay 3500)};
    _this setVariable["trunk_in_use",false,true];
    if(_this isKindOf "Box_IND_Grenades_F" || _this isKindOf "B_supplyCrate_F") then {
        [_this] remoteExecCall ["TON_fnc_updateHouseTrunk",2];
    };
};