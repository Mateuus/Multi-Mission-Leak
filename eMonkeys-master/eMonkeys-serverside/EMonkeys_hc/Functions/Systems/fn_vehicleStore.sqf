/* 
 File: fn_vehicleStore.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Stores the vehicle in the 'Garage' 
*/ 
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_fuel"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_impound = [_this,1,false,[true]] call BIS_fnc_param; 
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
_fuel = [_this,3,0,[0]] call BIS_fnc_param; 
_impoundMode = [_this,4,0,[0]] call BIS_fnc_param; 
 
if(_fuel <= 0.1) then {_fuel = 0.1}; 
 
if(isNull _vehicle OR isNull _unit) exitWith {[false,"EMonkeys_impound_inusever",_unit,false] call EMonkeys_fnc_MP; [false,"EMonkeys_garage_storever",_unit,false] call EMonkeys_fnc_MP;}; //Bad data passed. 
 
_vInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _vInfo > 0) then 
{ 
 _plate = _vInfo select 1; 
 _uid = _vInfo select 0; 
}; 
 
if(_impound) then 
{ 
 if(count _vInfo == 0) then  
 { 
  [false,"EMonkeys_impound_inusever",_unit,false] call EMonkeys_fnc_MP; 
  if(!isNil "_vehicle" && {!isNull _vehicle}) then  
  { 
   deleteVehicle _vehicle; 
  }; 
 }  
  else 
 { 
  switch(_impoundMode) do 
  { 
   case 0: {_query = format["UPDATE vehicles SET active='0', hive='0', fuel='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuel];}; 
   case 1: {_query = format["UPDATE vehicles SET active='0', hive='0', fuel='%3', impound='1' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuel];}; 
   case 2: {_query = format["UPDATE vehicles SET active='1', hive='0', fuel='%3', impound='1' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuel];}; 
  }; 
  diag_log format ["Fuelquery: %1",_query]; 
  _thread = [_query,1] call DB_fnc_asyncCall; 
  if(!isNil "_vehicle" && {!isNull _vehicle}) then  
  { 
   deleteVehicle _vehicle; 
  }; 
  [false,"EMonkeys_impound_inusever",_unit,false] call EMonkeys_fnc_MP; 
 }; 
} 
 else 
{ 
  
 _query = format["UPDATE vehicles SET active='0', fuel='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuel]; 
 diag_log format ["Fuelquery: %1",_query]; 
 _thread = [_query,1] call DB_fnc_asyncCall; 
 if(!isNil "_vehicle" && {!isNull _vehicle}) then  
 { 
  deleteVehicle _vehicle; 
 }; 
 [false,"EMonkeys_garage_storever",_unit,false] call EMonkeys_fnc_MP; 
 [["Garagen Information",["Dein Fahrzeug wurde erfolgreich eingeparkt!"],"#0090ff"],"EMonkeys_fnc_specialText",_unit,false] call EMonkeys_fnc_mp; 
}; 
 
_text = format ["*** Fahrzeug eingeparkt | Spieler ID: %1 | Spielername: %2 | Fahrzeug: %3 | Impound: %4 | Plate: %5 | Fuel: %6 |",_uid,name _unit,_vehicle,_impound,_plate,_fuel]; 
[0,_text] call TON_fnc_log;