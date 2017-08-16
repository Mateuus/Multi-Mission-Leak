/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Runs the spike effect on an affected vehicle
*/
private["_vehicle","_rand"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

[[(vehicle player),"tyrePop"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
_vehicle setHitPointDamage["HitLFWheel",1];
_vehicle setHitPointDamage["HitLF2Wheel",1];
_vehicle setHitPointDamage["HitRFWheel",1];
