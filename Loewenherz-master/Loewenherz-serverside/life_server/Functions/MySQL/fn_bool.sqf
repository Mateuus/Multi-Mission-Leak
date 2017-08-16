/* 
 File: fn_bool.sqf 
 Author: TAW_Tonic 
 
 Description: 
 Handles bool conversion for MySQL since MySQL doesn't support 'true' or 'false' 
 instead MySQL uses Tinyint for BOOLEAN (0 = false, 1 = true) 
*/ 
private["_bool","_mode"]; 
_bool = param [0,0,[false,0]]; 
_mode = param [1,0,[0]]; 
 
 
switch (_mode) do 
{ 
 case 0: 
 { 
  if(typeName _bool == "SCALAR") exitWith {0}; 
  if(_bool) then {1} else {0}; 
 }; 
 
 case 1: 
 { 
  if(typeName _bool != "SCALAR") exitWith {false}; 
  switch (_bool) do 
  { 
   case 0: {false}; 
   case 1: {true}; 
  }; 
 }; 
};