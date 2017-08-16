/* 
 File: fn_chopShopSell.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Checks whether or not the vehicle is persistent or temp and sells it. 
*/ 
private["_unit","_vehicle","_price","_cash"]; 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_price = [_this,2,500,[0]] call BIS_fnc_param; 
_cash = [_this,3,0,[0]] call BIS_fnc_param; 
 
//Error checks 
if(isNull _vehicle OR isNull _unit) exitWith  
{ 
 ["life_action_inUse",false] remoteExec ["tanoarpg_fnc_netSetVar", -2,false]; 
}; 
 
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"); 
//_unit = owner _unit; //NEU DA HC OHNE OWNER 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
deleteVehicle _vehicle; 
 
 
if(count _dbInfo > 0) then { 
 _uid = _dbInfo select 0; 
 _plate = _dbInfo select 1; 
 
 _query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
 //waitUntil {!DB_Async_Active}; 
 _sql = [_query,1] call DB_fnc_asyncCall; 
}; 
 
["life_action_inUse",false] remoteExec ["tanoarpg_fnc_netSetVar",_unit,false]; 
["life_cash",_cash] remoteExec ["tanoarpg_fnc_netSetVar",_unit,false]; 
[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call tanoarpg_fnc_numberText]] remoteExec ["tanoarpg_fnc_broadcast",_unit,false];