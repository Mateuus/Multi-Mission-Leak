private["_unit","_id","_uid","_name"]; 
_unit = _this select 0; 
if(isNull _unit) exitWith {}; 
_id = _this select 1; 
_uid = _this select 2; 
_name = _this select 3; 
 
_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5]; 
{deleteVehicle _x;} forEach _containers; 
deleteVehicle _unit; 
