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
  [false,"EMonkeys_action_inUsever",_unit,false] call EMonkeys_fnc_MP; 
}; 
 
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"); 
_unit = _unit; 
 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _dbInfo > 0) then { 
 _uid = _dbInfo select 0; 
 _plate = _dbInfo select 1; 
 
 _query = format["UPDATE vehicles SET alive='0', sell='1' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
 
 _sql = [_query,1] call DB_fnc_asyncCall; 
}; 
 
deleteVehicle _vehicle; 
 
[[_price,_displayName],"chopshopTransfer",_unit,false] call EMonkeys_fnc_MP;