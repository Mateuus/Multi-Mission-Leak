/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
    Locks/Unlocks a vehicle globally
*/

private["_vehicle"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle)exitWith{};
_vehicle lock (_this select 1);