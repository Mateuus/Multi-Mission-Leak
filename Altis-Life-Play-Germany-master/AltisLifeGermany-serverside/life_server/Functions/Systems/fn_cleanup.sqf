/* 
 File: fn_cleanup.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Server-side cleanup script on vehicles. 
 Sort of a lame way but whatever. 
*/ 
private["_deleted"]; 
_deleted = false; 
while {true} do 
{ 
 private["_veh","_units"]; 
 sleep (60 * 60); 
 { 
  _veh = _x; 
  _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass"); 
 
  if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then 
  { 
   _dbInfo = _veh getVariable["dbInfo",[]]; 
   _units = {(_x distance _veh < 2000)} count playableUnits; 
   if(count crew _x == 0) then { 
    if (_units == 0) then { 
     if(!isNil "_veh" && {!isNull _veh}) then { 
      { 
       deleteVehicle _x; 
      } foreach attachedObjects _x; 
      deleteVehicle _veh; 
     }; 
     _deleted = true; 
    }; 
   }; 
 
   if(_deleted) then { 
    waitUntil {isNull _veh}; 
    _deleted = false; 
   }; 
 
   if(isNull _veh) then 
   { 
    systemChat "VEH NULL"; 
    if(count _dbInfo > 0) then 
    { 
     systemChat "Fixing..."; 
     _uid = _dbInfo select 0; 
     _plate = _dbInfo select 1; 
 
     _query = format["vehicleUpdateActivePlate:0:%1:%2",_uid,_plate]; 
     waitUntil {!DB_Async_Active}; 
     [_query,1] call DB_fnc_asyncCall; 
    }; 
   }; 
  }; 
 } foreach vehicles; 
 
 sleep (3 * 60); //3 minute cool-down before next cycle. 
 { 
  if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then 
  { 
   deleteVehicle _x; 
  }; 
 } foreach (allMissionObjects "Thing"); 
 
 sleep (2 * 60); 
 { 
  deleteVehicle _x; 
 } foreach (allMissionObjects "GroundWeaponHolder"); 
};