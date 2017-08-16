/* 
 File: fn_monitorHeli.sqf 
 Author: Play-Germany 
 
 Description: 
 Keeps a look over the Helis spawned for Paradrop 
*/ 
 
private["_heli","_delete"]; 
_heli = _this select 0; 
if (isNil "_heli") exitWith {}; 
_delete = false; 
 
while {!isNull _heli} do { 
 if(((getPosATL _heli) select 2) < 1000) exitWith {_delete = true;}; 
 if(isTouchingGround _heli) exitWith {_delete = true;}; 
 sleep 1; 
}; 
 
if(_delete) then { 
 {if (isPlayer _x) then {_x action ["Eject", _heli]}} forEach crew _heli; 
 sleep 5; 
 {_heli deleteVehicleCrew _x} forEach crew _heli; 
 deleteVehicle _heli; 
};