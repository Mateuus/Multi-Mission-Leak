 
 
 
 
 
 
 
 
private["_gang1","_gang2","_new","_query","_status"]; 
_gang1 = [_this,0,"0",["0"]] call BIS_fnc_param; 
_gang2 = [_this,1,"0",["0"]] call BIS_fnc_param; 
_new = [_this,2,true,[true]] call BIS_fnc_param; 
_query = ""; 
_status = false; 
 
if (_new) then 
{ 
_query = format["INSERT INTO `asylumlife%3`.`wars` (`gang1`,`gang2`) VALUES ('%1','%2')", _gang2, _gang1, life_server_instance]; 
_status = true; 
} 
else 
{ 
_query = format["DELETE FROM `asylumlife%3`.`wars` WHERE (`gang1` = '%1' AND `gang2` = '%2') OR (`gang1` = '%2' AND `gang2` = '%1')", _gang1, _gang2, life_server_instance]; 
}; 
 
{ 
if ((_x getVariable ["gang","0"]) != "0" && ((_x getVariable ["gang","0"]) == _gang1 || (_x getVariable ["gang","0"]) == _gang2)) then 
{ 
[[_gang1, _gang2, _status],"life_fnc_warStatus",_x,false] spawn life_fnc_MP; 
}; 
} forEach allPlayers; 
 
[_query] call DB_fnc_asyncQuery;