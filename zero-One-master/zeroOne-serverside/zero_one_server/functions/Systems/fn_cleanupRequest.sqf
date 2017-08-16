/* 
 File: fn_cleanupRequest.sqf 
*/ 
private["_client","_containers"]; 
_client = param[0,ObjNull,[ObjNull]]; 
if(isNull _client) exitWith {}; 
for "_i" from 0 to 15 step 1 do { 
 if(!alive _client) exitWith { 
  if(isnil {getpos _client}) exitWith {}; 
  if(isNil "_client" || {isNull _client}) exitWith {}; 
  _containers = nearestObjects[_client,["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"],3]; 
  if(!(_containers isEqualTo [])) then { 
   {deleteVehicle _x;} foreach _containers; 
  }; 
  deleteVehicle _client; 
 }; 
 sleep 1; 
}; 
