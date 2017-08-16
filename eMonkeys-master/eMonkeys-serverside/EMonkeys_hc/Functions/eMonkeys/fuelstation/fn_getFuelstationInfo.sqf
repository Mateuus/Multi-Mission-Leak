/* 
 Author: DerOnkel 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Select Fueldates for Fuelmenu 
*/ 
private ["_player","_id","_query","_queryResult"]; 
_player = _this select 0; 
_id = _this select 1; 
 
_query = format ["SELECT owner,name,city, date_format(leasedOn,'%2d.%2m.%2Y %2H:%2i:%2s') AS leasedOn, date_format(leasedTo,'%2d.%2m.%2Y %2H:%2i:%2s') AS leasedTo FROM fuelstation WHERE id='%1'",_id,"%"]; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall;  
 
_query2 = format ["SELECT name FROM players WHERE playerid='%1'",(_queryResult select 0)select 0]; 
_queryResult2 = [_query2,2,true] call DB_fnc_asyncCall;  
 
[[_queryResult,_queryResult2],"EMonkeys_fnc_fuelstationInfo",_player,false] call EMonkeys_fnc_mp;