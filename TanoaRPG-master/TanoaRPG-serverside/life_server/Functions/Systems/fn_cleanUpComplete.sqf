/* 
 File: fn_cleanUpComplete.sqf 
 Author: CooliMC 
  
 Description: 
 Server-side cleanup script on vehicles, groups and trash on the ground 
*/ 
private["_thread","_dbInfo","_uid","_plate"]; 
 
while {true} do 
{ 
 if(!isNull life_hc_inUse) then 
 { 
  [] remoteExec ["TEX_fnc_cleanUpComplete", life_hc_inUse]; 
  sleep 120; 
 } else { 
  { 
   if(!alive _x) then 
   { 
    _dbInfo = _x getVariable["dbInfo",[]]; 
    if(count _dbInfo > 0) then 
    { 
     _uid = _dbInfo select 0; 
     _plate = _dbInfo select 1; 
 
     _query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
     _query spawn { 
      _thread = [_this,1] spawn DB_fnc_asyncCall; 
     }; 
    }; 
     
    if((!isNil "_x") && (!isNull _x)) then 
    { 
     deleteVehicle _x; 
    }; 
   }; 
  } foreach allMissionObjects "LandVehicle"; 
 
  sleep 40; 
   
  { 
   if(!alive _x) then 
   { 
    _dbInfo = _x getVariable["dbInfo",[]]; 
    if(count _dbInfo > 0) then 
    { 
     _uid = _dbInfo select 0; 
     _plate = _dbInfo select 1; 
       
     _query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
     _query spawn { 
      _thread = [_this,1] spawn DB_fnc_asyncCall; 
     }; 
    }; 
      
    if((!isNil "_x") && (!isNull _x)) then 
    { 
     deleteVehicle _x; 
    }; 
   }; 
  } foreach allMissionObjects "Air"; 
   
  sleep 40; 
   
  { 
   if(count units _x == 0 && local _x) then 
   { 
    deleteGroup _x; 
   }; 
  } foreach allGroups; 
   
  { 
   deleteVehicle _x; 
  } foreach allMissionObjects "GroundWeaponHolder"; 
   
  { 
   if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then 
   { 
    deleteVehicle _x; 
   }; 
  } foreach (allMissionObjects "Thing"); 
   
  sleep 40; 
   
  /* UNNÖTIG FIND ICH :D 
  { 
   _veh = _x; 
   _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass"); 
    
   if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then 
   { 
    _dbInfo = _veh getVariable["dbInfo",[]]; 
    _units = {(_x distance _veh < 30000)} count playableUnits; 
    if(count crew _x == 0) then 
    { 
     switch (true) do 
     { 
      case ((_x getHitPointDamage "HitEngine") > 0.7 && _units == 0) : {deleteVehicle _x; _deleted = true;}; 
      case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;}; 
      case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;}; 
      case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;}; 
      case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;}; 
      case (_units == 0): {deleteVehicle _x; _deleted = true;}; 
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
 
      _query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
      //waitUntil {!DB_Async_Active}; 
      [_query,1] call DB_fnc_asyncCall; 
     }; 
    }; 
   }; 
  } foreach vehicles;*/ 
 }; 
};