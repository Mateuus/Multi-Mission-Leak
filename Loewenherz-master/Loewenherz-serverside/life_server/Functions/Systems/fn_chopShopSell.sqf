/* 
 File: fn_chopShopSell.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Checks whether or not the vehicle is persistent or temp and sells it. 
*/ 
private["_unit","_vehicle","_price","_cash"]; 
_unit = param [0,objNull,[objNull]]; 
_vehicle = param [1,objNull,[objNull]]; 
_price = param [2,500,[0]]; 
_cash = param [3,0,[0]]; 
 
//Error checks 
if(isNull _vehicle OR isNull _unit) exitWith  
{ 
 [["lhm_action_inUse",false],"lhm_fnc_netSetVar",nil,false] call lhm_fnc_mp; 
}; 
 
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"); 
_unit = owner _unit; 
 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _dbInfo > 0) then { 
 _uid = _dbInfo select 0; 
 _plate = _dbInfo select 1; 
 
 _query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
  
 _sql = [_query,1] call DB_fnc_asyncCall; 
}; 
 
deleteVehicle _vehicle; 
[["lhm_action_inUse",false],"lhm_fnc_netSetVar",_unit,false] call lhm_fnc_mp; 
[["lhm_cash",_cash],"lhm_fnc_netSetVar",_unit,false] call lhm_fnc_mp; 
[[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call lhm_fnc_numberText]],"lhm_fnc_broadcast",_unit,false] call lhm_fnc_mp;