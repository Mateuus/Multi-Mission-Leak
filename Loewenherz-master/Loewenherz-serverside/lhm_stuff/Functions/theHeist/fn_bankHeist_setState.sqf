/* 
Filename: fn_setState.sqf 
 
Author: Blackd0g 
 
Description: set the mission state number from a client 
*/ 
private ["_state"]; 
_state = param [0,0,[0]]; 
if(isNil "_state") exitWith {}; 
 
BankHeistState = _state; 
 
if(isnil "BankHeist_Team") exitWith {}; 
 
[[BankHeistState],"lhm_fnc_heist_setState",BankHeist_Team,false] call LHM_fnc_mp;