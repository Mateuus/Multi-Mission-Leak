/* 
 Author: DerOnkel 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Rob Fuelstations 
*/ 
_mode = _this select 0; 
_time = _this select 1; 
 
switch (_mode) do 
{ 
 case 0: 
 { 
  robFuelstation = true; 
  publicVariable "robFuelstation"; 
 }; 
 case 1: 
 { 
  uisleep _time; 
  robFuelstation = false; 
  publicVariable "robFuelstation"; 
 }; 
};