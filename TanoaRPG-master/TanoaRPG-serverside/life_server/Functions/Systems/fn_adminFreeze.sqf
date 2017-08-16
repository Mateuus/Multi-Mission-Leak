/* 
 File: fn_adminFreeze.sqf 
 Author: CooliMC "Marc" 
  
 Description: 
 Freeze the Target and Sends it over the Network 
*/ 
 
private["_author","_target"]; 
_author = _this select 0; 
_target = _this select 1; 
 
if((vehicle _target) != _target) then 
{ 
 if(simulationEnabled (vehicle _target)) then 
 { 
  (vehicle _target) enableSimulationGlobal false; 
  [_author, _target, 3, "[ADMIN-Menu]", "Hat Fahrzeug eingefroren"] spawn TEX_fnc_logIt; 
 } else { 
  (vehicle _target) enableSimulationGlobal true; 
  [_author, _target, 3, "[ADMIN-Menu]", "Hat Fahrzeug aufgetaut"] spawn TEX_fnc_logIt; 
 }; 
} else { 
 if(simulationEnabled (vehicle _target)) then 
 { 
  (vehicle _target) enableSimulationGlobal false; 
  [_author, _target, 3, "[ADMIN-Menu]", "Hat eingefroren"] spawn TEX_fnc_logIt; 
 } else { 
  (vehicle _target) enableSimulationGlobal true; 
  [_author, _target, 3, "[ADMIN-Menu]", "Hat aufgetaut"] spawn TEX_fnc_logIt; 
 }; 
};