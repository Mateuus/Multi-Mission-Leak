/* 
 File: fn_chopShopSellVeh.sqf 
*/ 
private["_unit","_vehicle","_price","_cash","_displayName","_dbInfo","_uid","_plate"]; 
_unit = param[0,objNull,[objNull]]; 
_vehicle = param[1,objNull,[objNull]]; 
_price = param[2,500,[0]]; 
_cash = param[3,0,[0]]; 
 
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"); 
 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _dbInfo > 0) then { 
 _uid = _dbInfo select 0; 
 _plate = _dbInfo select 1; 
 _insurance = _vehicle getVariable["insurance",false]; 
 [format["%3:%1:%2",_uid,_plate,if(_insurance) then {"updateVehicle4"}else{"updateVehicle3"}],1] call zero_fnc_asyncCall; 
}; 
deleteVehicle _vehicle; 
[3,[_cash,_displayName,_price]] remoteExecCall ["zero_fnc_yaxyEMy",(owner _unit)]; 
