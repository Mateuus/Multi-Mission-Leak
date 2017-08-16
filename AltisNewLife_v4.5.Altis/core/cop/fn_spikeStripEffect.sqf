private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad vehicle type
_vehicle setHitPointDamage["HitLFWheel",1];
_vehicle setHitPointDamage["HitLF2Wheel",1];
_vehicle setHitPointDamage["HitRFWheel",1];