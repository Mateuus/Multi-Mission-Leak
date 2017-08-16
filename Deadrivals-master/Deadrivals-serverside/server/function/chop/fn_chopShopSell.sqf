private["_unit","_vehicle","_price","_cash","_query"]; 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_price = [_this,2,500,[0]] call BIS_fnc_param; 
 
 
if(isNull _vehicle OR isNull _unit) exitWith  { 
NOCRIS_INUSE = false; 
(owner _unit) publicVariableClient "NOCRIS_INUSE" 
}; 
 
_displayName = getText(configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"); 
_unit = owner _unit; 
 
_dbInfo = _vehicle getvariable ["dbInfo",[]]; 
if(count _dbInfo > 0) then { 
_uid = _dbInfo select 0; 
_plate = _dbInfo select 1; 
_query = format ["UPDATE vehicles SET impound = '5', active = '0' WHERE pid = '%1' AND plate = '%2'",_uid,_plate]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
deleteVehicle _vehicle; 
NOCRIS_INUSE = false; 
_unit publicVariableClient "NOCRIS_INUSE"; 
[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call CLIENT_fnc_numberText]] remoteExecCall ["NETWORK_fnc_broadcast",_unit];