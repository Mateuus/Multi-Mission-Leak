Private ["_functions","_arguments"]; 
_functions = _this select 0; 
_arguments = _this select 1; 
 
{ 
 Private ["_function"];  
 if ((typename _x) == "STRING") then { 
  if ((!(_x == "")) && (!(_x == "lhm_fnc_master_server"))) then { 
   diag_log format["DEBUG: Master Server Init: Executing Function: %1",_x]; 
   _function = (call compile (_x)); 
   if ((typename _function) == "CODE") then { 
    _arguments call _function; 
   }; 
  }; 
 }; 
} foreach _functions;