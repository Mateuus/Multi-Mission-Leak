private["_name","_value","_side","_uid","_query","_queryResult","_data"]; 
_data = [_this,0,[],[[]]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param; 
_uid = [_this,2,"",[""]] call BIS_fnc_param; 
 
switch (_side) do { 
case west: { 
_query = format ["UPDATE whitelist SET westlevel = '%1' WHERE playerid = '%2'",_data,_uid]; 
}; 
case civilian: { 
 
}; 
case independent: { 
 
}; 
 
case east: { 
 
}; 
}; 
 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall;