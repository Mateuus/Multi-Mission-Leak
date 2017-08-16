 
 
 
 
 
 
 
private["_query","_result","_ret","_id"]; 
 
_id = [_this,0,"0",["0"]] call BIS_fnc_param; 
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
 
if(!([_id] call life_fnc_isnumber)) exitWith {}; 
 
_query = format["INSERT INTO `asylumlife%1`.`votes` (`playerid`,`candidate`) VALUES ('%2','%3')", life_server_instance, getPlayerUID _unit, _id]; 
[_query] call DB_fnc_asyncQuery; 
 
[[1, format["Your ballot for the next Governor election has been received.  Thank you for completing your %1 civic duties!", worldName]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;