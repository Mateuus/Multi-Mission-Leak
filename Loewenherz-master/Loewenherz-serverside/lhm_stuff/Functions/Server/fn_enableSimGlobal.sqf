/* 
 File: fn_enableSimGlobal.sqf 
 Author: Blackd0g 
  
 Description: 
 change Simulation of an object globally 
*/ 
private ["_myObject","_state"]; 
_myObject = param [0,objNull]; 
_state = param [1,false]; 
 
_myObject enableSimulationGlobal _state;