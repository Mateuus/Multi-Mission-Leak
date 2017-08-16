/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Script for Fuel the selected Vehicle 
*/ 
private ["_vehicle","_objects","_ui","_progress","_cP","_control"]; 
disableSerialization; 
 
_control = ((findDisplay 9000) displayCtrl 9002); 
_ui = uiNameSpace getVariable "EMonkeys_fuel_progress"; 
_progress = _ui displayCtrl 9006; 
 
 
if(count EMonkeys_nearestVehicle != 0) then 
{ 
 _vehicle = EMonkeys_nearestVehicle select (lbCurSel _control); 
 _cP = fuel _vehicle; 
 _progress progressSetPosition _cp; 
}else{ 
 _cP = 0; 
 _progress progressSetPosition _cp; 
}; 
