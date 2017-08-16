/* 
    Author: Bryan "Tonic" Boardwine 
 
    Description: 
    When a player disconnect it goes through the all the dead bodies 
    and removes bodies owned by the server. This is built for the new 
    medical / EMS system. 
*/ 
private["_unit","_id","_uid","_name"]; 
_unit = _this select 0; 
_id = _this select 1; 
_uid = _this select 2; 
_name = _this select 3; 
 
_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5]; 
{deleteVehicle _x;} foreach _containers; 
deleteVehicle _unit; 
 
[_uid, 16, "Verbindung getrennt"] remoteExec ["XYDB_fnc_log", XYDB]; 
[_uid] remoteExec ["XY_fnc_houseCleanup", XYDB];