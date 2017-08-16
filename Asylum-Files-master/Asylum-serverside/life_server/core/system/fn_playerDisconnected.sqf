 
 
 
 
 
 
 
 
 
_name = _this select 0; 
_uid = _this select 1; 
_unit = _this select 2; 
{ 
if (typeName _x == "OBJECT") then 
{ 
_changed = _x getVariable["lootModified", false]; 
if (_changed) then 
{ 
[_x] spawn DB_fnc_updateStorage; 
sleep 2; 
}; 
}; 
} forEach life_storage_array; 
 
[objNull, objNull, false, true] call ASY_fnc_managePhone; 
[_uid] spawn DB_fnc_flushPlayer; 
[_uid] spawn ASY_fnc_cleanupStorage; 
[_uid] spawn ASY_fnc_cleanupHouses; 
[[_uid],"life_fnc_removeBounty",true,false] spawn life_fnc_MP; 
_side = east; 
_conn = -1; 
{ if (_x select 0 == _uid) then { _side = _x select 1; _conn = _forEachIndex; } } forEach life_connected; 
if (!(_side in [east])) then 
{ 
_i = count life_disconnects; 
{ if (_x select 0 == _uid) then { _i = _forEachIndex } } forEach life_disconnects; 
life_disconnects set [_i, [_uid,_side,time]]; 
life_connected set [_conn, 0]; 
life_connected = life_connected - [0]; 
}; 
 
_query = format["DELETE FROM `online` WHERE playerid='%1' AND `instance`=%2", _uid, life_server_instance]; 
[_query,1] call DB_fnc_asyncQuery; 
sleep 3; 
{ 
_pid = _x getVariable["steam64ID","0"]; 
if (_uid == _pid) then  
{ 
if (!isNull (_x getVariable["blindfold", objNull])) then { deleteVehicle (_x getVariable["blindfold"]); }; 
_containers = nearestObjects [_x,["WeaponHolderSimulated"],5];  
{deleteVehicle _x;} foreach _containers;  
deleteVehicle _x;  
}; 
} foreach allDeadMen; 
 
