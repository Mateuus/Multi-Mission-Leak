 
 
 
 
 
 
 
_ownerID = _this select 0; 
_side = _this select 1; 
_query = ""; 
 
switch(_side) do { 
case west: {_query = "SELECT name, coplevel, activity FROM players WHERE coplevel != '0' AND adminlevel = '0'"}; 
case east: {_query = "SELECT name, adaclevel, activity FROM players WHERE adaclevel != '0' AND adminlevel = '0'"}; 
case independent: {_query = "SELECT name, mediclevel, activity FROM players WHERE mediclevel != '0' AND adminlevel = '0'"}; 
}; 
 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
[_queryResult] remoteExecCall ["SOCK_fnc_protocol",_ownerID];