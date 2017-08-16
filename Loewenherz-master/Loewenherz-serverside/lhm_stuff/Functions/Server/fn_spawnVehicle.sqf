private["_vehclass","_vehPos","_vehDir","_pos","_vehicle","_clearCargo","_uid","_side","_color","_clearCargo","_unit","_namespawner","_dir","_pos"]; 
 
_vehclass = param [ 0, ObjNull]; // Vehicle Class 
_vehPos = param [ 1, [0,0,0]]; // Vehicle spawn pos 
_vehDir = param [ 2, 360]; // directory to spawn 
_uid = param [ 3, 0]; // Player ID 
_side = param [ 4, sideUnknown]; // Playerside 
_color = param [ 5, 0]; // Vehicle color 
_clearCargo = param [ 6, true]; // remove cargo from vehicle 
_unit = param [ 7, ObjNull]; // Player Object 
 
_dir = _vehDir; 
_pos = _vehPos; 
_pos = [(_pos select 0)+10*sin(_dir),(_pos select 1)+10*cos(_dir), (_pos select 2)]; 
_vehicle = createVehicle [_vehclass, _pos, [], 0, "CAN_COLLIDE"]; 
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
_vehicle lock 2; 
_vehicle setVectorUp (surfaceNormal _pos); 
_vehicle allowDamage false; 
_vehicle setDir _dir; 
_vehicle setposATL _pos; 
 
if(_clearCargo) then 
{ 
 _handle = [_vehicle] spawn { 
  clearWeaponCargoGlobal _this; 
  clearMagazineCargoGlobal _this; 
  clearItemCargoGlobal _this; 
 }; 
 waitUntil {ScriptDone _handle}; 
}; 
 
// set trunk and vehicle owner data 
_vehicle setVariable["trunk_in_use",false,true]; 
_vehicle setVariable["vehicle_info_owners",[[_uid,name _unit]],true]; 
 
[[_vehicle,_color],"lhm_fnc_colorVehicle",true,false] call lhm_fnc_mp; 
 
//Side Specific actions. 
switch(_side) do { 
 case west: { 
  if(_vehclass == "B_Heli_Light_01_F") then { 
   [[_vehicle,"cop_offroad",true],"lhm_fnc_vehicleAnimate",_unit,false] call lhm_fnc_mp; 
   _vehicle setVariable["lights",false,true]; 
  }; 
 }; 
 case civilian: { 
  if(_vehclass == "B_Heli_Light_01_F") then { 
   [[_vehicle,"civ_littlebird",true],"lhm_fnc_vehicleAnimate",_unit,false] call lhm_fnc_mp; 
  }; 
   
  if(_vehclass == "I_G_Offroad_01_F") then { 
   [[_vehicle,"service_truck",true],"lhm_fnc_vehicleAnimate",_unit,false] call lhm_fnc_mp; 
   _vehicle setVariable["lights",false,true]; 
  }; 
 }; 
 case independent: { 
  if(_vehclass == "I_G_Offroad_01_F") then { 
   [[_vehicle,"med_offroad",true],"lhm_fnc_vehicleAnimate",_unit,false] call lhm_fnc_mp; 
   _vehicle setVariable["lights",false,true]; 
  }; 
 }; 
}; 
if(Side _unit != civilian) then { 
 _vehicle setVariable["lights",false,true]; 
}; 
 
// insert Vehicle into DB 
[[_uid,_side,_vehicle,_color],"TON_fnc_vehicleCreate",false,false] call lhm_fnc_mp; 
 
//Send keys over the network. 
[[_vehicle],"lhm_fnc_addVehicle2Chain",_unit,false] call lhm_fnc_mp; 
 
_vehicle allowDamage true; 
 
// Change owner of vehicle to player 
_vehicle setOwner (owner _unit); 
 
diag_log format ["Server: Vehicle: %1 spawned at %2",_vehclass,_pos];