/*_uid = _this select 0; 
_body = _this select 1; 
_time =  diag_tickTime + (30 * 60); 
while{([_uid] call PGSERV_fnc_isUIDActive) && !isNull _body && diag_tickTime > _time} do { 
 sleep 10; 
}; 
if(!isNull _body) then {deleteVehicle _body}; 
*/