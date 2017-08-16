 
 
 
 
 
 
 
private["_ret"]; 
 
_ret = [] call DB_fnc_queryHouses; 
 
if(isNil "_ret") exitWith {};