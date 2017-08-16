 
 
 
 
 
 
 
private["_unit","_id","_uid","_name"]; 
_unit = _this select 0; 
if(isNull _unit) exitWith {}; 
_id = _this select 1; 
_uid = _this select 2; 
_name = _this select 3; 
 
_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5]; 
{deleteVehicle _x;} foreach _containers; 
deleteVehicle _unit; 
 
_uid spawn SOA_fnc_houseCleanup; 
 
(format["%1 ist in die Lobby zurückgekehrt.",_name]) remoteExecCall ["systemChat",0];