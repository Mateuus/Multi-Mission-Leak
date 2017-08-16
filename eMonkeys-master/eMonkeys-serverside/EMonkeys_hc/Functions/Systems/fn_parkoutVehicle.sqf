private["_unit","_uid","_id","_class","_color","_plate","_fuel","_price","_spawnpoints","_garageType","_boxType","_playerside","_spawnClear","_query","_spawnPos","_spawnDir","_vehicle","_side","_sprit"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_id = [_this,2,-1,[0]] call BIS_fnc_param; 
_class = [_this,3,"",[""]] call BIS_fnc_param; 
_color = [_this,4,-1,[0]] call BIS_fnc_param; 
_plate = [_this,5,-1,[0]] call BIS_fnc_param; 
_fuel = [_this,6,"",[""]] call BIS_fnc_param; 
_price = [_this,7,-1,[0]] call BIS_fnc_param; 
_spawnpoints = [_this,8,[],[[]]] call BIS_fnc_param; 
_garageType = [_this,9,"",[""]] call BIS_fnc_param; 
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"]; 
_name = name _unit; 
_SpawnClear = false; 
_playerside = side _unit; 
 
_sprit = getText(missionConfigFile >> "CfgVehicles" >> _class >> "fuel"); 
 
if (_unit == ObjNull || _uid == "" || _id == -1 || _class == "" || _color == -1 || _plate == -1 || _fuel == "" || typename _spawnpoints != "ARRAY" || _garageType == "") exitWith {}; 
 
//Setup Spawnpoint 
{ 
  
 if(count(nearestObjects[(ASLToAGL (_x select 0)),["Car","Ship","Air","Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"],15]) == 0) then 
 { 
  _SpawnPos = _x select 0; 
  _SpawnDir = _x select 1; 
  _SpawnClear = true; 
 }; 
}forEach _spawnpoints; 
 
if(!_spawnClear) exitWith 
{ 
 [[3,_unit,_vehicle],"EMonkeys_fnc_vehicleActions",_unit,false] call EMonkeys_fnc_mp; 
}; 
 
//Update Datenbank 
if(_garageType == "impound") then 
{ 
 _query = format["UPDATE vehicles SET active='1', hive='%3', impound='0' WHERE pid='%1' AND id='%2'",_uid,_id,altislifehive]; 
} else { 
 _query = format["UPDATE vehicles SET active='1', hive='%3' WHERE pid='%1' AND id='%2'",_uid,_id,altislifehive]; 
}; 
[_query,false] call DB_fnc_asyncCall; 
 
//Spawn Vehicle 
_vehicle = createVehicle [_class,[0,0,99999],[],0,"NONE"]; 
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
_vehicle allowDamage false; 
if(getNumber(configFile >> "CfgVehicles" >> typeof _vehicle >> "isUav")==1) then 
{ 
 createVehicleCrew _vehicle;      
};  
_vehicle setPosASL _SpawnPos; 
_vehicle setDir _SpawnDir; 
waitUntil {_vehicle distance (ASLToAGL _SpawnPos) <= 5}; 
_vehicle setVectorUp [0,0,1]; 
_vehicle lock 3; 
_vehicle allowDamage true; 
 
if(!(_price == -1)) then {[[_price,_unit,0],"EMonkeys_fnc_removePrice",_unit,false] call EMonkeys_fnc_mp}; 
 
//Setup Vehicle 
[_vehicle] call EMonkeys_fnc_clearVehicleAmmo; 
[[_vehicle,_color],"EMonkeys_fnc_colorVehicle",true,false] call EMonkeys_fnc_mp; 
[[_vehicle],"EMonkeys_fnc_addVehicle2Chain",_unit,false] call EMonkeys_fnc_mp; 
 
//Setup Variables 
_vehicle setVariable["copcar",false,true]; 
_vehicle setVariable["medcar",false,true]; 
_vehicle setVariable["vehicle_info_owners",[[_uid,_name]],true]; 
_vehicle setVariable["dbInfo",[_uid,_plate],true]; 
_vehicle setVariable["Trunk",[[["money",0]],0],true]; 
_vehicle setVariable["lock_trunk",true,true]; 
_vehicle setVariable["vehicle_info_gps",[],true]; 
_vehicle setVariable["vehicle_fueled",false,true]; 
_vehicle setVariable["fueling",false,true]; 
_vehicle setVariable["default_mass",(getmass _vehicle),true]; 
_vehicle setVariable["vehicle_fuellocation",_sprit,true]; 
_vehicle setVariable["EMonkeys_VEH_color",_color,true]; 
 
_vehicle setFuel (parseNumber _fuel); 
 
//Setup Animations 
switch(_playerside) do 
{ 
 case civilian: 
 { 
  if(_class == "B_Heli_Light_01_F" && _color != 13) then {[[_vehicle,"civ_littlebird",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  if(_class == "C_Offroad_01_F") then {[[_vehicle,"civ_offroad",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  if(_class in ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F"]) then {[_vehicle,"rebel_offroad",true] spawn EMonkeys_fnc_vehicleAnimate}; 
 }; 
  
 case opfor: 
 { 
  if(_class == "B_Heli_Light_01_F" && _color != 13) then {[[_vehicle,"civ_littlebird",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  if(_class == "C_Offroad_01_F") then {[[_vehicle,"civ_offroad",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  if(_class in ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F"]) then {[[_vehicle,"rebel_offroad",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
 }; 
  
 case west: 
 { 
  if(_class in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then {[[_vehicle,"cop_offroad",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  _vehicle setVariable["lights",false,true]; 
  _vehicle setVariable["copcar",true,true]; 
 }; 
  
 case independent: 
 { 
  if(_class == "C_Offroad_01_F") then {[[_vehicle,"med_offroad",true],"EMonkeys_fnc_vehicleAnimate",_unit,false] call EMonkeys_fnc_mp}; 
  _vehicle setVariable["trunk",[[["money",0],["fuelcan_super",2],["fuelcan_superplus",2],["fuelcan_diesel",2],["fuelcan_biodiesel",2],["fuelcan_kerosin",2]],50],true]; 
  _vehicle setVariable["medcar",true,true]; 
 }; 
}; 
 
//Actions 
if (_class in _boxType) then { 
 [[2,_unit,_vehicle],"EMonkeys_fnc_vehicleActions",_unit,false] call EMonkeys_fnc_mp; 
}else{ 
 [[0,_unit,_vehicle],"EMonkeys_fnc_vehicleActions",_unit,false] call EMonkeys_fnc_mp; 
}; 
 
_text = format ["*** Fahrzeug ausgeparkt | SpielerID: %1 | Spielername: %2 | ID: %3 | Classname: %4 | Farbe: %5 | Plate: %6 | Fuel: %7 | Preis: %8 | Spawn: %9 |",_uid,name _unit,_id,_class,_color,_plate,_fuel,_price,_spawnpoints]; 
[0,_text] call TON_fnc_log; 
 
