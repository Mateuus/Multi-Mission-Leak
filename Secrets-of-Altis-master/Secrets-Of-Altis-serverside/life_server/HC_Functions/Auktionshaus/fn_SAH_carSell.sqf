 
 
 
 
 
 
 
private["_unit","_vehicle","_price","_cash"]; 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
 
 
if(isNull _vehicle OR isNull _unit) exitWith  
{ 
["life_action_inUse",false] remoteExecCall ["life_fnc_netSetVar",0]; 
}; 
 
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"); 
_unit = owner _unit; 
 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _dbInfo > 0) then { 
_uid = _dbInfo select 0; 
_plate = _dbInfo select 1; 
 
_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
 
[_query,1] call DB_fnc_asyncCall; 
}; 
 
deleteVehicle _vehicle; 
["life_action_inUse",false] remoteExecCall ["life_fnc_netSetVar",_unit];