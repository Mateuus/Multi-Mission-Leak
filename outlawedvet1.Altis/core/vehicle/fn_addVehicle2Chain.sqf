#define SAFETY_ZONES    [["campnorth", 300],["campsouth", 300],["spawn_island", 200],["Donator_Zone_1", 280]]

/*
    File: fn_addVehicle2Chain.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    A short function for telling the player to add a vehicle to his keychain.
*/

private ["_vehicle","_zone1","_zone2","_zone3","_zone4","_dis1","_dis2","_dis3"];

_vehicle = param [0,objNull,[objNull]];

if((typeOf _vehicle in ["B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_medevac_F"]) && playerside == independent) then {
_hs = nearestObjects[getPos _vehicle,["Land_Hospital_side2_F"],50] select 0;
_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
};

switch (_className) do {
				case "C_SUV_01_F": {_vehicle setCenterOfMass [-0.010813,-0.506166,-0.7];};
				case "I_MRAP_03_F": {_vehicle setCenterOfMass [-0.000676433, -0.343985, -0.75];};
				case "O_MRAP_02_F": {_vehicle setCenterOfMass [-0.000573029, -1.52789, -1.25];};
};

// MARKERS FOR SAFEZONE
_zone1 = getMarkerPos "campnorth"; //Rebelcamp North
_zone2 = getMarkerPos "campsouth"; //Rebelcamp South
_zone3 = getMarkerPos "spawn_island"; // Spawn Island
_zone4 = getMarkerPos "Donator_Zone"; // Donator Island

// DISTANCE SAFE ZONE     
_dis1 = 200; // DISTANCE SAFE ZONE    
_dis2 = 300; // DISTANCE SAFE ZONE  
_dis3 = 280; // DISTANCE SAFE ZONE     

if ((_zone1 distance player < _dis2) || (_zone2 distance player < _dis2) || (_zone3 distance player < _dis1) || (_zone4 distance player < _dis3)) then 
{
_vehicle allowDamage false;
} else {
_vehicle allowDamage true;
};

_vehicle addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
             deleteVehicle (_this select 6);
             titleText ["You Are In A Safe Zone! Shooting, damaging, trolling, ect... is not allowed!", "PLAIN", 2];
             } else {
			 _this call life_fnc_onFired;
			 };
}]; 

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
_vehicle setVehicleAmmo 0;

if (!(_vehicle in life_vehicles)) then {
    life_vehicles pushBack _vehicle;
};