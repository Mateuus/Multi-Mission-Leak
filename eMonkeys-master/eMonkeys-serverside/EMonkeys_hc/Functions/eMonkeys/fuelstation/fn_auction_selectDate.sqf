/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Uses for the Fuelstations 
*/ 
private["_player","_query","_queryResult"]; 
_player = _this select 0; 
_id = _this select 1; 
 
_query = format ["SELECT date_format(leasedTo,'%1d.%1m.%1Y %1H:%1i:%1s') AS leasedTo FROM fuelstation WHERE id='%2'","%",_id]; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall;  
 
[[1,_queryResult select 0],"EMonkeys_fnc_endOfFuelstationAuction",_player,false] call EMonkeys_fnc_mp;