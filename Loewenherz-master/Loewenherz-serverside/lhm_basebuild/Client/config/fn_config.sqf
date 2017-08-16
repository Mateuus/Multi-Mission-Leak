#include <macro.hpp> 
 /* 
 File: fn_config.sqf 
 Author: Blackd0g 
 
 Description: 
 who can build stuff? 
*/ 
private ["_cfg","_gangId"]; 
 
_gangId = group player getVariable ["gang_id",0]; 
 
_cfg = []; 
 
// if (lhm_fms_group == "Adac") then { 
 //_cfg pushBack "Traffic"; 
// }; 
 
// if (playerSide == independent) then { 
    //_cfg pushBack "Traffic"; 
// }; 
 
if (playerSide == west) then { 
 _cfg pushBack "Traffic"; 
 _cfg pushBack "Police"; 
}; 
 
if (_gangId != 0) then { 
 _cfg pushBack "Optional"; 
 _cfg pushBack "Defense"; 
 _cfg pushBack "Lamps"; 
 _cfg pushBack "GangArea"; 
}; 
 
if (__GETC__(lhm_adminlevel) > 1) then { 
 _cfg pushBack "Admin"; 
}; 
 
_cfg;