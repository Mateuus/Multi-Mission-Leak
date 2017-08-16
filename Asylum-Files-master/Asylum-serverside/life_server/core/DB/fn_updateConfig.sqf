 
 
 
 
 
 
 
 
private ["_query","_HC","_update"]; 
 
_HC = false; 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
{ 
_update = true;  
if (!isNil "(life_configuration_last select _forEachIndex)") then 
{ 
if (_x == (life_configuration_last select _forEachIndex)) then 
{ 
_update = false; 
}; 
}; 
 
if (_update) then 
{ 
if (_forEachIndex in [2,9]) then { _x = [_x,0] call DB_fnc_bool; }; 
_query = format ["UPDATE `asylumlife%3`.`config` SET `value`='%1' WHERE `index`='%2'", _x, _forEachIndex, life_server_instance]; 
[_query] call DB_fnc_asyncQuery; 
}; 
} forEach life_configuration; 
 
life_configuration_last = + life_configuration;