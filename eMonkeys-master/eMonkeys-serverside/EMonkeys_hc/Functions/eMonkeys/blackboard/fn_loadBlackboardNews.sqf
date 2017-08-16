_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
_query = format["SELECT message ,date_format(time,'%1d.%1m.%1Y %1H:%1i:%1s') AS time FROM blackboard ORDER BY time ASC","%"]; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
 
[[0,_queryResult],"EMonkeys_fnc_blackboard",_unit,false] call EMonkeys_fnc_mp;