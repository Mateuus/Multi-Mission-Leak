#include "..\..\script_macros.hpp"
/*
    File: fn_catchFish.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Catches a fish that is near by.
*/
private ["_fish","_type","_typeName"];
_fish = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _fish) exitWith {}; //Object passed is null?
if (player distance _fish > 3.5) exitWith {};

if ([true,"schildkroeten",1] call life_fnc_handleInv) then {
    deleteVehicle _fish;
    titleText["Du hast eine Schildkröte gefangen!","PLAIN"];
};