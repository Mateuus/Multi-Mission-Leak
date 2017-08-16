 
 
 
 
if (life_server_training) exitWith {}; 
private["_name", "_uid", "_crimes", "_bounty", "_jail", "_query", "_sql"]; 
 
_name = [_this,0,"",[""]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_crimes = [_this,2,[],[[],false]] call BIS_fnc_param; 
_bounty = [_this,3,0,[0]] call BIS_fnc_param; 
_jail = [_this,4,0,[0]] call BIS_fnc_param; 
 
_name = [_name, "\", ""] call KRON_Replace; 
_name = [_name, "'", ""] call KRON_Replace; 
_name = [_name, """", ""] call KRON_Replace; 
 
_crimes = [_crimes] call DB_fnc_mresArray; 
_HC = false; 
 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
_query = format["INSERT INTO `%6` (`playerid`, `name`, `crimes`, `bounty`, `jail`) VALUES ('%1', '%2', '%3', '%4', '%5') ON DUPLICATE KEY UPDATE `crimes`='%3', `bounty`='%4', `jail`='%5'", _uid, _name, _crimes, _bounty, _jail, srv_table_wanted]; 
[_query] call DB_fnc_asyncQuery;