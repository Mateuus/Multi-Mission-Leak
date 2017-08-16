/* 
 File: fn_varHandle.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Master handler for getting a variables name, short name, etc. 
*/ 
private["_var","_mode"]; 
_var = param [0,"",[""]]; 
_mode = param [1,-1,[0]]; 
if(_var == "" OR _mode == -1) exitWith {""}; 
 
switch (_mode) do 
{ 
 case 0: 
 { 
  switch (_var) do 
  {   
   case "LHM_NanoBots": {"lhm_inv_NanoBots"}; 
   case "LHM_Adrenalin": {"lhm_inv_Adrenalin"}; 
   case "LHM_SoylentGreen": {"lhm_inv_SoylentGreen"}; 
   case "LHM_Satellite": {"lhm_inv_Satellite"}; 
   case "LHM_TazerMine": {"lhm_inv_TazerMine"}; 
   case "LHM_TazerBoundingMine": {"lhm_inv_TazerBoundingMine"}; 
   case "LHM_TripwireTazerMine": {"lhm_inv_TripwireTazerMine"}; 
   case "LHM_TazerGranade": {"lhm_inv_TazerGranade"}; 
   case "LHM_RoadBarrier": {"lhm_inv_roadbarrier"}; 
   case "LHM_Roadcone": {"lhm_inv_roadcone"}; 
   case "LHM_Speedtrap": {"lhm_inv_speedtrap"}; 
  }; 
 }; 
  
 case 1: 
 { 
  switch (_var) do 
  { 
   case "lhm_inv_NanoBots": {"LHM_NanoBots"}; 
   case "lhm_inv_Adrenalin": {"LHM_Adrenalin"}; 
   case "lhm_inv_SoylentGreen": {"LHM_SoylentGreen"}; 
   case "lhm_inv_Satellite": {"LHM_Satellite"}; 
   case "lhm_inv_TazerMine": {"LHM_TazerMine"}; 
   case "lhm_inv_TazerBoundingMine": {"LHM_TazerBoundingMine"}; 
   case "lhm_inv_TripwireTazerMine": {"LHM_TripwireTazerMine"}; 
   case "lhm_inv_TazerGranade": {"LHM_TazerGranade"}; 
   case "lhm_inv_roadbarrier": {"LHM_RoadBarrier"}; 
   case "lhm_inv_roadcone": {"LHM_Roadcone"}; 
   case "lhm_inv_speedtrap": {"LHM_Speedtrap"}; 
  }; 
 }; 
}; 
