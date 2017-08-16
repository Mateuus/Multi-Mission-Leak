#include <macro.hpp> 
/* 
 File: fn_renewObjectFunctions.sqf 
 Author: Blackd0g 
  
 Description: sets special functions to objects 
*/ 
private ["_object","_objPos","_name","_marker"]; 
 
_object = param [0,objNull,[objNull]]; 
 
if (isNull _object) exitWith {hint "Ungueltiges Objekt";}; 
 
 switch (typeOf _object) do {    
   
  case "Land_i_Garage_V1_F" : { 
   [_object] call build_fnc_moveGarageMarker; 
  };  
   
  case "Land_TentHangar_V1_F" : { 
   [_object] call build_fnc_moveGarageMarker; 
  };  
   
  case "Land_Atm_01_F" : { 
   
  };  
   
  case "Land_FuelStation_Feed_F" : { 
    
  };   
   
  case "Land_fs_feed_F" : { 
    
  };   
   
  case "Land_Cargo20_light_blue_F" : { 
    
  };   
   
  case "Land_Cargo40_blue_F" : { 
   
  }; 
   
  case "Land_Medevac_HQ_V1_F" : { 
    
  };          
   
  case "Land_CashDesk_F" : { 
    
  }; 
   
  case "Land_Metal_wooden_rack_F" : { 
    
  };     
   
  case "Land_ShelvesMetal_F" : { 
    
  }; 
 };