 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_trunk","_query","_sql","_worldspace"]; 
 
_query = "DELETE FROM vehicle_mem"; 
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
{ 
_vInfo = _x getVariable["dbInfo",[]]; 
if (count _vInfo > 0) then 
{ 
if(isNull (_vInfo select 2)) then {_vInfo set[2,"objNull"]}; 
_inventory = _x getVariable ["Trunk",[[],0]]; 
_inventory = [_inventory] call DB_fnc_mresArray; 
_worldspace = getPos _x; 
_worldspace = [_worldspace] call DB_fnc_mresArray; 
_dir = direction _x; 
_plate = _vInfo select 1; 
_vInfo = [_vInfo] call DB_fnc_mresArray; 
_owners = _x getVariable["vehicle_info_owners",[]]; 
_owners = [_owners] call DB_fnc_mresArray; 
_insured = [_x getVariable ["insured",false],0] call DB_fnc_bool; 
_query = format["INSERT INTO vehicle_mem (`plate`,`worldspace`,`dir`,`inventory`,`info_owners`,`dbInfo`,`fuel`,`damage`,`class`,`insured`) VALUES ('%1','%2','%3','%4','%5','%6','%7','%8','%9','%10')", _plate, _worldspace, _dir, _inventory, _owners, _vInfo, round((fuel _x) * 100), round((damage _x) * 100), typeOf _x, _insured]; 
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
diag_log format["Inserted %1.", _x]; 
}; 
} foreach vehicles; 
 
 
[] call DB_fnc_flushAllPlayers; 
 
 
[] call DB_fnc_updateCaptures; 
 
 
{ 
_changed = _x getVariable["lootModified", false]; 
if (_changed) then 
{ 
[_x] call DB_fnc_updateStorage; 
}; 
} forEach life_storage_array; 
 
diag_log format["Doing vendor stock!"]; 
 
{ 
 
_value = _x select 1; 
if ((_x select 0) in buy_array) then 
{ 
_demand = (_x select 0) call life_fnc_itemDemand; 
_percent = (_value * 70) / _demand;  
if (_percent > 90) then { _percent = 90; }; 
if (_percent < 50) then { _percent = 50; }; 
_value = floor (_value - (_value * (_percent / 100))); 
}; 
 
_query = format["UPDATE `asylumlife%1`.`itemstock` SET `quantity`='%3' WHERE `className`='%2'", life_server_instance, _x select 0, _value]; 
[_query] call DB_fnc_asyncQuery; 
} forEach life_price_index; 
 
 
{ 
_query = format["UPDATE `asylumlife%1`.`gangs` SET `experience`='%2' WHERE `id`='%3'", life_server_instance, _x select 7, _x select 0]; 
[_query] call DB_fnc_asyncQuery; 
} forEach life_server_gangs_queue; 
life_server_gangs_queue = []; 
 
saveProfileNamespace; 
 
systemChat "Save complete, ready to die!"; 
diag_log "Save complete, ready to die!";