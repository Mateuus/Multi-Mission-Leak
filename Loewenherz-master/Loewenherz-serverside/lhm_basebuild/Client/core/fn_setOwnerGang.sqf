#include <macro.hpp> 
/* 
 File: fn_setOwnerGang.sqf 
 Author: Mario2002 
  
 Description: 
    sets the owner of a gang area flag pole 
*/ 
private ["_object","_worldspace","_classname"]; 
_object = cursorTarget; 
if (isNull _object) exitWith {}; 
 
_classname = typeOf _object; 
_worldspace = [round(direction _object),getPosATL _object]; 
 
if (lhm_flagpole_gangid != "") then {         
 lhm_flagpole_gangid = parseNumber (lhm_flagpole_gangid); 
}; 
 
[[lhm_flagpole_gangid,_classname,_worldspace,_object],"build_fnc_insertObject",false,false] call lhm_fnc_mp; 
 
sleep 1; 
 
lhm_flagpole_gangid = nil;