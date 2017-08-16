 
 
 
 
 
 
 
 
_player = _this select 1;  
_table = [_this,3,"log",[""]] call BIS_fnc_param; 
 
if (isNil "_player") exitWith {}; 
if (typeName _player != "OBJECT") exitWith {}; 
 
if (!(_table in ["log","keylog"])) exitwith {}; 
 
 
 
_HC = false; 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = format["INSERT INTO `%6` (playerid, playername, action, actionid, instanceid) VALUES ('%1', '%2', '%3', '%4', '%5')", getPlayerUID _player, name _player, _this select 2, _this select 0, life_server_instance, _table]; 
[_query] call DB_fnc_asyncQuery;