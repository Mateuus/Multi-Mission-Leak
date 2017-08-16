/* 
 File: fn_varToStr.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Takes the long-name (variable) and returns a display name for our 
 virtual item. 
*/ 
private["_var"]; 
_var = param [0,"",[""]]; 
if(_var == "") exitWith {""}; 
 
switch (_var) do 
{      
 case "lhm_inv_NanoBots": {"Nano-Bots"}; 
 case "lhm_inv_Adrenalin": {"Adrenalin"}; 
 case "lhm_inv_SoylentGreen": {"Soylent Green"}; 
 case "lhm_inv_Satellite": {"Satellite Uplink"}; 
 case "lhm_inv_TazerMine": {"Tazer Mine"}; 
 case "lhm_inv_TazerBoundingMine": {"Tazer Bounding Mine"}; 
 case "lhm_inv_TripwireTazerMine": {"Tripwire Tazer Mine"};  
 case "lhm_inv_TazerGranade": {"Tazer Granade"}; 
 case "lhm_inv_roadbarrier": {"Roadbarrier"}; 
 case "lhm_inv_roadcone": {"Roadcone"}; 
 case "lhm_inv_speedtrap": {"Speedtrap"}; 
}; 
