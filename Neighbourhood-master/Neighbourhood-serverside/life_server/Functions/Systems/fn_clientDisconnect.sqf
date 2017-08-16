 
 
 
 
 
 
 
 
private["_uid","_name"]; 
_uid = _this select 0; 
_name = _this select 2; 
{ 
_pid = _x getVariable["steam64ID",""]; 
 
if(_uid == _pid OR _pid == "" OR owner _x < 3) then { 
_containers = nearestObjects[_x,["WeaponHolderSimulated"],5];  
{deleteVehicle _x;} foreach _containers;  
deleteVehicle _x;  
} 
} foreach playableUnits; 
 
_uid spawn TON_fnc_houseCleanup;