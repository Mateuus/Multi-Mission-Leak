private["_unit","_uid","_ClassName","_ColorCfg","_price","_SpawnPoints","_buyMode","_boxType","_playerside","_spawnClear","_spawnPoint","_spawnDir","_vehicle","_side","_sprit"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call bis_fnc_param; 
_uid = [_this,1,"",[""]] call bis_fnc_param; 
_ClassName = [_this,2,"",[""]] call bis_fnc_param; 
_ColorCfg = [_this,3,-1,[0]] call bis_fnc_param; 
_price = [_this,4,-1,[0]] call bis_fnc_param; 
_SpawnPoints = [_this,5,"",[[]]] call bis_fnc_param; 
_buyMode = [_this,6,1,[0]] call bis_fnc_param; 
 
if(_uid == "" OR isNull _unit OR _ClassName == "" OR _ColorCfg == -1 OR !((typeName _SpawnPoints) == "Array")) exitWith {}; 
 
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"]; 
_playerside = side _unit; 
_name = name _unit; 
_spawnClear = false; 
_sprit = getText(missionConfigFile >> "CfgVehicles" >> _ClassName >> "fuel"); 
 
//Check SpawnPoint 
{ 
 if(count(nearestObjects[(ASLToAGL (_x select 0)),["Car","Ship","Air","Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"],15]) == 0) exitWith 
 { 
  _spawnPoint = _x select 0; 
  _spawnDir = _x select 1; 
  _spawnClear = true; 
 }; 
}foreach _Spawnpoints; 
 
if(!_spawnClear) exitWith 
{ 
 [[3,_unit,_vehicle],"EMonkeys_fnc_vehicleActions",_unit,false] call EMonkeys_fnc_mp; 
}; 
 
_vehicle = createVehicle [_ClassName,[0,0,99999],[],0,"NONE"]; 
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
_vehicle allowDamage false; 
if(getNumber(configFile >> "CfgVehicles" >> typeof _vehicle >> "isUav")==1) then 
{ 
 createVehicleCrew _vehicle;      
};  
_vehicle setPosASL _spawnPoint; 
_vehicle setDir _spawnDir; 
waitUntil {_vehicle distance (ASLToAGL _spawnPoint) <= 5}; 
_vehicle setVectorUp [0,0,1]; 
_vehicle lock 3; 
_vehicle allowDamage true; 
 
//Remove Money 
if(!(_price == -1)) then {[[_price,_unit,1],"EMonkeys_fnc_removePrice",_unit,false] call EMonkeys_fnc_mp}; 
 
//Setup Vehicle 
[_vehicle] call EMonkeys_fnc_clearVehicleAmmo; 
[[_vehicle,_ColorCfg],"EMonkeys_fnc_colorVehicle",true,false] call EMonkeys_fnc_mp; 
[[_vehicle],"EMonkeys_fnc_addVehicle2Chain",_unit,false] call EMonkeys_fnc_mp; 
 
//Setup Variables 
_vehicle setVariable["copcar",false,true]; 
_vehicle setVariable["medcar",false,true]; 
_vehicle setVariable["vehicle_info_owners",[[_uid,_name]],true]; 
_vehicle setVariable["Trunk",[[["money",0]],0],true]; 
_vehicle setVariable["lock_trunk",false,true]; 
_vehicle setVariable["vehicle_info_gps",[],true]; 
_vehicle setVariable["vehicle_fueled",false,true]; 
_vehicle setVariable["fueling",false,true]; 
_vehicle setVariable["default_mass",(getmass _vehicle),true]; 
_vehicle setVariable["vehicle_fuellocation",_sprit,true]; 
_vehicle setVariable["EMonkeys_VEH_color",_ColorCfg,true]; 
 
//Set Animations 
_side = switch(_playerside) do 
{ 
 case west:{"cop"}; 
 case civilian: {"civ"}; 
 case east: {"civ"}; 
 case independent: {"med"}; 
 default {"Error"}; 
}; 
 
switch (_side) do 
{ 
 case "civ": 
 { 
  if(_ClassName == "B_Heli_Light_01_F" && _ColorCfg != 13) then {[[_vehicle,"civ_littlebird",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  if(_ClassName == "C_Offroad_01_F") then {[[_vehicle,"civ_offroad",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  if(_ClassName in ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F"]) then {[[_vehicle,"rebel_offroad",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
 }; 
  
 case "cop": 
 { 
  if(_ClassName in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then {[[_vehicle,"cop_offroad",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  _vehicle setVariable["lights",false,true]; 
  _vehicle setVariable["copcar",true,true]; 
 }; 
  
 case "med": 
 { 
  if(_ClassName == "C_Offroad_01_F") then {[[_vehicle,"med_offroad",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  _vehicle setVariable["trunk",[[["money",0],["fuelcan_super",2],["fuelcan_superplus",2],["fuelcan_diesel",2],["fuelcan_biodiesel",2],["fuelcan_kerosin",2]],50],true]; 
  _vehicle setVariable["medcar",true,true]; 
 }; 
}; 
 
//If Vehicle Buyed -> Insert DB 
switch (_buyMode) do 
{ 
 case 0: 
 { 
  _type = switch(true) do 
  { 
   case (_ClassName isKindOf "Car"): {"Car"}; 
   case (_ClassName isKindOf "Air"): {"Air"}; 
   case (_ClassName isKindOf "Ship"): {"Ship"}; 
   case (_ClassName in _boxType): {"Box"}; 
  }; 
 
  _plate = round(random(1000000)); 
  [_uid,_side,_type,_classname,_ColorCfg,_plate] call DB_fnc_insertVehicle; 
  _vehicle setVariable["dbInfo",[_uid,_plate],true]; 
  [[1,_unit,_vehicle,0],"EMonkeys_fnc_vehicleActions",_unit,false] call EMonkeys_fnc_mp; 
 }; 
  
 case 1: 
 { 
  [[1,_unit,_vehicle,1],"EMonkeys_fnc_vehicleActions",_unit,false] call EMonkeys_fnc_mp; 
 }; 
}; 
 
_text = format ["*** Fahrzeug gekauft | Spielername: %1 | SpielerID: %2 | Classname: %3 | Farbe: %4 | Preis: %5 | Kaufmode: %6 |",name _unit,_uid,_ClassName,_ColorCfg,_price,_buyMode]; 
[0,_text] call TON_fnc_log; 
 
