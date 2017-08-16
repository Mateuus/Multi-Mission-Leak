/* 
 Filename: fn_bankHeist_reset.sqf 
 
 Author: Blackd0g 
 
 Description: reset the bank heist state and progress 
*/ 
 
private ["_soft","_bank","_types","_lamps"]; 
_soft = param[0,false,[false]]; 
_bank = [dome1,dome2,dome3,rsb1,rsb2,rsb3]; 
 
 
if(!_soft) then { 
// Hard Reset // 
 { 
  for "_i" from 1 to 3 do { 
   _x setVariable[format["bis_disabled_Door_%1",_i],1,true]; 
   _x animateSource [format["Door_%1_source",_i],0]; 
   _x animateSource ["door_1A_move",0]; 
   _x animateSource ["door_1B_move",0]; 
   _x animateSource ["door_2A_move",0]; 
   _x animateSource ["door_2B_move",0]; 
  }; 
  sleep 0.2; 
 
 } forEach _bank; 
 
 _types = 
 [ 
  "Land_PowerPoleWooden_F", 
  "Land_LampHarbour_F", 
  "Land_LampHalogen_F", 
  "Land_LampShabby_F", 
  "Land_runway_edgelight_blue_F", 
  "Land_PowerPoleWooden_L_F", 
  "Land_LampDecor_F", 
  "Land_LampSolar_F", 
  "Land_LampStreet_small_F", 
  "Land_LampStreet_F", 
  "Land_LampAirport_F", 
  "Lamps_Base_F", 
  "Land_ts_roof_F", 
  "PowerLines_base_F", 
  "Land_PowLines_WoodL", 
  "Land_PowLines_ConcL", 
  "Land_lampa_ind_zebr", 
  "Land_lampa_sidl_3", 
  "Land_lampa_vysoka", 
  "Land_lampa_ind", 
  "Land_lampa_ind_b", 
  "Land_lampa_sidl", 
  "Car", 
  "Ship", 
  "Air" 
 ]; 
 
 // repair all lamps 
 for [{_i=0},{_i < (count _types)},{_i=_i+1}] do 
 { 
  _lamps = getMarkerPos "fed_reserve" nearObjects [_types select _i, 500]; 
  { 
   _x setDamage 0; 
   _x allowDamage false; 
  } forEach _lamps; 
 }; 
 
 // remove fire 
 { 
  if(!isnil _x) then { 
   deleteVehicle (call compile _x); 
  }; 
 } foreach["fedFire1","fedFire2","fedFire3","fedFire4"]; 
 
 if(!isNil "safeAlarmSound") then { 
  deleteVehicle safeAlarmSound; 
 }; 
 
 // close all gates 
 { 
  _x animateSource ["Door_1_rot", 0]; 
 } forEach [bank_bg1,bank_bg2,bank_bg3,bank_bg4,bank_bg5,bank_bg6,bank_bg7,bank_bg8]; 
 
 Louisbox setPos [getPos Louisbox select 0, getPos Louisbox select 1, -100]; 
 
 if(!isNil "bankWall1") then { 
  bankWall1 setPos [getPos bankWall1 select 0, getPos bankWall1 select 1, 0]; 
 }; 
 if(!isNil "bankWall2") then { 
  bankWall2 setPos [getPos bankWall2 select 0, getPos bankWall2 select 1, 0]; 
 }; 
 if(!isNil "bankWall3") then { 
  bankWall3 setPos [getPos bankWall3 select 0, getPos bankWall3 select 1, 0]; 
 }; 
 if(!isNil "bankWall4") then { 
  bankWall4 setPos [getPos bankWall4 select 0, getPos bankWall4 select 1, 0]; 
 }; 
 
 Gericht_1 setvariable["Hack_done",nil,true]; 
 Gericht_1 setvariable["HACK_STATUS",nil,true]; 
 bankKeypad2 setvariable["done",nil,true]; 
 bankKeypad1 setvariable["done",nil,true]; 
 bankKeypad2 setvariable["tries",nil,true]; 
 bankKeypad1 setvariable["tries",nil,true]; 
 fed_bank setVariable["chargeplaced",false,true]; 
 fed_bank setVariable["chargecodewrong",nil,true]; 
 fed_bank setVariable["safe_open",false,true]; 
 
 bankHeistGuy setVariable["Heist_isRunning",false,true]; 
 
 fed_code = nil; 
 BankHeist_Team = nil; 
 BankHeistState = -1; 
 BankHeist_Way = nil; 
 BankHeist_isRunning = false; 
 Bankheist_TimeOut = nil; 
 publicVariable "BankHeistState"; 
 publicVariable "fed_code"; 
 publicVariable "BankHeist_Team"; 
 publicVariable "BankHeist_Way"; 
 publicVariable "BankHeist_isRunning"; 
 
 diag_log "Bank Heist: Progress & State resetet - HARD RESET!"; 
 
 // inform all players 
 [] spawn { 
  sleep 30; 
  [ 
  [ 
   [["Staatsbank, ","align = 'center' size = '0.9' font='PuristaBold'"], 
   ["Information","align = 'center' size = '0.9'","#FF0000"],["","<br/>"], 
   ["Die Staatsbank wurde wieder gesichert!","align = 'center' size = '0.7'"]] 
  ] 
  ,"BIS_fnc_typeText2",true,false] call LHM_fnc_MP; 
 }; 
 
} else { 
// Soft Reset // 
 { 
 
  if(!isnil _x) then { 
   deleteVehicle (call compile _x); 
 
  }; 
 } foreach["fedFire1","fedFire2","fedFire3","fedFire4"]; 
 
 if(!isNil "safeAlarmSound") then { 
  deleteVehicle safeAlarmSound; 
 }; 
 
 Louisbox setPos [getPos Louisbox select 0, getPos Louisbox select 1, -100]; 
 
 Gericht_1 setvariable["Hack_done",nil,true]; 
 Gericht_1 setvariable["HACK_STATUS",nil,true]; 
 bankKeypad2 setvariable["done",nil,true]; 
 bankKeypad1 setvariable["done",nil,true]; 
 bankKeypad2 setvariable["tries",nil,true]; 
 bankKeypad1 setvariable["tries",nil,true]; 
 fed_bank setVariable["chargeplaced",false,true]; 
 fed_bank setVariable["chargecodewrong",nil,true]; 
 fed_bank setVariable["safe_open",false,true]; 
 
 fed_code = nil; 
 BankHeist_Team = nil; 
 BankHeistState = -1; 
 BankHeist_Way = nil; 
 BankHeist_isRunning = false; 
 Bankheist_TimeOut = nil; 
 publicVariable "BankHeistState"; 
 publicVariable "fed_code"; 
 publicVariable "BankHeist_Team"; 
 publicVariable "BankHeist_Way"; 
 publicVariable "BankHeist_isRunning"; 
 
 
 
 diag_log "Bank Heist: Progress & State resetet - SOFT RESET!"; 
 
 
};